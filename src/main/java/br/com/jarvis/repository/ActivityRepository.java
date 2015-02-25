package br.com.jarvis.repository;

import br.com.jarvis.model.Activity;
import br.com.jarvis.repository.stub.ActivityStub;

public class ActivityRepository implements Repository<Activity> {
	
	private ActivityStub acRepo = new ActivityStub();
	
	@Override
	public Activity get(long id) {
		return acRepo.get(id);
	}
	
	@Override
	public boolean add(Activity e) {
		return acRepo.add(e);
	}
	
	@Override
	public boolean set(Activity e) {
		return acRepo.set(e);
	}
	
	@Override
	public Activity remove(long id) {
		return acRepo.remove(id);
	}
	
}
