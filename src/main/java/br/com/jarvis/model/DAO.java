package br.com.jarvis.model;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;

public abstract class DAO<T> implements Serializable {
	private static final long serialVersionUID = 2971611064076646827L;
	private final transient Session session;
	
	protected DAO(Session session) {
		this.session = session;
	}
	
	public abstract Long getId();
	
	public boolean add() {
		Serializable saved = session.save(this);
		return getId() != null && getId().equals(saved);
	}
	
	public void update() {
		session.update(this);
	}
	
	@SuppressWarnings("unchecked")
	public List<T> getAll() {
		return session.createCriteria(this.getClass()).list();
	}
}
