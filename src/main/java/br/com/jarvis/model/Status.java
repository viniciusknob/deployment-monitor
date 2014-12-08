package br.com.jarvis.model;

/**
 * Status de uma Solicitacao de Reintegrate
 */
public enum Status {
	PENDENTE_REINTEGRATE("Pendente de reintegrate"), 
	PENDENTE_DEPLOY("Pendente de deploy"), // Reintegrado
	EXECUTANDO_DEPLOY("Deploy em andamento"), 
	DEPLOY_FINALIZADO("Finalizado"); // Implantado
	
	public final String value;
	
	private Status(String value) {
		this.value = value;
	}
}
