package br.com.jarvis.model;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public abstract class DAO implements Serializable {
	private static final long serialVersionUID = 2971611064076646827L;
	private static final Session session;
	
	static {
		Configuration cfg = new Configuration().configure("/hibernate.cfg.xml");
		if (Boolean.getBoolean("test")) {
			cfg.setProperty("hibernate.connection.autocommit", "false");
			cfg.setProperty("hibernate.connection.url", "jdbc:hsqldb:mem:DeploymentMonitorDB");
		}
		StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
		session = cfg.buildSessionFactory(serviceRegistry).openSession();
	}
	
	public abstract Long getId();
	
	public boolean add() {
		Serializable saved = session.save(this);
		return getId() != null && getId().equals(saved);
	}
	
	public void update() {
		session.update(this);
	}
	
	public void delete() {
		session.delete(this);
	}
	
	public static <T> T getByID(Class<T> type, long id) {
		String hql = new StringBuilder("from ").append(type.getSimpleName()).append(" t where t.id = :id").toString();

		Query query = session.createQuery(hql).setParameter("id", id);

		return type.cast(query.uniqueResult());
	}
	
	public static boolean delete(Class<?> type, long id) {
		String hql = new StringBuilder("delete from ").append(type.getSimpleName()).append(" t where t.id = :id").toString();

		Query query = session.createQuery(hql).setParameter("id", id);

		return 1 == query.executeUpdate();
	}
	
	@SuppressWarnings("unchecked")
	public static <T extends DAO> List<T> getAll(Class<T> type) {
		return (List<T>) session.createCriteria(type).list();
	}
	
	public static Transaction getTransaction() {
		return session.beginTransaction();
	}
}
