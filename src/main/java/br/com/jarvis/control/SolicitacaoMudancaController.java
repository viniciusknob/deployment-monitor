package br.com.jarvis.control;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.view.Results;
import br.com.jarvis.model.SolicitacaoMudancaRepository;

@Path("/sm")
@Controller
// TODO Alterar nome para SMController ou ChangeRequestController
public class SolicitacaoMudancaController extends SuperController {
	
	@Inject
	private SolicitacaoMudancaRepository smRepo;
	
	@Get
	public void list() {
		result.use(Results.json()).withoutRoot().from(smRepo.getAll()).serialize();
	}
	
	@Post
	public void remove(long id) {
		result.use(Results.json()).withoutRoot().from(smRepo.remove(id)).serialize();
	}
	
}
