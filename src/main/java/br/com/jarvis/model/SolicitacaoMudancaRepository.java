package br.com.jarvis.model;

import java.util.List;


// TODO Alterar nome para SMRepository ou ChangeRequestRepository
public class SolicitacaoMudancaRepository implements Repository<SolicitacaoMudanca> {

	@Override
	public SolicitacaoMudanca get(long id) {
		return null;
	}

	@Override
	public boolean add(SolicitacaoMudanca e) {
		return false;
	}

	@Override
	public boolean set(SolicitacaoMudanca e) {
		return false;
	}

	@Override
	public SolicitacaoMudanca remove(long id) {
		return null;
	}

	public List<SolicitacaoMudanca> getAll() {
		return null;
	}
	
}
