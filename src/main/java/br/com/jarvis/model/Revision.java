package br.com.jarvis.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Revision {
	
	private static final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm");

	private Long id;
	private String autor;
	private String data;
	private String descricao;

	public Revision(Long id, String autor, Date data, String descricao) {
		this.id = id;
		this.autor = autor;
		this.data = sdf.format(data);
		this.descricao = descricao;
	}
	
	public Long getId() {
		return id;
	}
	
	public String getAutor() {
		return autor;
	}
	
	public String getData() {
		return data;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
