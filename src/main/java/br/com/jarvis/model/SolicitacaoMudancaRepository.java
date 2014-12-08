package br.com.jarvis.model;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;

import br.com.jarvis.persistence.HibernateUtil;

// TODO Alterar nome para SMRepository ou ChangeRequestRepository
public class SolicitacaoMudancaRepository implements Repository<SolicitacaoMudanca> {
	
	@Override
	public SolicitacaoMudanca get(long id) {
		return DAO.get(SolicitacaoMudanca.class, new Long(id));
	}
	
	@Override
	public boolean add(SolicitacaoMudanca e) {
		return DAO.saveOrUpdate(e);
	}
	
	@Override
	public boolean set(SolicitacaoMudanca e) {
		return DAO.saveOrUpdate(e);
	}
	
	@Override
	public SolicitacaoMudanca remove(long id) {
		return DAO.delete(SolicitacaoMudanca.class, new Long(id));
	}

	@SuppressWarnings("unchecked")
	public Set<SolicitacaoMudanca> getAll() {
		Session session = HibernateUtil.getSession();
		try {
			return new HashSet<SolicitacaoMudanca>(session.createCriteria(SolicitacaoMudanca.class).list());
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return Collections.emptySet();
	}
	
}
