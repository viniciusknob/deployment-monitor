package br.com.jarvis.control;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.jarvis.model.DAO;
import br.com.jarvis.model.SolicitacaoMudanca;

@Path("/sm")
@Controller
public class SolicitacaoMudancaController extends SuperController {
	@Path("")
	public void list() {
		result.include("list", DAO.getAll(SolicitacaoMudanca.class));
	}
	
	@Post("/save")
	public void save(SolicitacaoMudanca sm) {
		sm.add();
		result.redirectTo(this).list();
	}
}
