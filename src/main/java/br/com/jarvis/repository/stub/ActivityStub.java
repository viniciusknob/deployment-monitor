package br.com.jarvis.repository.stub;

import java.util.ArrayList;
import java.util.List;

import br.com.jarvis.model.Activity;
import br.com.jarvis.repository.Repository;

public class ActivityStub implements Repository<Activity> {
	
	private static List<Activity> db = new ArrayList<Activity>();

	@Override
	public Activity get(long id) {
		return db.get(new Long(id).intValue());
	}

	@Override
	public boolean add(Activity e) {
		return db.add(e);
	}

	@Override
	public boolean set(Activity e) {
		db.set(e.getId().intValue(), e);
		return true;
	}

	@Override
	public Activity remove(long id) {
		return db.remove(new Long(id).intValue());
	}
	
	public List<Activity> getAll(int idChangeRequest) {
		List<Activity> list = new ArrayList<Activity>();
		for (Activity activity : db) {
			if (activity.getSm().getId().intValue() == idChangeRequest) {
				list.add(activity);
			}
		}
		return list;
	}

}
