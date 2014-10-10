package br.com.jarvis.model;

public enum Status {
	PENDENTE_REINTEGRATE("Pendente de reintegrate"), 
	PENDENTE_DEPLOY("Pendente de deploy"), 
	EXECUTANDO_DEPLOY("Deploy em andamento"), 
	DEPLOY_FINALIZADO("Finalizado");
	public final String value;
	private Status(String value) {
		this.value = value;
	}
}
