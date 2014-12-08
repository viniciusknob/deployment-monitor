package br.com.jarvis.svn;

import org.tmatesoft.svn.core.auth.BasicAuthenticationManager;
import org.tmatesoft.svn.core.auth.ISVNAuthenticationManager;
import org.tmatesoft.svn.core.wc.SVNWCUtil;

public enum SVNAuth {
	
	BASIC {
		@Override
		public ISVNAuthenticationManager get(String user, String pass) {
			return SVNWCUtil.createDefaultAuthenticationManager(user, pass);
		}
	}, 
	DEFAULT {
		@Override
		public ISVNAuthenticationManager get(String user, String pass) {
			return new BasicAuthenticationManager(user, pass);
		}
	};
	
	public abstract ISVNAuthenticationManager get(String user, String pass);

}