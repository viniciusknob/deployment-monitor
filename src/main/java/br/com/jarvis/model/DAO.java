package br.com.jarvis.model;

import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.jarvis.persistence.HibernateUtil;

public class DAO {
	
	@SuppressWarnings("unchecked")
	public static <T> T get(Class<T> type, long id) {
		Session session = HibernateUtil.getSession();
		try {
			return (T) session.get(type, id);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	
	public static boolean saveOrUpdate(Object obj) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.saveOrUpdate(obj);
			tx.commit();
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			if (tx!=null) tx.rollback();
		} finally {
			session.flush();
			session.close();
		}
		return false;
	}
	
	@SuppressWarnings("unchecked")
	public static <T> T delete(Class<T> type, long id) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			T t = (T) session.get(type, id);
			session.delete(t);
			tx.commit();
			return t;
		} catch (Exception ex) {
			ex.printStackTrace();
			if (tx!=null) tx.rollback();
		} finally {
			session.close();
		}
		return null;
	}
	
}
