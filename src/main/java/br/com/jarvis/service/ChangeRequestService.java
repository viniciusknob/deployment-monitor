package br.com.jarvis.service;

import java.util.List;

import javax.inject.Inject;

import br.com.jarvis.model.ChangeRequest;
import br.com.jarvis.repository.ChangeRequestRepository;

public class ChangeRequestService {
	
	private final ChangeRequestRepository repository;
	
	 /**
     * @deprecated CDI eyes only
     */
    protected ChangeRequestService() {
        this(null);
    }
	
    @Inject
	public ChangeRequestService(ChangeRequestRepository repository) {
		this.repository = repository;
	}
	
	public ChangeRequest getChangeRequest(Long id) {
		return repository.get(id);
	}

	public List<ChangeRequest> getAllActive() {
		return null;
	}

}
