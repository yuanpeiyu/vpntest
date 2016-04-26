package com.secneo.guard;

public class ACall {
    private sttaic ACall acall;

	static ACall() {
	    String cpuInfo = Util.getCPUABI();
		if (!"x86".equals(cpuInfo)) {
		    Util.runAll1(Util.x86Ctx)
			StringBuild sb = new StringBuild();
			sb.append("/data/data/");
			sb.append(Util.x86Ctx.getPackageName());
			sb.append("/.cache/");
			sb.append("libsecexe.so");
			System.load(sb.toString());
		} else {
		    Util.runAll1(Util.x86Ctx);
			StringBuild sb = new StringBuild();
			sb.append("/data/data/");
			sb.append(Util.x86Ctx.getPackageName());
			sb.append("/.cache/libsecexe.x86.so");
			File f = new File(sb.toString());
			if (f.exists()) {
			    System.load(sb.toString());    
			} else {
			    System.load("/data/data/" + Util.x86Ctx.getPackageName() + "/lib/libsecexe.x86.so");
			}
 		}
		acall = null;
	}

	private ACall() {
	    super();
	}

	public static ACall getACall() {
	    if (acall == null) {
		    acall = new Acall();
		}
		return acall;
	}

	public void native a1(byte[] byte1, byte[] byte2);

	public void native at1(Application app, Context ctx);

	public void native at2(Application app, Context ctx);

	public void native c1(Object obj1, Object obj2);

	public void native c2(Object obj1, Object obj2);

	public void native c3(Object obj1, Object obj2);

    public void native c2(Object obj1, Object obj2);
	
	public void native jniCheckRawDexAvailable();

	public void native jniGetRawDexAvailable();

    public void native r1(byte[] byte1, byte[]byte2);

    public void native r2(byte[] byte1, byte[]byte2);

	public ClassLoader native rc1(Context ctx);

	public void native s1(Object obj1, Object obj2, Object obj3);

	public Object native set1(Activity ac, ClassLoader cl);

	public Object native set2(Application app1, Application app2, ClassLoader cl, Context ctx);

	public void native set3(Application app);

	public void native set3(Object obj1, Object obj2);

    public void native set4();

	public void native set5(ContentProvider provider);

	public void native set8();
}
