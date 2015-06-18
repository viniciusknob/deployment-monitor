package br.com.jarvis.control;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.view.Results;
import br.com.jarvis.model.SRD;
import br.com.jarvis.repository.SRDRepository;

@Path("/srd")
@Controller()
// TODO Descobrir como renomear para SRDController sem perder a afinidade com srd/add.jsp
public class SrdController extends SuperController {
	
	@Inject
	private SRDRepository srdRepo;

	@Post
	public void save(SRD srd) {
		result.use(Results.json()).withoutRoot().from(srdRepo.set(srd)).serialize();
//		result.use(Results.json()).withoutRoot().from(true).serialize();
	}
}
