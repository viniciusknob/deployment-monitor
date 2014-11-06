package br.com.jarvis.control;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.jarvis.model.Atividade;
import br.com.jarvis.model.DAO;
import br.com.jarvis.model.SolicitacaoMudanca;

@Path("/admin")
@Controller
public class AdminController extends SuperController {

	@Path("")
	public void index() {}
	
	@Post
	public void saveSM(SolicitacaoMudanca sm) {
		if (sm.getId() != null) {
			SolicitacaoMudanca update = DAO.getByID(SolicitacaoMudanca.class, sm.getId());
			update.setNome(sm.getNome());
			update.setData(sm.getData());
			update.update();
		} else {
			sm.add();
		}
		result.redirectTo(this).index();
	}
	
	@Post
	public void saveActivity(Atividade atividade) {
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
		result.redirectTo(this).index();
	}
}
