package br.com.jarvis.control;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Consumes;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.view.Results;
import br.com.jarvis.model.Activity;
import br.com.jarvis.model.Revision;
import br.com.jarvis.model.ChangeRequest;
import br.com.jarvis.repository.ActivityRepository;
import br.com.jarvis.repository.ChangeRequestRepository;
import br.com.jarvis.svn.SVNRepo;

@Path("/api")
@Controller
public class APIController extends SuperController {
	
	@Inject
	private ChangeRequestRepository smRepo;
	
	@Inject
	private ActivityRepository acRepo;
	
	@Path("/sm/{id}")
	@Consumes({ "application/json" })
	public void getSM(Long id) {
		ChangeRequest sm = smRepo.get(id);
		result.use(Results.json()).from(sm).include("atividades").serialize();
	}

	@Path("/atividade/{id}")
	@Consumes({ "application/json" })
	public void getRevisions(Long id) {
		Activity atividade = acRepo.get(id);
		List<Revision> svnRevisions = SVNRepo.getRevisions(atividade.getBranch());
		result.use(Results.json()).from(svnRevisions).serialize();
	}
	
}
