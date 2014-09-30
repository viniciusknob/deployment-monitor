package br.com.jarvis.model;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.cfg.AnnotationConfiguration;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("deprecation")
public class SolicitacaoMudancaTest {
	private Session session;
	private SolicitacaoMudanca dao;
	
	@Before
	public void setUp() throws Exception {
		AnnotationConfiguration cfg = new AnnotationConfiguration();
		cfg.configure().setProperty("hibernate.connection.url", "jdbc:hsqldb:mem:DeploymentMonitorDB");
		session = cfg.buildSessionFactory().openSession();
		session.beginTransaction();
		dao = new SolicitacaoMudanca(session);
	}
	
	@Test
	public void deveAdicionarNovoRegistroRetornandoCorretamenteIDUm() {
		dao.setNome("Release 9");
		dao.setData(new Date());
		dao.add();
		Assert.assertEquals(Long.valueOf(1L), dao.getId());
	}
	
	@After
	public void tearDown() throws Exception {
		if (session != null && session.getTransaction().isActive()) {
			session.getTransaction().rollback();
		}
	}
}
