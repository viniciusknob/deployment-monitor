package br.com.jarvis.control;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.jarvis.model.Activity;
import br.com.jarvis.model.ChangeRequest;
import br.com.jarvis.repository.ActivityRepository;
import br.com.jarvis.repository.ChangeRequestRepository;

@Path("/admin")
@Controller
public class AdminController extends SuperController {
	
	@Inject
	private ChangeRequestRepository smRepo;
	
	@Inject
	private ActivityRepository acRepo;

	@Path("")
	public void index() {}
	
	@Post
	public void saveSM(ChangeRequest sm) {
		smRepo.set(sm);
		result.redirectTo(this).index();
	}
	
	@Post
	public void saveActivity(Activity atividade) {
		acRepo.set(atividade);
		result.redirectTo(this).index();
	}
}
