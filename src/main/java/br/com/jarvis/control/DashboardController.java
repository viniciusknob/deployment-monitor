package br.com.jarvis.control;

import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.jarvis.model.DAO;
import br.com.jarvis.model.SolicitacaoMudanca;

//TODO retornar valores para o dashboard
@Path("/")
@Controller
public class DashboardController extends SuperController {
	@Path("/")
	public void index() {
		List<SolicitacaoMudanca> sms = DAO.getAll(SolicitacaoMudanca.class);
		result.include("sms", sms);
	}
	
	@Path("/{id}")
	public void filter(long id) {
		result.forwardTo(this).index();
	}
}
