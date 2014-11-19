package br.com.jarvis.persistence;

import org.hibernate.Session;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	
	private static Configuration cfg = new Configuration().configure("/hibernate.cfg.xml");
	
	public static Session getSession() {
		if (Boolean.getBoolean("test")) {
			cfg.setProperty("hibernate.connection.url", "jdbc:hsqldb:mem:DeploymentMonitorDB");
		}
		StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
		return cfg.buildSessionFactory(serviceRegistry).openSession();
	}

}
