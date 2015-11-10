package grupo09.dominio;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "AS_metodo", catalog = "modelo_proyecto", schema = "")
@IdClass(ASMetodoPk.class)

public class ASMetodo implements Serializable{

	/**
	 * 
	 */
	@Id
    @Column(name = "c_clase")
    private int cClase;

    @Id
    @Column(name = "c_metodo")
    private int cMetodo; 
    
   
    
	private String dMetodo;
	private String dTipoRetorno;
	private String cUsuario;
	private String fIngreso;
	private int bActivo;
	private int nParametros;
	private TBTipoMetodo cTipoMetodo;
	
	
	
	private static final long serialVersionUID = 1L;


	@Basic(optional = false)
	@Column(name = "c_clase")
	public int getcClase() {
		return cClase;
	}


	
	public void setcClase(int cClase) {
		this.cClase = cClase;
	}


	@Basic(optional = false)
	@Column(name = "c_metodo")
	public int getcMetodo() {
		return cMetodo;
	}



	public void setcMetodo(int cMetodo) {
		this.cMetodo = cMetodo;
	}


	@Basic(optional = false)
	@Column(name = "d_metodo")
	public String getdMetodo() {
		return dMetodo;
	}



	public void setdMetodo(String dMetodo) {
		this.dMetodo = dMetodo;
	}


	@Basic(optional = false)
	@Column(name = "d_tipo_retorno")
	public String getdTipoRetorno() {
		return dTipoRetorno;
	}



	public void setdTipoRetorno(String dTipoRetorno) {
		this.dTipoRetorno = dTipoRetorno;
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


	@Basic(optional = false)
	@Column(name = "b_activo")
	public int getbActivo() {
		return bActivo;
	}



	public void setbActivo(int bActivo) {
		this.bActivo = bActivo;
	}


	@Basic(optional = false)
	@Column(name = "n_parametros")
	public int getnParametros() {
		return nParametros;
	}



	public void setnParametros(int nParametros) {
		this.nParametros = nParametros;
	}
	
	@JoinColumn(name = "c_tipo_metodo", referencedColumnName = "c_tipo_metodo")
	@ManyToOne(optional = false)
	public TBTipoMetodo getTBTipoMetodo() {
		return cTipoMetodo;
	}



	public ASMetodo(int cClase, int cMetodo, String dMetodo,
			String dTipoRetorno, String cUsuario, String fIngreso, int bActivo,
			int nParametros, TBTipoMetodo cTipoMetodo) {
		super();
		this.cClase = cClase;
		this.cMetodo = cMetodo;
		this.dMetodo = dMetodo;
		this.dTipoRetorno = dTipoRetorno;
		this.cUsuario = cUsuario;
		this.fIngreso = fIngreso;
		this.bActivo = bActivo;
		this.nParametros = nParametros;
		this.cTipoMetodo = cTipoMetodo;
	}



	public ASMetodo() {
		
	}
	
	
	
}

class ASMetodoPk implements Serializable{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(name = "c_clase")
    private Long cClase;

    @Column(name = "c_metodo")
    private Long cMetodo;

    /* Getters And Setters */

    /* Override Equals And HashCode */

}
