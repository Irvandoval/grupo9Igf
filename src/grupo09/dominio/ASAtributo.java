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
@Table(name = "AS_atributo", catalog = "modelo_proyecto", schema = "")
@IdClass(ASAtributoPk.class)

public class ASAtributo implements Serializable{

	
	@Id
    @Column(name = "c_clase")
    private ASClase cClase;

    @Id
    @Column(name = "c_metodo")
    private ASMetodo cMetodo; 
    
    @Id
    @Column(name = "c_atributo")
    private int cAtributo;
	

	private String dAtributo;
	private String dTipodatoAtributo;
	private String cUsuario;
	private String fIngreso;
	private TBTipoAtributo tbTipoAtributo;

	
	private static final long serialVersionUID = 1L;

	

	@JoinColumn(name = "c_clase", referencedColumnName = "c_clase")
	@ManyToOne(optional = false)
	public ASClase getcClase() {
		return cClase;
	}
	public void setcClase(ASClase cClase) {
		this.cClase = cClase;
	}
	
	@JoinColumn(name = "c_metodo", referencedColumnName = "c_metodo")
	@ManyToOne(optional = false)
	public ASMetodo getcMetodo() {
		return cMetodo;
	}
	public void setcMetodo(ASMetodo cMetodo) {
		this.cMetodo = cMetodo;
	}
	
	@Basic(optional = false)
	@Column(name = "c_atributo")
	public int getcAtributo() {
		return cAtributo;
	}
	public void setcAtributo(int cAtributo) {
		this.cAtributo = cAtributo;
	}
	
	@Basic(optional = false)
	@Column(name = "d_atributo")
	public String getdAtributo() {
		return dAtributo;
	}
	public void setdAtributo(String dAtributo) {
		this.dAtributo = dAtributo;
	}
	
	@Basic(optional = false)
	@Column(name = "d_tipo_dato_atributo")
	public String getdTipodatoAtributo() {
		return dTipodatoAtributo;
	}
	public void setdTipodatoAtributo(String dTipodatoAtributo) {
		this.dTipodatoAtributo = dTipodatoAtributo;
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
	
	
	@JoinColumn(name = "c_tipo_atributo", referencedColumnName = "c_tipo_atributo")
	@ManyToOne(optional = false)
	public TBTipoAtributo getTbTipoAtributo() {
		return tbTipoAtributo;
	}
	public void settbTipoAtributo(TBTipoAtributo tbTipoAtributo) {
		this.tbTipoAtributo = tbTipoAtributo;
	}
	
	
	public ASAtributo(ASClase cClase, ASMetodo cMetodo, int cAtributo, String dAtributo, String dTipodatoAtributo, String cUsuario, String fIngreso,
			TBTipoAtributo tbTipoAtributo) {
		super();
		this.cClase = cClase;
		this.cMetodo = cMetodo;
		this.cAtributo = cAtributo;
		this.dAtributo = dAtributo;
		this.dTipodatoAtributo = dTipodatoAtributo; 
		this.cUsuario = cUsuario;
		this.fIngreso = fIngreso;
		this.tbTipoAtributo = tbTipoAtributo;

	}
	public ASAtributo(){}
	
}
	class ASAtributoPk implements Serializable{

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
	