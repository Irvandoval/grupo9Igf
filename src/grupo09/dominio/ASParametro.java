package grupo09.dominio;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "AS_parametro", catalog = "modelo_proyecto", schema = "")

public class ASParametro implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	
	private ASClase asClase;
	private ASMetodo asMetodo;
	private int cPArametro;
	private String dParametro;
	private String cTipoParametro;
	private String cUsuario;
	private String fIngreso;
	
	

	public ASParametro() {
		
	}

	public ASParametro(ASClase asClase, ASMetodo asMetodo, int cPArametro,
			String dParametro, String cTipoParametro, String cUsuario,
			String fIngreso) {
		super();
		this.asClase = asClase;
		this.asMetodo = asMetodo;
		this.cPArametro = cPArametro;
		this.dParametro = dParametro;
		this.cTipoParametro = cTipoParametro;
		this.cUsuario = cUsuario;
		this.fIngreso = fIngreso;
	}

	
	private int cClase;
	
	@Id
	@Column(name = "c_clase")
	public int getcClase() {
		return cClase;
	}

	public void setcClase(int cClase) {
		this.cClase = cClase;
	}

	
	private int cMetodo;
	
	@Id
	@Column(name = "c_metodo")
	public int getcMetodo() {
		return cMetodo;
	}

	public void setcMetodo(int cMetodo) {
		this.cMetodo = cMetodo;
	}

	@JoinColumn(name = "c_clase", referencedColumnName = "c_clase", insertable=false, updatable=false)
	@ManyToOne(optional = false)
	public ASClase getAsClase() {
		return asClase;
	}

	public void setAsClase(ASClase asClase) {
		this.asClase = asClase;
	}

	
	@ManyToOne
	@JoinColumns({
	@JoinColumn(name="c_clase", referencedColumnName="c_clase",insertable=false,updatable=false),
	@JoinColumn(name="c_metodo", referencedColumnName="c_metodo",insertable=false,updatable=false)
	})
	public ASMetodo getAsMetodo() {
		return asMetodo;
	}

	public void setAsMetodo(ASMetodo asMetodo) {
		this.asMetodo = asMetodo;
	}

	@Id
	@Basic(optional = false)
	@Column(name = "c_parametro")
	public int getcPArametro() {
		return cPArametro;
	}

	public void setcPArametro(int cPArametro) {
		this.cPArametro = cPArametro;
	}
	
	
	@Basic(optional = false)
	@Column(name = "d_parametro")
	public String getdParametro() {
		return dParametro;
	}

	public void setdParametro(String dParametro) {
		this.dParametro = dParametro;
	}

	
	@Basic(optional = false)
	@Column(name = "d_tipo_parametro")
	public String getcTipoParametro() {
		return cTipoParametro;
	}

	public void setcTipoParametro(String cTipoParametro) {
		this.cTipoParametro = cTipoParametro;
	}

	
	@Basic(optional = false)
	@Column(name = "c_usuario")
	public String getcUsuario() {
		return cUsuario;
	}

	public void setcUsuario(String cUsuario) {
		this.cUsuario = cUsuario;
	}

	
	@Basic(optional = false)
	@Column(name = "f_ingreso")
	public String getfIngreso() {
		return fIngreso;
	}

	public void setfIngreso(String fIngreso) {
		this.fIngreso = fIngreso;
	}

	
	
	
	

}


class ASParametroPk implements Serializable{

	  
	private static final long serialVersionUID = 1L;

	@Column(name = "c_clase")
    private int cClase;

    @Column(name = "c_metodo")
    private int cMetodo;
    
    @Column(name = "c_parametro")
    private int cPArametro;

    /* Getters And Setters */

    /* Override Equals And HashCode */

}