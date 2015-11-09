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
@Table(name = "AS_observacion", catalog = "modelo_proyecto", schema = "")

public class ASObservacion implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private int cObservacion;
	private String dObservacion;
	private String cUsuario;
	private String fIngreso;
	private String bActivo;
	private ASClase asClase;
	
	public ASObservacion(){}
	
	public ASObservacion(int cObservacion, String dObservacion, String cUsuario, String fIngreso, String bActivo,
			ASClase asClase) {
		
		this.cObservacion = cObservacion;
		this.dObservacion = dObservacion;
		this.cUsuario = cUsuario;
		this.fIngreso = fIngreso;
		this.bActivo = bActivo;
		this.asClase = asClase;
		
	}

	
	

	

	@Id
	@Basic(optional = false)
	@Column(name = "c_observacion")
	public int getcObservacion() {
		return cObservacion;
	}

	public void setcObservacion(int cObservacion) {
		this.cObservacion = cObservacion;
	}
	
	
	@Basic(optional = false)
	@Column(name = "d_observacion")
	public String getdObservacion() {
		return dObservacion;
	}

	public void setdObservacion(String dObservacion) {
		this.dObservacion = dObservacion;
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
	public String getbActivo() {
		return bActivo;
	}

	public void setbActivo(String bActivo) {
		this.bActivo = bActivo;
	}

}
