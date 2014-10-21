package br.com.jarvis.control;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.jarvis.model.DAO;
import br.com.jarvis.model.SolicitacaoMudanca;

@Path("/admin")
@Controller
public class AdminController extends SuperController {

	@Path("")
	public void index() {
		result.include("sms", DAO.getAll(SolicitacaoMudanca.class));
	}
}
