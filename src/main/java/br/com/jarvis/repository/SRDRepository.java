package br.com.jarvis.repository;

import java.util.List;

import br.com.jarvis.model.SRD;
import br.com.jarvis.repository.stub.SRDStub;

public class SRDRepository implements Repository<SRD> {

	private SRDStub srdRepo = new SRDStub();
	
	@Override
	public SRD get(long id) {
		return srdRepo.get(id);
	}

	@Override
	public boolean add(SRD e) {
		return srdRepo.add(e);
	}

	@Override
	public boolean set(SRD e) {
		return srdRepo.set(e);
	}

	@Override
	public SRD remove(long id) {
		return srdRepo.remove(id);
	}

	public List<SRD> getAll(int idActivity) {
		return srdRepo.getAll(idActivity);
	}
	
}
