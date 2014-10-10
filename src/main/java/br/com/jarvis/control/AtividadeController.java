package br.com.jarvis.control;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.jarvis.model.Atividade;
import br.com.jarvis.model.DAO;

@Path("/atividade")
@Controller
public class AtividadeController extends SuperController {

	@Path("/filter/{id}")
	public void filter(Long id) {
		Atividade atividade = DAO.getByID(Atividade.class, id);
		//svnRevisions = atividade.getBranch();
		result.include("revisions", "svnRevisions");
	}
}
