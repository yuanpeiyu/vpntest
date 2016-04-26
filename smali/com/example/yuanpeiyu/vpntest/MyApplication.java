package com.example.yuanpeiyu.vpntest

public class MyApplication extents Application {
	public static String FirstApplication;
	public static Application realApplication;
	private DexClassLoader cl;
	static MyApplication() {
	    realApplication = null;
		FirstApplication = "com.example.yuanpeiyu.vpntest.MyApplication";
	}

	public MyApplication() {
	    MyApplication();
	}

	public void onConfigurationChanged(Configuration conf) {
	    super.onConfigurationChanged(conf);
		if (realApplication != null) {
		    realApplication.onConfigurationChanged(conf);
		}
	}

	public void onCreate() {
	    super.onCreate();
		if (Util.getCustomClassLoader() == null) {
		    Util.runAll(this);
		}
		String applicationClass = FirstApplication;
		try {
			cl = Util.getCustomClassLoader();
			Class c = cl.loadClass(applicationClass);
			realApplication = c.newInstance();
		} catch (Exception e) {
		    e.printTrace();
			realApplication = null;
		}
		if (realApplication != null) {
		    ACall p = ACall.getACall();
			p.set2(this, realApplication, cl, getBaseContext());
			p.at1(realApplication, getBaseContext());
			try {
			    if (Float.parse(Build.VERSION.RELEASE.subString(0, 3)) <= 0x40066666) {
					p.set3(realApplication);
				}
			} catch (Exception e) {
			
			}
			Util.doProvider();
			realApplication.onCreate();
			try {
			    p.set8();
			} catch (Exception e) {
			
			}
 		}
	}

	public void onLowMemory() {
	    super.onLowMemory();
		if (realApplication != null) {
			realApplicatin.onLowMemory();
		}
	}

	public void onTerminate() {
	    super.onTerminate();
		if (realApplication != null) {
		    realApplication.onTerminate();
		}
	}

	public void onTrimMemory(int level) {
		try {
			super.onTrimMemory(level);	
			if (realApplication != null) {
				realApplication.onTrimMemory();
			}
		} catch (Exception e) {}
	}
}
