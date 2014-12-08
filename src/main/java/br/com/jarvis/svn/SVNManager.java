package br.com.jarvis.svn;

import org.tmatesoft.svn.core.SVNException;
import org.tmatesoft.svn.core.SVNURL;
import org.tmatesoft.svn.core.internal.io.dav.DAVRepositoryFactory;
import org.tmatesoft.svn.core.io.SVNRepository;
import org.tmatesoft.svn.core.io.SVNRepositoryFactory;

public final class SVNManager {
	
	/** Prevent object construction */
	private SVNManager() {
		throw new UnsupportedOperationException("noninstantiable class");
	}
	
	public static SVNRepository getAuthenticatedRepository(SVNConfig conf, String repositoryURL) 
	throws SVNException {
		DAVRepositoryFactory.setup();
		SVNURL parseURIEncoded = SVNURL.parseURIEncoded(repositoryURL);
		SVNRepository repository = SVNRepositoryFactory.create(parseURIEncoded);
		repository.setAuthenticationManager(SVNAuth.DEFAULT.get(conf.getUser(), conf.getPass()));
		return repository;
	}
	
	public static boolean testConnection(SVNConfig conf) {
		try {
			getAuthenticatedRepository(conf, conf.getRepositoryBaseURL()).testConnection();
			return true;
		} catch (SVNException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean testRepositoryConnection(SVNConfig conf, String repositoryURL) {
		try {
			SVNRepository repository = getAuthenticatedRepository(conf, repositoryURL);
			long latestRevision = repository.getLatestRevision();
			/*
			 * Nota de implementacao:
			 * 
			 * repository.testConnection() - Esse metodo tenta acessar o
			 * repositorio pelo diretorio raiz, porem qualquer parte da url alem
			 * do diretorio raiz pode conter erros, pois nao eh avaliado.
			 * 
			 * repository.latestRevision() - Esse metodo obtem a ultima revisao
			 * desse repository, porem novamente o que eh avaliado para obtencao
			 * eh o diretorio raiz.
			 * 
			 * repository.log() - Essa foi a unica alternativa para realmente
			 * avaliar se o repositorio eh valido, ja que ele tenta obter as
			 * revisions apenas da branch informada. Para minimizar o trafego na
			 * rede, ele apenas tras as revisions entre a ultima revision, que
			 * na maioria das vezes sera um array vazio se o repositorio for
			 * valido, e lanca excecao se nao for.
			 */
			repository.log(new String[] { "" }, null, latestRevision, latestRevision, true, true);
			return true;
		} catch (SVNException e) {
			e.printStackTrace();
			return false;
		}
	}
	
}