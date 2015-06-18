package br.com.jarvis.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;


public class ChangeRequest {

	private long id;
	private String nome;
	private Date data;

	private List<Activity> atividades;

	public long getId() {
		return id;
	}

	public void setId(long id) {
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
	
	public void addAtividade(Activity at) {
		if (atividades == null) atividades = new ArrayList<Activity>();
		this.atividades.add(at);
		at.setSm(this);
	}

	public List<Activity> getAtividades() {
		if (atividades == null) return Collections.emptyList();
		return new ArrayList<Activity>(atividades);
	}

	public void setAtividades(List<Activity> atividades) {
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
