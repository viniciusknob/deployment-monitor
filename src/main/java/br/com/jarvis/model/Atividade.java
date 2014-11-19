package br.com.jarvis.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

@Entity
public class Atividade implements Serializable {
	private static final long serialVersionUID = 4821907415936465317L;

	@Id
	@GeneratedValue
	private Long id;
	private String descricao;
	private String branch;

	@ManyToOne
	private SolicitacaoMudanca sm;

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

	public SolicitacaoMudanca getSm() {
		return sm;
	}

	public void setSm(SolicitacaoMudanca sm) {
		this.sm = sm;
		if (sm.getAtividades().contains(this)) return;
		sm.addAtividade(this);
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
