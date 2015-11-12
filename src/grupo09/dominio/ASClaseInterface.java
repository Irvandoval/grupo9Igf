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
@Table(name = "AS_clase_interface", catalog = "modelo_proyecto", schema = "")
public class ASClaseInterface implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@Basic(optional = false)
	@Column(name = "c_clase_interface")
	private int cClaseInterface;
	@JoinColumn(name = "c_clase", referencedColumnName = "c_clase")
	@ManyToOne(optional = false)
	private ASClase cClase;
	@JoinColumn(name = "c_interface", referencedColumnName = "c_interface")
	@ManyToOne(optional = false)
	private ASInterface cInterface;
	
	public ASClaseInterface(){}
	public ASClaseInterface(int cClaseInterface, ASClase cClase,ASInterface cInterface){
		this.cClaseInterface=cClaseInterface;
		this.cClase=cClase;
		this.cInterface=cInterface;
	}
	public int getcClaseInterface(){
		return this.cClaseInterface;
	}
	public void setcClaseInterface(int cClaseInterface){
	this.cClaseInterface=cClaseInterface;	
	}
	
	public ASClase getcClase(){
		return this.cClase;
	}
	public void setcClase(ASClase cClase){
		this.cClase=cClase;
	}
	
	public ASInterface getcInterface(){
		return this.cInterface;
	}
	public void setcInterface(ASInterface cInterface){
		this.cInterface=cInterface;
	}
}
