package br.com.jarvis.control;

import javax.inject.Inject;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;

public abstract class SuperController {
	
	@Inject
	protected Result result;

	@Inject
	protected Validator validator;
	
	public SuperController() {
		ToStringBuilder.setDefaultStyle(ToStringStyle.SHORT_PREFIX_STYLE);
	}
}
