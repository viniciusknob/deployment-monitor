package br.com.jarvis.svn;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.tmatesoft.svn.core.SVNException;
import org.tmatesoft.svn.core.SVNLogEntry;
import org.tmatesoft.svn.core.io.SVNRepository;

import br.com.jarvis.model.Revision;

/**
 * <p>
 * Essa classe fornece metodos de acesso aos logs do SVN.
 */
public final class SVNRepo {

	public static List<Revision> getRevisions(String repositoryPath) {
		/* TODO
		 * Avaliar existencia de repositorio
		 * Validar usuario e senha
		 * Expor exceptions para tratamento via controller
		 */
		try {
			List<Revision> revisions = new ArrayList<Revision>();
			SVNRepository repo = getSVNRepository(repositoryPath);
			Collection<?> logEntries = repo.log(new String[] { "" }, null, 0, repo.getLatestRevision(), true, true);
			for (Iterator<?> entries = logEntries.iterator(); entries.hasNext();) {
				SVNLogEntry logEntry = (SVNLogEntry) entries.next();
				revisions.add(buildRevision(logEntry));
			}
			return revisions;
		} catch (SVNException e) {
			/*
			 * Os repositorios parametrizados para esse metodo tem origem no banco
			 * de dados, ou seja, sao repositorios ja validados no cadastro de atividades,
			 * porem se um repositorio for removido do SVN essa excecao ira ocorrer.
			 * TODO: Avaliar tratativa.
			 */
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

	private static Revision buildRevision(SVNLogEntry log) {
		return new Revision(log.getRevision(), log.getAuthor(), log.getDate(), log.getMessage());
	}
	
	private static SVNRepository getSVNRepository(String repositoryPath) throws SVNException {
		return SVNManager.getAuthenticatedRepository(SVNConfig.loadInstance(), repositoryPath);
	}
	
}