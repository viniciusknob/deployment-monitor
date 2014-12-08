package br.com.jarvis.control;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.view.Results;
import br.com.jarvis.model.SRD;
import br.com.jarvis.model.SRDRepository;
import br.com.jarvis.model.SolicitacaoMudancaRepository;

@Path("/srd")
@Controller()
// TODO Descobrir como renomear para SRDController sem perder a afinidade com srd/add.jsp
public class SrdController extends SuperController {
	
	@Inject
	private SolicitacaoMudancaRepository smRepo;
	
	@Inject
	private SRDRepository srdRepo;

	@Path("/add")
	public void add() {
		/* TODO 
		 * Aqui deve existir uma restricao sobre quantas SMs serao retornadas,
		 * pois nao tem sentido retornar todas, sendo que somente as ultimas sao 
		 * mantidas e sofrem alteracoes. Talvez uma boa ideia seja utilizar status
		 * para SM como Em desenvolvimento, Em homologacao, Em producao...
		 * SMs em PRD nao seriam listadas aqui, somente no historico, sem a 
		 * possibilidade de alteracao.
		 */
		result.include("listSM", smRepo.getAll());
	}
	
	@Post
	public void save(SRD srd) {
		result.use(Results.json()).withoutRoot().from(srdRepo.set(srd)).serialize();
//		result.use(Results.json()).withoutRoot().from(true).serialize();
	}
}
