package gestores.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Gestor.java
 */

@Entity
@Table(name="gestores")
public class Gestor {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	protected int id;
	
	@Column(name="name")
	protected String name;
	
	@Column(name="matricula")
	protected String matricula;
	
	@Column(name="datan")
	protected String datan;
	
	@Column(name="setor")
	protected String setor;
	
	public Gestor() {
	}
	
	public Gestor(String name, String matricula, String date, String setor) {
		super();
		this.name = name;
		this.matricula = matricula;
		this.datan = date;
		this.setor = setor;
	}

	public Gestor(int id, String name, String matricula, String datan, String setor) {
		super();
		this.id = id;
		this.name = name;
		this.matricula = matricula;
		this.datan = datan;
		this.setor = setor;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMatricula() {
		return matricula;
	}
	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}
	public String getDatan() {
		return datan;
	}
	public void setDatan(String datan) {
		this.datan = datan;
	}

	public String getSetor() {
		return setor;
	}

	public void setSetor(String setor) {
		this.setor = setor;
	}
}
