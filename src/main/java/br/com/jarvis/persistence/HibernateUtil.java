package br.com.jarvis.persistence;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	
	private static SessionFactory sf = buildSessionFactory();
	
	public static Session getSession() {
		return sf.openSession();
	}

	private static SessionFactory buildSessionFactory() {
		Configuration cfg = new Configuration().configure("/hibernate.cfg.xml");
		if (Boolean.getBoolean("test")) {
			cfg.setProperty("hibernate.connection.url", "jdbc:hsqldb:mem:DeploymentMonitorDB");
		}
		StandardServiceRegistryBuilder ssrb = new StandardServiceRegistryBuilder();
		StandardServiceRegistry serviceRegistry = ssrb.applySettings(cfg.getProperties()).build();
		return cfg.buildSessionFactory(serviceRegistry);
	}

}
