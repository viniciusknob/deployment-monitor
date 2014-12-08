package br.com.jarvis.svn;

import org.junit.Test;

public class SVNConfigTest {
	
	@Test(expected=NullPointerException.class)
	public void getResourceAbsent() {
		SVNConfig.getResource("/appengine.xml");
	}
	
	@Test
	public void getResourceExistent() {
		SVNConfig.getResource("/svn.cfg.json");
	}

	@Test
	public void loadInstance() {
		SVNConfig.loadInstance();
	}

}
