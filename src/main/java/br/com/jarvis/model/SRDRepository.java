package br.com.jarvis.model;

import java.util.Date;

import javax.inject.Inject;

public class SRDRepository implements Repository<SRD> {
	
	@Inject
	private AtividadeRepository acRepo;

	@Override
	public SRD get(long id) {
		return DAO.get(SRD.class, id);
	}

	@Override
	public boolean add(SRD e) {
		/*
		 * Hibernate: insert into SRD (id, atividade_id, data, motivo, revisions, status) values (default, ?, ?, ?, ?, ?)
		 */
		e.setData(new Date());
		return DAO.saveOrUpdate(e);
	}

	@Override
	public boolean set(SRD e) {
		Atividade a = acRepo.get(e.getAtividade().getId());
		e.setAtividade(a);
		return e.getId() == null ? add(e) : DAO.saveOrUpdate(e);
	}

	@Override
	public SRD remove(long id) {
		return DAO.delete(SRD.class, id);
	}

}
