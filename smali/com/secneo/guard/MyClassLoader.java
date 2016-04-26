package com.secneo.guard

public class MyClassLoader extends DexClassLoader {
    private ClassLoader mClassLoader;

    public MyClassLoader (Srting dexPath, String optimizedDirectory, String libraryPath, ClassLoader cl) {
	    super.(dexPath, optimizedDirectory, libraryPath, cl.getParent());
		mClassLoader = cl;
		Thread.currentThread().setContextClassLoader(this);
	}

	public URL getResource(String resName) {
	    return mClassLoader.getResource(resName);
	}

	public InputStream getResourceAsStream(String resName) {
	    return mClassLoader.getResourceAsStream(resName);
	}

	public Enumeration<URL> getResources(String resName) {
	    return mClassLoader.getResources(resName);
	}
}
