package br.com.jarvis.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.hibernate.Session;

@Entity
public class SolicitacaoMudanca extends DAO<SolicitacaoMudanca> {
	private static final long serialVersionUID = 7232480103117214026L;

	@Id 
	@GeneratedValue
	private Long id;
	private String nome;
	private Date data;

	public SolicitacaoMudanca() {
		super(null);
	}
	
	public SolicitacaoMudanca(Session session) {
		super(session);
	}
	
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
	
	@Override
	public int hashCode() {
		return HashCodeBuilder.reflectionHashCode(this);
	}
	
	@Override
	public boolean equals(Object obj) {
		return EqualsBuilder.reflectionEquals(this, obj);
	}
}
