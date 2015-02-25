package br.com.jarvis.repository;

import java.util.List;

import br.com.jarvis.model.ChangeRequest;
import br.com.jarvis.repository.stub.ChangeRequestStub;

public class ChangeRequestRepository implements Repository<ChangeRequest> {
	
	private ChangeRequestStub crRepo = new ChangeRequestStub(); 
	
	@Override
	public ChangeRequest get(long id) {
		return crRepo.get(id);
	}

	@Override
	public boolean add(ChangeRequest e) {
		return crRepo.add(e);
	}

	@Override
	public boolean set(ChangeRequest e) {
		return crRepo.set(e);
	}

	@Override
	public ChangeRequest remove(long id) {
		return crRepo.remove(id);
	}

	public List<ChangeRequest> getAll(int limit) {
		return crRepo.getAll(limit);
	}
	
}
