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
@Table(name = "AS_interface_implementa", catalog = "modelo_proyecto", schema = "")
public class ASInterfaceImplementa implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@Basic(optional = false)
	@Column(name = "c_interface_implementa")
	private int cInterfaceImplementa;
	@JoinColumn(name = "c_interface_hijo", referencedColumnName = "c_interface")
	@ManyToOne(optional = false)
	private ASInterface hijo;
	@JoinColumn(name = "c_interface_padre", referencedColumnName = "c_interface")
	@ManyToOne(optional = false)
	private ASInterface padre;
	
	public ASInterfaceImplementa(){}
	public ASInterfaceImplementa(int cInterfaceImplementa,ASInterface hijo,ASInterface padre){
		this.cInterfaceImplementa=cInterfaceImplementa;
		this.hijo=hijo;
		this.padre=padre;
	}
	
	public int getcInterfaceImplementa() {
		return cInterfaceImplementa;
	}
	public void setcInterfaceImplementa(int cInterfaceImplementa) {
		this.cInterfaceImplementa = cInterfaceImplementa;
	}

	public ASInterface gethijo() {
		return hijo;
	}
	public void sethijo(ASInterface hijo) {
		this.hijo=hijo;
	}
	public ASInterface getpadre() {
		return padre;
	}
	public void setpadre(ASInterface padre) {
		this.padre=padre;
	}

}
