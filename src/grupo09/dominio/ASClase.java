package grupo09.dominio;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "AS_clase", catalog = "modelo_proyecto", schema = "")
public class ASClase implements Serializable{

	private static final long serialVersionUID = 1L;
	private int cClase;
	private String dClase;
	private String cUsuario;
	private String fIngreso;
	private TBTipoClase tbTipoClase;
	private TBAplicativo tbAplicativo;
	
	public ASClase(){}
	public ASClase(int cClase, String dClase, String cUsuario, String fIngreso,
			TBTipoClase tbTipoClase, TBAplicativo tbAplicativo) {
		
		this.cClase = cClase;
		this.dClase = dClase;
		this.cUsuario = cUsuario;
		this.fIngreso = fIngreso;
		this.tbTipoClase = tbTipoClase;
		this.tbAplicativo = tbAplicativo;
	}
	

	@Id
	@Basic(optional = false)
	@Column(name = "c_clase")
	public int getcClase() {
		return cClase;
	}
	public void setcClase(int cClase) {
		this.cClase = cClase;
	}
	
	@Basic(optional = false)
	@Column(name = "d_clase")
	public String getdClase() {
		return dClase;
	}
	public void setdClase(String dClase) {
		this.dClase = dClase;
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
	
	
	@JoinColumn(name = "c_tipo_clase", referencedColumnName = "c_tipo_clase")
	@ManyToOne(optional = false)
	public TBTipoClase getTbTipoClase() {
		return tbTipoClase;
	}
	public void setTbTipoClase(TBTipoClase tbTipoClase) {
		this.tbTipoClase = tbTipoClase;
	}
	
	@JoinColumn(name = "c_aplicativo", referencedColumnName = "c_aplicativo")
	@ManyToOne(optional = false)
	public TBAplicativo getTbAplicativo() {
		return tbAplicativo;
	}
	public void setTbAplicativo(TBAplicativo tbAplicativo) {
		this.tbAplicativo = tbAplicativo;
	}
	
	

}
