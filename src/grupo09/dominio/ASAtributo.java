package grupo09.dominio;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "AS_atributo", catalog = "modelo_proyecto", schema = "")
@IdClass(ASAtributoPk.class)

public class ASAtributo implements Serializable{
	
	private static final long serialVersionUID = 1L;
	/* PKs */
	@Id
	@Column(name = "c_clase")
	private int cClase; 
	
	@Id
	@Column(name = "c_atributo")
	private int cAtributo;
	
	
	//private int cMetodo;
	@Basic(optional = false)
	@Column(name = "d_atributo")
	
	
	private String dAtributo;
	@Basic(optional = false)
	
	@Column(name = "d_tipo_dato_atributo")
	private String dTipoDatoAtributo;
	
	
	@Basic(optional = false)
	@Column(name = "c_usuario")	
	private String cUsuario;
	
	
	@Basic(optional = false)	
	@Column(name = "f_ingreso")
	private String fingreso;
	
	
	/* FKs */
	@JoinColumn(name = "c_clase", referencedColumnName="c_clase", insertable=false, updatable=false)
	@ManyToOne(optional = false)
	private ASClase asClase; 
	
	@ManyToOne
	@JoinColumns({
	@JoinColumn(name="c_clase", referencedColumnName="c_clase",insertable=false,updatable=false),
	@JoinColumn(name="c_metodo", referencedColumnName="c_metodo",insertable=false,updatable=false)
	})
	private ASMetodo asMetodo;
	
	@JoinColumn(name = "c_tipo_atributo", referencedColumnName="c_tipo_atributo")
	@ManyToOne(optional = false)
	private TBTipoAtributo tbTipoAtributo;
	
	
	public ASAtributo() {
		
	}


	public ASAtributo(int cClase, int cAtributo, String dAtributo,
			String dTipoDatoAtributo, String cUsuario, String fingreso,
			ASClase asClase, ASMetodo asMetodo, TBTipoAtributo tbTipoAtributo) {

		this.cClase = cClase;
		this.cAtributo = cAtributo;
		this.dAtributo = dAtributo;
		this.dTipoDatoAtributo = dTipoDatoAtributo;
		this.cUsuario = cUsuario;
		this.fingreso = fingreso;
		this.asClase = asClase;
		this.asMetodo = asMetodo;
		this.tbTipoAtributo = tbTipoAtributo;
	}

	
	public int getcClase() {
		return cClase;
	}


	public void setcClase(int cClase) {
		this.cClase = cClase;
	}

	
	public int getcAtributo() {
		return cAtributo;
	}


	public void setcAtributo(int cAtributo) {
		this.cAtributo = cAtributo;
	}


	public String getdAtributo() {
		return dAtributo;
	}


	public void setdAtributo(String dMetodo) {
		this.dAtributo = dMetodo;
	}


	public String getdTipoDatoAtributo() {
		return dTipoDatoAtributo;
	}


	public void setdTipoDatoAtributo(String dTipoDatoAtributo) {
		this.dTipoDatoAtributo = dTipoDatoAtributo;
	}

	
	public String getcUsuario() {
		return cUsuario;
	}


	public void setcUsuario(String cUsuario) {
		this.cUsuario = cUsuario;
	}


	public String getFingreso() {
		return fingreso;
	}


	public void setFingreso(String fingreso) {
		this.fingreso = fingreso;
	}

	
	public ASClase getAsClase() {
		return asClase;
	}


	public void setAsClase(ASClase asClase) {
		this.asClase = asClase;
	}

	
	public ASMetodo getAsMetodo() {
		return asMetodo;
	}


	public void setAsMetodo(ASMetodo asMetodo) {
		this.asMetodo = asMetodo;
	}

	
	public TBTipoAtributo getTbTipoAtributo() {
		return tbTipoAtributo;
	}


	public void setTbTipoAtributo(TBTipoAtributo tbTipoAtributo) {
		this.tbTipoAtributo = tbTipoAtributo;
	}
	
	
	
	
}
	class ASAtributoPk implements Serializable{

	  
		private static final long serialVersionUID = 1L;

		@Column(name = "c_clase")
	    private int cClase;

	    @Column(name = "c_atributo")
	    private int cAtributo;

	    /* Getters And Setters */

	    /* Override Equals And HashCode */

	}
	