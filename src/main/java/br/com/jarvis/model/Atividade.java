package br.com.jarvis.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Atividade extends DAO {
	private static final long serialVersionUID = 4821907415936465317L;

	@Id 
	@GeneratedValue
	private Long id;
	private String descricao;
	private String branch;
	
	@ManyToOne
	@JoinColumn(name="sm_id")
	private SolicitacaoMudanca sm;
	
	@Override
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
	}
}
