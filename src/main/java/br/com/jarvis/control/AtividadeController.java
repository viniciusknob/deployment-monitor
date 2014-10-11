package br.com.jarvis.control;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.jarvis.model.Atividade;
import br.com.jarvis.model.DAO;
import br.com.jarvis.model.SolicitacaoMudanca;

@Path("/atividade")
@Controller
public class AtividadeController extends SuperController {

	@Path("")
	public void list() {
		result.include("atividades", DAO.getAll(Atividade.class));
		result.include("sms", DAO.getAll(SolicitacaoMudanca.class));
	}
	
	@Post("/save")
	public void save(Atividade atividade) {
		SolicitacaoMudanca sm = DAO.getByID(SolicitacaoMudanca.class, atividade.getSm().getId());
		atividade.setSm(sm);

		if (atividade.getId() != null) {
			Atividade update = DAO.getByID(Atividade.class, atividade.getId());
			update.setBranch(atividade.getBranch());
			update.setDescricao(atividade.getDescricao());
			update.setSm(atividade.getSm());
			update.update();
		} else {
			atividade.add();
		}
		result.redirectTo(this).list();
	}

	@Path("/delete/{id}")
	public void delete(long id) {
		DAO.delete(Atividade.class, id);
		result.redirectTo(this).list();
	}
	
	@Path("/edit/{id}")
	public void edit(long id) {
		Atividade atividade = DAO.getByID(Atividade.class, id);
		result.include("atividade", atividade);
		list();
		result.of(this).list();
	}
}
