package br.com.jarvis.model;


//TODO Alterar nome de classe para ActivityRepository
public class AtividadeRepository implements Repository<Atividade> {
	
	@Override
	public Atividade get(long id) {
		return null;
	}
	
	@Override
	public boolean add(Atividade e) {
		return false;
	}
	
	@Override
	public boolean set(Atividade e) {
		return false;
	}
	
	@Override
	public Atividade remove(long id) {
		return null;
	}
	
}
