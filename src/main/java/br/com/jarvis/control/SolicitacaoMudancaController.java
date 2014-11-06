package br.com.jarvis.control;

import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.view.Results;
import br.com.jarvis.model.DAO;
import br.com.jarvis.model.SolicitacaoMudanca;

@Path("/sm")
@Controller
public class SolicitacaoMudancaController extends SuperController {
	
	@Get
	public void list() {
		List<SolicitacaoMudanca> all = DAO.getAll(SolicitacaoMudanca.class);
		result.use(Results.json()).withoutRoot().from(all).serialize();
	}
	
	@Delete("/delete/{id}")
	public void delete(long id) {
		DAO.delete(SolicitacaoMudanca.class, id);
	}
	
}
