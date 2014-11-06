package br.com.jarvis.control;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.view.Results;
import br.com.jarvis.model.Atividade;
import br.com.jarvis.model.DAO;
import br.com.jarvis.model.SolicitacaoMudanca;

@Path("/atividade")
@Controller
public class AtividadeController extends SuperController {

	@Get
	public void list(SolicitacaoMudanca sm) {
		sm = DAO.getByID(SolicitacaoMudanca.class, sm.getId());
		result.use(Results.json()).withoutRoot().from(sm.getAtividades()).serialize();
	}
	
	@Post
	public void remove(long id) {
		result.use(Results.json()).withoutRoot().from(DAO.getByID(Atividade.class, id)).serialize();
		DAO.delete(Atividade.class, id);
	}
	
}
