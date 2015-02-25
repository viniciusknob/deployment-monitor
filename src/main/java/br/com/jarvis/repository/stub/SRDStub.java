package br.com.jarvis.repository.stub;

import java.util.ArrayList;
import java.util.List;

import br.com.jarvis.model.SRD;
import br.com.jarvis.repository.Repository;

public class SRDStub implements Repository<SRD> {
	
	private static List<SRD> db = new ArrayList<SRD>();
	
	@Override
	public SRD get(long id) {
		return db.get(new Long(id).intValue());
	}

	@Override
	public boolean add(SRD e) {
		return db.add(e);
	}

	@Override
	public boolean set(SRD e) {
		db.set(e.getId().intValue(), e);
		return true;
	}

	@Override
	public SRD remove(long id) {
		return db.remove(new Long(id).intValue());
	}
	
	public List<SRD> getAll(int idActivity) {
		List<SRD> list = new ArrayList<SRD>();
		for (SRD srd : db) {
			if (srd.getActivity().getId().intValue() == idActivity) {
				list.add(srd);
			}
		}
		return list;
	}

}
