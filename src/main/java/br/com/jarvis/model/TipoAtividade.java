package br.com.jarvis.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class TipoAtividade extends DAO {
	private static final long serialVersionUID = 7320665484056297409L;

	@Id 
	@GeneratedValue
	private Long id;
	private String nome;
	
	@Override
	public Long getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setId(Long id) {
		this.id = id;
	}
}
