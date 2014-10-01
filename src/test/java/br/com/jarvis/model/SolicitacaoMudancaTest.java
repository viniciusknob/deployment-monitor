package br.com.jarvis.model;

import java.util.Date;
import java.util.List;

import org.hibernate.Transaction;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class SolicitacaoMudancaTest {
	private Transaction transaction;
	private static int pk = 1;
	
	@Before
	public void setUp() throws Exception {
		System.setProperty("test", "true");
		transaction = DAO.getTransaction();
	}
	
	@Test
	public void deveAdicionar_nRegistros_retornandoCorretamente_idIncremental() {
		int size = pk+10;
		do {
			SolicitacaoMudanca dao = criarRegistro();
			Assert.assertEquals(Long.valueOf(pk-1), dao.getId());
		} while (pk < size);
	}

	@Test
	public void deveRemover_umRegistro_existente() {
		SolicitacaoMudanca dao = criarRegistro();
		dao.delete();
		SolicitacaoMudanca actual = DAO.getByID(SolicitacaoMudanca.class, dao.getId());
		Assert.assertNull(actual);
	}
	
	@Test
	public void deveRetornar_registroExistente_buscandoPorID() {
		criarRegistro();
		SolicitacaoMudanca expected = criarRegistro();
		SolicitacaoMudanca actual = DAO.getByID(SolicitacaoMudanca.class, expected.getId());
		Assert.assertEquals(expected, actual);
	}
	
	@Test
	public void deveRetornar_listaComDoisElementos_quandoInseridoDois() throws Exception {
		criarRegistro();
		criarRegistro();
		List<SolicitacaoMudanca> all = DAO.getAll(SolicitacaoMudanca.class);
		Assert.assertEquals(2, all.size());
	}
	
	@Test
	public void deveAtualizar_umRegistro_existente() {
		String expected = "Teste";
		SolicitacaoMudanca dao = criarRegistro();
		dao.setNome(expected);
		dao.update();

		String actual = DAO.getByID(SolicitacaoMudanca.class, dao.getId()).getNome();
		Assert.assertEquals(expected, actual);
	}

	
	@After
	public void tearDown() throws Exception {
		transaction.rollback();
	}

	private static SolicitacaoMudanca criarRegistro() {
		SolicitacaoMudanca dao = new SolicitacaoMudanca();
		dao.setNome(new StringBuilder("Release ").append(pk++).toString());
		dao.setData(new Date());
		dao.add();
		return dao;
	}
}
