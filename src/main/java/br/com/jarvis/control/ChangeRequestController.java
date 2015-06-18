package br.com.jarvis.control;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Consumes;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.jarvis.model.ChangeRequest;
import br.com.jarvis.service.ChangeRequestService;

@Path("/cr")
@Controller
public class ChangeRequestController {
	
	private final Result result;
	private final Validator validator;
	private final ChangeRequestService service;
	
    /**
     * @deprecated CDI eyes only
     */
    protected ChangeRequestController() {
        this(null, null, null);
    }
    
	@Inject
	public ChangeRequestController(Result result, Validator validator, ChangeRequestService service) {
		this.result = result;
		this.validator = validator;
		this.service = service;
	}
	
	@Get("/{id}")
	@Consumes({ "application/json" })
	public void get(Long id) {
		validator.addIf(id == null, new SimpleMessage("id", "id can't be null"));
		if (!validator.hasErrors()) {
			ChangeRequest cr = service.getChangeRequest(id);
			validator.addIf(cr == null, new SimpleMessage("id", "change request not found"));
			if (!validator.hasErrors())
				result.use(Results.json()).from(cr).serialize();
		}
		result.use(Results.status()).badRequest(validator.getErrors());
	}
	
	// TODO active poderia ser um filtro passado para getAll
	@Get("/onlyActive")
	@Consumes({ "application/json" })
	public void getAllActive() {
		List<ChangeRequest> allActive = service.getAllActive();
		validator.addIf(allActive.isEmpty(), new SimpleMessage("list", "there are not change requests"));
		if (!validator.hasErrors()) {
			result.use(Results.json()).withoutRoot().from(service.getAllActive()).serialize();
		}
		result.use(Results.status()).badRequest(validator.getErrors());
	}

}
