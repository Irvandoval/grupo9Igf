package grupo09.dominio;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "AS_interface", catalog = "modelo_proyecto", schema = "")
public class ASInterface implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Basic(optional = false)
	@Column(name = "c_interface")
	private int cInterface;
	@Basic(optional = false)
	@Column(name = "d_interface")
	private String dInterface;
	@Basic(optional = false)
	@Column(name = "c_usuario")
	private String cUsuario;
	@Basic(optional = false)
	@Column(name = "f_ingreso")
	private String fIngreso;
	
	public ASInterface (){
		
	}
	
	public ASInterface(int cInterface, String dInterface, String cUsuario, String fIngreso) {
		
		this.cInterface= cInterface;
		this.dInterface = dInterface;
		this.cUsuario = cUsuario;
		this.fIngreso = fIngreso;
	}
	public int getcInterface() {
		return cInterface;
	}
	public void setcInterface(int cInterface) {
		this.cInterface=cInterface;
	}
	
	public String getdInterface() {
		return dInterface;
	}
	public void setdInterface(String dInterface) {
		this.dInterface = dInterface;
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
}
