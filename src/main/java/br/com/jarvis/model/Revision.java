package br.com.jarvis.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Revision implements Serializable {
	private static final long serialVersionUID = 7252992733358225808L;
	private static final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm");

	private Long id;
	private String autor;
	private String data;
	private String descricao;

	public Revision(Long id, String autor, Date data, String descricao) {
		setId(id);
		setAutor(autor);
		setData(data);
		setDescricao(descricao);
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getAutor() {
		return autor;
	}
	public void setAutor(String autor) {
		this.autor = autor;
	}
	public String getData() {
		return sdf.format(data);
	}
	public void setData(Date data) {
		this.data = sdf.format(data);
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public static List<Revision> getAll(String branch) {
		List<Revision> revisions = new ArrayList<Revision>();
		for (int i=0; i<10; i++) {
			revisions.add(new Revision(new Long(i), "Nicolas", new Date(2014, 9, i), "Lorem ipsum dolor sit amet " + i));
		}
		return revisions;
	}
}
