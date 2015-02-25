package br.com.jarvis.repository.stub;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import br.com.jarvis.model.ChangeRequest;
import br.com.jarvis.repository.Repository;

public class ChangeRequestStub implements Repository<ChangeRequest> {

	private static List<ChangeRequest> db = new ArrayList<ChangeRequest>();
	
	@Override
	public ChangeRequest get(long id) {
		return db.get(new Long(id).intValue());
	}

	@Override
	public boolean add(ChangeRequest e) {
		return db.add(e);
	}

	@Override
	public boolean set(ChangeRequest e) {
		db.set(e.getId().intValue(), e);
		return true;
	}

	@Override
	public ChangeRequest remove(long id) {
		return db.remove(new Long(id).intValue());
	}
	
	public List<ChangeRequest> getAll(int limit) {
		while (db.size() < limit) { 
			ChangeRequest sm = new ChangeRequest();
			sm.setId(new Long(db.size()+1));
			sm.setNome("2357"+db.size()+": Uma demanda qualquer");
			sm.setData(new Date());
			db.add(sm);
		}
		return Collections.unmodifiableList(db);
	}
	
}
