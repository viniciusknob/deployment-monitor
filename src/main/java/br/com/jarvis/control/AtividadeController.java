package br.com.jarvis.control;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.view.Results;
import br.com.jarvis.model.AtividadeRepository;
import br.com.jarvis.model.SolicitacaoMudanca;
import br.com.jarvis.model.SolicitacaoMudancaRepository;

@Path("/atividade")
@Controller
public class AtividadeController extends SuperController {
	
	@Inject
	private SolicitacaoMudancaRepository smRepo;

	@Inject
	private AtividadeRepository acRepo;
	
	@Get
	public void list(SolicitacaoMudanca sm) {
		sm = smRepo.get(sm.getId());
		result.use(Results.json()).withoutRoot().from(sm.getAtividades()).serialize();
	}
	
	@Post
	public void remove(long id) {
		result.use(Results.json()).withoutRoot().from(acRepo.remove(id)).serialize();
	}
	
}
