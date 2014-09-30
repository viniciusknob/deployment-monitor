package br.com.jarvis.control;

import javax.inject.Inject;

import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;

public abstract class SuperController {
	@Inject
	protected Result result;

	@Inject
	protected Validator validator;
}
