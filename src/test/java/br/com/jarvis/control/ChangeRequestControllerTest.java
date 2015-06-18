package br.com.jarvis.control;

import static org.mockito.Mockito.*;

import java.util.ArrayList;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import br.com.caelum.vraptor.util.test.MockSerializationResult;
import br.com.caelum.vraptor.util.test.MockValidator;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.jarvis.model.ChangeRequest;
import br.com.jarvis.service.ChangeRequestService;

@RunWith(MockitoJUnitRunner.class)
// Estudar incluir https://github.com/caelum/vraptor-test
public class ChangeRequestControllerTest {

	private MockSerializationResult result;
	private MockValidator validator;
	private ChangeRequestController controller;
	
	@Mock
	private ChangeRequestService service;

	@Before
	public void setUp() {
		result = new MockSerializationResult();
		validator = new MockValidator();
		controller = new ChangeRequestController(result, validator, service);
	}

	@Test
	public void whenIdEqualsNullThenReturnsErrorMessage() {
		controller.get(null);
		
		Assert.assertTrue(validator.getErrors().contains(new SimpleMessage("id", "id can't be null")));
		Assert.assertTrue(validator.getErrors().size() == 1);
	}
	
	@Test
	public void whenChangeRequestNoExistsThenReturnsErrorMessage() {
		when(service.getChangeRequest(anyLong())).thenReturn(null);
		
		controller.get(12345L);
		
		Assert.assertTrue(validator.getErrors().contains(new SimpleMessage("id", "change request not found")));
		Assert.assertTrue(validator.getErrors().size() == 1);
	}
	
	@Test
	public void whenThereAreNotChangeRequestsThenReturnsErrorMessage() {
		when(service.getAllActive()).thenReturn(new ArrayList<ChangeRequest>());
		
		controller.getAllActive();
		
		Assert.assertTrue(validator.getErrors().contains(new SimpleMessage("list", "there are not change requests")));
		Assert.assertTrue(validator.getErrors().size() == 1);
	}

}
