package com.secneo.guard

public class Util {
    private static String BUILD_TIME = "2016-01-0610:48:21";
    private static String CPUABI = null;
	private static String VERSION_NAME = "1.0";
	private static ClassLoader cl = null;
	static byte[] hexDigits = new byte[]{0x30t, 0x31t, 0x32t, 0x33t, 0x34t, 0x35t, 0x36t, 0x37t, 0x38t, 0x39t, 0x41t, 0x42t, 0x43t, 0x44t, 0x45t, 0x46t};
    public static boolean isX86 = false;

	private static ArrayList<ContentProvider> ps = new ArrayList<ContentProvider>();
	public static Context x86Ctx = null;

    private static void CopyArmLib(Context ctx) {
	    String apkFilePath = ctx.getApplication().sourceDir;
		JarFile jarFile = null;
		try {
	        jarFile = new JarFile(apkFilePath);
		} catch (IOException e) {
		
		}
        JarEntry jarEntry = null;
		try {
		    Enumeration iter = jarFile.entries();
			while (iter.hasMoreElements()) {
			    jarEntry = (JarEntry) iter.nextElement();
				String jarEntryName = jarEntry.getName();
                if ("assets/libsecexe.so".equals(jarEntryName)) {
				    String soName = jarEntryName.replaceAll("assets/", "");
					String destName = "/data/data/" + ctx.getPackageName() + "/.cache/" + soName;
					realCopy(destName, jarFile, jarEntry);
				}
				if ("assets/libsecmain.so".equals(jarEntryName)) {
				    String soName = jarEntryName.replaceAll("assets/", "");
					String destName = "/data/data/" + ctx.getPackageName() + "/.cache/" + soName;
					realCopy(destName, jarFile, jarEntry);
				}
				if ("assets/libsecpreload.so".equals(jarEntryName)) {
					String soName = jarEntryName.replaceAll("assets/", "");
					String destName = "/data/data/" + ctx.getPackageName() + "/.cache/" + soName;
					realCopy(destName, jarFile, jarEntry);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			jarFile = null;
		}
	}

	private static void CopyBinaryFile(Context ctx) {
		String jarFileName = "/data/data/" + ctx.getPackageName() + "/.cache/classes.jar";
		String myDexOpeFile = "/data/data/" + ctx.getPackageName() + "/.cahce/" + ctx.getPackageName();
        String dex2oat = "/data/data" + ctx.getPackageName() + "/.cache/" + ctx.getPackageName() + ".art";
		File jarFile = new File(jarFileName);
		if (jarFile.length() == 0) {
			jarFile.delete();
		}
		if (!jarFile.exists()) {
			ACall.getACall().a1(ctx.getPackageName().getBytes(), ctx.getApplicationInfo().sourceDir.getBytes());
		}

		try {
			Process proc = Runtime.getRuntume().exec("chmod 755 " + myDexOptFile);
			proc.waitFor();
			proc = Runtime.getRuntime().exec("chmod 755 " + dex2oat);
			proc.waitFor();
			proc = Runtime.getRuntime().exec("chmod 755 " + dex2oat + ".20");
			proc.waitFor()
		} catch (Exception e) {
			e.rpintStackTrace();
		}
 	}

	private static CopyLib(Context ctx) {
		String apkFilePath = ctx.getApplicationINfo().sourceDir;
		JarFile jarFile = null;
		try {
			jarFile = new JarFile(apkFilePath);
		} catch (Exception e) {
		}
		JarEntry jarEntry = null;
		try {
			Enumeration iter = jarFile.entries();
			while (iter.hasMoreElements()) {
				jarEntry = iter.newxElement();
				String jarEntryName = jarEntry.getName();
				if ("assets/libsecexe.x86.so".equals(jarEntryName)) {
					String soName = jarEntryName.replaceAll("assets/", "");
					String destName = "/data/data/" + ctx.getPackageName() + "/.cache/" + soName;
					realCopy(destName, jarFile, jarEntry);
				}
				if ("assets/libsecmain.x86.so".equals(jarEntryName)) {
					String soName = jarEntryName.replaceAll("assets/", "");
					String destName = "/data/data/" + ctx.getPackageName() + "/.cache/" + soName;
					realCopy(destName, jarFile, jarEntry);
				}
				if ("assets/" + ctx.getPackageName() + ".x86".equals(jarEntryName)) {
					String soName = jarEntryName.replaceAll("assets/", "");
					String destName = "/data/data/" + ctx.getPackageName() + "/.cache/" + ctx.getPackageName();
					realCopy(destName, jarFile, jarEntry);
				}
				if ("assets/libsecpreload.x86.so".equals(jarEntryName)) {
					String soName = jarEntryName.replaceAll("assets/", "");
					String destName = "/data/data/" + ctx.getPackageName() + "/.cache/" + soName;
					realCopy(destName, jarFile, jarEntry);
				}
			}
		} catch (Exception e) {
		}
	}
	
	public static void addProvider(ContentProvider provider) {
		try {
			x86Ctx = provider.getContext();
			ACall.getACall().set5(provider);
		} catch (Exception e) {
		}
	}

	public static byte[] calFileMD5(String path) {
		FileInputStream input = new FileInputStream(path);
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		byte[] buffer = new byte[0x8000];
		int readed = 0;
		while ((readed = input.read(buffer)) > 0) {
		    out.write(buffer, 0, readed);
		}
		MessageDigiest md = MessageDigest.getInstance("MD5")
		md.update(out.toByteArray());
		return md.digest();
	}

	private static void checkSpace(Context ctx) {
		if (!Util.isSpaceEnough(ctx)) {
			long size = getDataSize();
			long classSize = getClassesJarSize(ctx);
			Log.e("SecApk", "Insufficient Space For SecApk available size:" + size + " classSize" + classSize);
			try {
				Runtime.getRuntime().exec("kill -9 " + Process.myPid());
			} catch (Exception e) {
			}
		}
	}
	
	private static void checkUpdate(Context ctx) {
		try{
			File f = new File("/data/data/" + ctx.getPackageName() + "/.cache/");
			PackageInfo pinfo = ctx.getPackageManager().getPackageInfo(ctx.getPackageName());
			int versionCode = pinfo.version;
			String versionName = pinfo.versionName;
			if (versionName == null) {
				versionName = VERSION_NAME;
			}
			File fversion = new File("/data/data/" + ctx.getPackageName() + "/.sec_version");
			if (!fversion.exist()) {
				deleteDirectory(f);
				writeVersion(fversion, versionCode, versionName);
			} else {
				String[] ret = readVersions(fversion);
				if (ret == null) {
					deleteDirectory(f);
					fverson.delete();
				} else {
					int localVersionCode = Integer.parseInt(ret[0]);
					String localVersionName = ret[1];
					if (!localVersionName.equals(versionName) || localVersionCode != versionCode) {
						deleteDirectory(f);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			File f = new File("/data/data/" + ctx.getPackageName() + "/.cache/");
			deleteDirectory(f);
			File fversion = new File("/data/data/" + ctx.getPackageName() + "/.sec_version");
			if (fversion.exist()) {
				fversion.delete();
			}
		}
	}

	private static void checkX86(Context ctx) {
		String cpuinfo = getCPUABI();
		isX86 = "x86".equals(cpuinfo); 
		if (isX86) {
			String libFileName = "/data/data/" + ctx.getPackageName() + "/.cache/" + ctx.getPackageName();
			File libFile = new File(libFileName);
			if (!libFile.exist()) {
				CopyLib(ctx);
			}
		} else {
			String armLibFileName = "/data/data/" + ctx.getPackageName() + "/.cache/libsecexe.so";
			File armLibFile = new File(armLibFileName);
			if (!armLibFile.exist()) {
				CopyArmLib(ctx);
			}
		}
	}

	private static void copyJarFile(Context ctx) {
		String jarFileName = "/data/data/" + ctx.getPackageName() + "/.cache/classes.jar";
		try {
			String apkFilePath = ctx.getApplicationInfo().sourceDir;
			JarFile jar = nwe JarFile(apkFilePath);
			Zipentry entry = jar.getEntry("assets/bangcle_classes.jar");
			File outfile = new File(jarFileName);
			byte[] buffer = new byte[0x10000];
			BufferedInputStream in = new BufferedInputStream(jar.getInputSream(entry));
			BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(outfile));
			int nBytes = 0;
			while ((nBytes = in.read(buffer)) > 0) {
				out.write(buffer, 0, nBytes);
			}
			out.flush();
			out.close();
			in.close();
		} cache (Exection e) {
		}
	}

	private static void createChildProcess(Context ctx) {
		String apkFilePath = ctx.getApplicationInfo().sourceDir;
		ACall.getACall().r1(ctx.getPackageName().getBytes(), apkFilePath.getBytes());
		try {
			ACall.getACall().jniCheckRawDexAvailable();
		} catch (Exception e) {
		}
	}

	private static boolean deleteDirectory(File path) {
		if (path.exist()) {
			File[] files = path.listFiles();
			for (int i = 0; i < files.length; i++) {
				if (files[i].isDirectory()) {
					deleteDireactory(files[i]);
				} else {
					files[i].delete();		
				}
			}
		}
		return path.delete();
	}

	public static void doCheck(Context ctx) {
		ApplicationInfo info = ctx.getApplication();
		File checkFile = new File(info.dataDir, ".md5");
		File targetFile = new File(info.dataDir, ".chche/classes.dex");
		String dexPath = "/data/dalvik-cache/";
		byte[] dexResult = null;
		File dexPathFile = new File("/data/dalvik-cache/arm/");
		if (dexPathFile.exist()) {
			dexPath = "/data/dalvik-cache/arm/";
		}
		String apkPath = info.sourceDir;
		StringTokenizer st = new StringTokenizer(apkPath, "/");
		while (st.hasMoreTokens()) {
			System.out.println(dexPath + st.nextToken() + "@");
		}
		dexPath = dexPath + "classes.dex";
		boolean todo = false;
		try {
			if (!checkFile.exist()) {
				if (toASC(calFileMD5(dexPath)) != null) {
					FileOutputStream chkOut = new FileOutputStream(checkFile);
					chkOut.write(toASC(calFileMD5(dexPath)));		
					chkOut.close();
				} else {
					todo = true;
					if (todo) {
						File f = new File("/data/data/" + ctx.getPackageName() + "/.cache/");
						deleteDireactory(f);
						try {
							FileOutputStream chkOut = new FileOutputStream(checkFile);
							chkOut.write(toASC(calFileMD5(dexPath)));
							chkOut.close();
						} catch (Exception e) {
						
						}
					}
				}
				
			} else {
				if (toASC(calFileMD5(dexPath)) != null) {
					byte[] md5 = readFile(checkFile);
					if (md5 != null) {
						
					}
				}
			}
		}
	}
}
