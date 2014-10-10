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
	
	@Path("/add")
	public void add() {
	}
	
	@Post("/save")
	public void save(SolicitacaoMudanca sm) {
		if (sm.getId() != null) {
			SolicitacaoMudanca update = DAO.getByID(SolicitacaoMudanca.class, sm.getId());
			update.setNome(sm.getNome());
			update.setData(sm.getData());
			update.update();
		} else {
			sm.add();
		}
		result.redirectTo(this).list();
	}

	@Path("/delete/{id}")
	public void delete(long id) {
		DAO.delete(SolicitacaoMudanca.class, id);
		result.redirectTo(this).list();
	}
	
	@Path("/edit/{id}")
	public void edit(long id) {
		SolicitacaoMudanca sm = DAO.getByID(SolicitacaoMudanca.class, id);
		result.include("sm", sm);
		list();
		result.of(this).list();
	}
	
	@Path("/filter/{id}")
	public void filter(Long id) {
		SolicitacaoMudanca sm = DAO.getByID(SolicitacaoMudanca.class, id);
		result.include("sm", sm);
	}
}
