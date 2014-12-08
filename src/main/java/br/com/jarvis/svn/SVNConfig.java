package br.com.jarvis.svn;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public final class SVNConfig {
	
	private static final String SVN_CFG_PATH = "/svn.cfg.json";
	
	private String repositoryBaseURL;
	private String user;
	private String pass;

	SVNConfig(JsonObject conf) {
		repositoryBaseURL = conf.get("repositoryBaseURL").getAsString();
		user = conf.get("user").getAsString();
		pass = conf.get("pass").getAsString();
	}

	public static SVNConfig loadInstance() {
		JsonParser parser = new JsonParser();
		JsonObject conf = parser.parse(getResource(SVN_CFG_PATH)).getAsJsonObject();
		return new SVNConfig(conf);
	}
	
	static Reader getResource(String path) {
		InputStream is = SVNConfig.class.getResourceAsStream(path);
		return new InputStreamReader(is);
	}
	
	public String getRepositoryBaseURL() {
		return repositoryBaseURL;
	}
	
	public String getUser() {
		return user;
	}
	
	public String getPass() {
		return pass;
	}
	
}