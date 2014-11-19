package br.com.jarvis.control;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;

@Path("/")
@Controller
public class DashboardController extends SuperController {
	
	@Path("/")
	public void index() {}
	
}
