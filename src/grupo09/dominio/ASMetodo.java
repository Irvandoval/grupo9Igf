package grupo09.dominio;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import grupo09.dominio.ASAtributo;


@Entity
@Table(name = "AS_metodo", catalog = "modelo_proyecto", schema = "")
@IdClass(ASMetodoPk.class)

public class ASMetodo implements Serializable{


	@Id
    @Column(name = "c_clase")
    private int cClase;

    @Id
    @Column(name = "c_metodo")
    private int cMetodo;
    
    @Basic(optional = false)
	@Column(name = "d_metodo")
	private String dMetodo;
    
    @Basic(optional = false)
	@Column(name = "d_tipo_retorno")
	private String dTipoRetorno;
    
    @Basic(optional = false)
	@Column(name = "c_usuario")    
	private String cUsuario;
    
    @Basic(optional = false)
	@Column(name = "f_ingreso")
	private String fIngreso;
	
	@Basic(optional = false)
	@Column(name = "b_activo")
	private int bActivo;
	
	@Basic(optional = false)
	@Column(name = "n_parametros")
	private int nParametros;
	
	@JoinColumn(name = "c_tipo_metodo", referencedColumnName = "c_tipo_metodo")
	@ManyToOne(optional = false)	
	private TBTipoMetodo tbTipoMetodo;//pk
	
	@JoinColumn(name = "c_clase", referencedColumnName = "c_clase", insertable=false, updatable=false)
	@ManyToOne(optional = false)
	private ASClase asClase;//pk
	
	@OneToMany(targetEntity=ASAtributo.class, cascade = CascadeType.ALL, mappedBy = "asMetodo" )
    private List <ASAtributo> asAtributoList;
	
	


	private static final long serialVersionUID = 1L;

	
	public ASMetodo(int cClase, int cMetodo, String dMetodo,
			String dTipoRetorno, String cUsuario, String fIngreso, int bActivo,
			int nParametros, TBTipoMetodo tbTipoMetodo, ASClase asClase) {
		
		this.cClase = cClase;
		this.cMetodo = cMetodo;
		this.dMetodo = dMetodo;
		this.dTipoRetorno = dTipoRetorno;
		this.cUsuario = cUsuario;
		this.fIngreso = fIngreso;
		this.bActivo = bActivo;
		this.nParametros = nParametros;
		this.tbTipoMetodo = tbTipoMetodo;
		this.asClase = asClase;
	}



	public ASMetodo() {
		
	}

	//@Basic(optional = false)
	//@Column(name = "c_clase")
	public int getcClase() {
		return cClase;
	}


	
	public void setcClase(int cClase) {
		this.cClase = cClase;
	}


	//@Basic(optional = false)
	//@Column(name = "c_metodo")
	public int getcMetodo() {
		return cMetodo;
	}



	public void setcMetodo(int cMetodo) {
		this.cMetodo = cMetodo;
	}


	
	public String getdMetodo() {
		return dMetodo;
	}


	
	public ASClase getAsClase() {
		return asClase;
	}



	public void setAsClase(ASClase asClase) {
		this.asClase = asClase;
	}



	public void setdMetodo(String dMetodo) {
		this.dMetodo = dMetodo;
	}


	
	public String getdTipoRetorno() {
		return dTipoRetorno;
	}



	public void setdTipoRetorno(String dTipoRetorno) {
		this.dTipoRetorno = dTipoRetorno;
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


	
	public int getbActivo() {
		return bActivo;
	}



	public void setbActivo(int bActivo) {
		this.bActivo = bActivo;
	}


	
	public int getnParametros() {
		return nParametros;
	}



	public void setnParametros(int nParametros) {
		this.nParametros = nParametros;
	}
	
	
	public TBTipoMetodo getTBTipoMetodo() {
		return tbTipoMetodo;
	}
	
	public void setTbTipoMetodo(TBTipoMetodo tbTipoMetodo) {
		this.tbTipoMetodo = tbTipoMetodo;
	}
	
	
	public List<ASAtributo> getAsAtributoList() {
		return asAtributoList;
	}



	public void setAsAtributoList(List<ASAtributo> asAtributoList) {
		this.asAtributoList = asAtributoList;
	}



	
	
	
	
}

class ASMetodoPk implements Serializable{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(name = "c_clase")
    private int cClase;

    @Column(name = "c_metodo")
    private int cMetodo;

    /* Getters And Setters */

    /* Override Equals And HashCode */

}
