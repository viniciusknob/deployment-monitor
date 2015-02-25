package br.com.jarvis.control;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.view.Results;
import br.com.jarvis.model.Activity;
import br.com.jarvis.model.Revision;
import br.com.jarvis.model.ChangeRequest;
import br.com.jarvis.repository.ActivityRepository;
import br.com.jarvis.repository.ChangeRequestRepository;
import br.com.jarvis.svn.SVNRepo;

@Path("/atividade")
@Controller
public class AtividadeController extends SuperController {
	
	@Inject
	private ChangeRequestRepository smRepo;

	@Inject
	private ActivityRepository acRepo;
	
	@Get
	public void list(ChangeRequest sm) {
		sm = smRepo.get(sm.getId());
		result.use(Results.json()).withoutRoot().from(sm.getAtividades()).serialize();
	}
	
	@Get
	public void getRevisions(Activity atividade) {
		atividade = acRepo.get(atividade.getId());
		List<Revision> svnRevisions = SVNRepo.getRevisions(atividade.getBranch());
		result.use(Results.json()).withoutRoot().from(svnRevisions).serialize();
	}
	
	@Post
	public void remove(long id) {
		result.use(Results.json()).withoutRoot().from(acRepo.remove(id)).serialize();
	}
	
}
