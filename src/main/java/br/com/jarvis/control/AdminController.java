package br.com.jarvis.control;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.jarvis.model.Atividade;
import br.com.jarvis.model.AtividadeRepository;
import br.com.jarvis.model.SolicitacaoMudanca;
import br.com.jarvis.model.SolicitacaoMudancaRepository;

@Path("/admin")
@Controller
public class AdminController extends SuperController {
	
	@Inject
	private SolicitacaoMudancaRepository smRepo;
	
	@Inject
	private AtividadeRepository acRepo;

	@Path("")
	public void index() {}
	
	@Post
	public void saveSM(SolicitacaoMudanca sm) {
		smRepo.set(sm);
		result.redirectTo(this).index();
	}
	
	@Post
	public void saveActivity(Atividade atividade) {
		acRepo.set(atividade);
		result.redirectTo(this).index();
	}
}
