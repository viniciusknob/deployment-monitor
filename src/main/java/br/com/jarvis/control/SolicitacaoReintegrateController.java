package br.com.jarvis.control;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.jarvis.model.SolicitacaoMudancaRepository;

@Path("/sr")
@Controller
public class SolicitacaoReintegrateController extends SuperController {
	
	@Inject
	private SolicitacaoMudancaRepository smRepo;

	@Path("/add")
	public void add() {
		result.include("listSM", smRepo.getAll());
	}
}
