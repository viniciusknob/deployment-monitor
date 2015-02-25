package br.com.jarvis.model;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * Solicitacao de Reintegrate para Deploy
 */
public class SRD {
	
	private Long id;
	private Activity activity;
	private String revisions;
	private String motivo;
	private Date data;
	private Status status = Status.PENDENTE_REINTEGRATE;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	public String getRevisions() {
		return revisions;
	}
	public void setRevisions(String revisions) {
		this.revisions = revisions;
	}
	public String getMotivo() {
		return motivo;
	}
	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
