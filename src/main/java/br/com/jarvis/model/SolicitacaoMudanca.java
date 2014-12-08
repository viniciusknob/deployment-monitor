package br.com.jarvis.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
// TODO Alterar nome para SM ou ChangeRequest
public class SolicitacaoMudanca implements Serializable {
	private static final long serialVersionUID = 7232480103117214026L;

	@Id
	@GeneratedValue
	private Long id;
	private String nome;
	private Date data;

	@OneToMany(mappedBy = "sm", fetch = FetchType.EAGER)
	@Cascade(value = CascadeType.DELETE)
	private List<Atividade> atividades;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}
	
	public void addAtividade(Atividade at) {
		if (atividades == null) atividades = new ArrayList<Atividade>();
		this.atividades.add(at);
		at.setSm(this);
	}

	public List<Atividade> getAtividades() {
		if (atividades == null) return Collections.emptyList();
		return new ArrayList<Atividade>(atividades);
	}

	public void setAtividades(List<Atividade> atividades) {
		this.atividades = atividades;
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
