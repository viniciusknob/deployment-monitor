package br.com.jarvis.model;

import java.util.List;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;


public class Activity {

	private Long id;
	private String descricao;
	private String branch;

	private ChangeRequest sm;
	
	private List<SRD> srds;

	public Long getId() {
		return id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public ChangeRequest getSm() {
		return sm;
	}

	public void setSm(ChangeRequest sm) {
		this.sm = sm;
		if (sm.getAtividades().contains(this)) return;
		sm.addAtividade(this);
	}
	
	public List<SRD> getSrds() {
		return srds;
	}
	
	public void setSrds(List<SRD> srds) {
		this.srds = srds;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
	@Override
	public int hashCode() {
		return HashCodeBuilder.reflectionHashCode(this);
	}

	@Override
	public boolean equals(Object obj) {
		return EqualsBuilder.reflectionEquals(this, obj);
	}

}
