package grupo09.dominio;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;


@Entity
@Table(name = "AS_parametro", catalog = "modelo_proyecto", schema = "")
@IdClass(ASParametroPk.class)

public class ASParametro implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @Column(name = "c_clase")
    private int cClase;

    @Id
    @Column(name = "c_metodo")
    private int cMetodo; 
	
    @Id
    @Column(name = "c_parametro")
    private int cParametro; 
    
    
    
    private String dParametro;
	private String dTipoParametro;
	private String cUsuario;
	private String fIngreso;
	
	
	@Basic(optional = false)
	@Column(name = "c_clase")
        public int getcClase() {
		return cClase;
	}




	public void setcClase(int cClase) {
		this.cClase = cClase;
	}




	public int getcMetodo() {
		return cMetodo;
	}




	public void setcMetodo(int cMetodo) {
		this.cMetodo = cMetodo;
	}




	public int getcParametro() {
		return cParametro;
	}




	public void setcParametro(int cParametro) {
		this.cParametro = cParametro;
	}




	public String getdParametro() {
		return dParametro;
	}




	public void setdParametro(String dParametro) {
		this.dParametro = dParametro;
	}




	public String getdTipoParametro() {
		return dTipoParametro;
	}




	public void setdTipoParametro(String dTipoParametro) {
		this.dTipoParametro = dTipoParametro;
	}




	public String getcUsuario() {
		return cUsuario;
	}




	public void setcUsuario(String cUsuario) {
		this.cUsuario = cUsuario;
	}




	public String getfIngreso() {
		return fIngreso;
	}




	public void setfIngreso(String fIngreso) {
		this.fIngreso = fIngreso;
	}


	
	

public ASParametro() {}	
public ASParametro(int cClase, int cMetodo, int cParametro,
			String dParametro, String dTipoParametro, String cUsuario,
			String fIngreso) {
		super();
		this.cClase = cClase;
		this.cMetodo = cMetodo;
		this.cParametro = cParametro;
		this.dParametro = dParametro;
		this.dTipoParametro = dTipoParametro;
		this.cUsuario = cUsuario;
		this.fIngreso = fIngreso;
	}





}



class ASParametroPk implements Serializable{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(name = "c_clase")
    private int cClase;

    @Column(name = "c_metodo")
    private int cMetodo;
    
    @Column(name = "c_parametro")
    private int cParametro;

    /* Getters And Setters */

    /* Override Equals And HashCode */

}