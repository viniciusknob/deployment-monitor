package br.com.jarvis.model;

import javax.inject.Inject;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.jarvis.persistence.HibernateUtil;

//TODO Alterar nome de classe para ActivityRepository
public class AtividadeRepository implements Repository<Atividade> {
	
	@Inject
	private SolicitacaoMudancaRepository smRepo;
	
	@Override
	public Atividade get(long id) {
		return DAO.get(Atividade.class, new Long(id));
	}
	
	@Override
	public boolean add(Atividade e) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			String sql = "INSERT INTO ATIVIDADE(descricao,branch,sm_id) VALUES(?,?,?)";
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter(0, e.getDescricao());
			query.setParameter(1, e.getBranch());
			query.setParameter(2, e.getSm().getId());
			int result = query.executeUpdate();
			tx.commit();
			return result == 1;
		} catch (Exception ex) {
			ex.printStackTrace();
			if (tx!=null) tx.rollback();
		} finally {
			session.flush();
			session.close();
		}
		return false;
	}
	
	@Override
	public boolean set(Atividade e) {
		SolicitacaoMudanca sm = smRepo.get(e.getSm().getId());
		e.setSm(sm);
		return e.getId() == null ? add(e) : DAO.saveOrUpdate(e);
	}
	
	@Override
	public Atividade remove(long id) {
		return DAO.delete(Atividade.class, new Long(id));
	}
	
}
