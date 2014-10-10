package br.com.jarvis.control;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.jarvis.model.DAO;
import br.com.jarvis.model.SolicitacaoMudanca;

@Path("/sr")
@Controller
public class SolicitacaoReintegrateController extends SuperController {

	@Path("/add")
	public void add() {
		result.include("listSM", DAO.getAll(SolicitacaoMudanca.class));
	}
}
