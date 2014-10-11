package br.com.jarvis.control;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.view.Results;
import br.com.jarvis.model.DAO;
import br.com.jarvis.model.SolicitacaoMudanca;

@Path("/sr")
@Controller
public class SolicitacaoReintegrateController extends SuperController {

	@Path("/add")
	public void add() {
		result.include("listSM", DAO.getAll(SolicitacaoMudanca.class));
	}

	@Path("/sm/{id}")
	public void filter(Long id) {
		SolicitacaoMudanca sm = DAO.getByID(SolicitacaoMudanca.class, id);
		result.use(Results.json()).from(sm).include("atividades").serialize();
	}
}
