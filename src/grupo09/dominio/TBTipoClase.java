package grupo09.dominio;

import java.io.Serializable;
import java.util.List;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Basic;
import javax.persistence.Column;

@Entity
@Table(name = "TB_tipo_clase", catalog = "modelo_proyecto", schema = "")
/*@NamedQueries({
	@NamedQuery(name = "TBTipoClases.findById", query = "SELECT t FROM TBTipoClase t WHERE t.cTipoClase = :cTipoClase"),
	@NamedQuery(name = "TBTipoClases.findAll", query = "SELECT t FROM TBTipoClase t"),
    @NamedQuery(name = "TBTipoClases.findBydTipoClase", query = "SELECT t FROM TBTipoClase t WHERE t.dTipoClase = :dTipoClase") 
	})*/
public class TBTipoClase implements Serializable{
	/**
	 * version serial 
	 */
	private static final long serialVersionUID = 1L;
	private String cTipoClase;
	private String dTipoClase;
	private String fIngreso;
	private List<ASClase> asClaseList;
	
	
	
	public TBTipoClase(String cTipoClase, String dTipoClase, String fIngreso) {
		this.cTipoClase = cTipoClase;
		this.dTipoClase = dTipoClase;
		this.fIngreso = fIngreso;
	}
	
	public TBTipoClase(){}
	
	@Id
	@Basic(optional = false)
	@Column(name = "c_tipo_clase")
	public String getcTipoClase() {
		return cTipoClase;
	}

	public void setcTipoClase(String cTipoClase) {
		this.cTipoClase = cTipoClase;
	}
	
	@Basic(optional = false)
	@Column(name = "d_tipo_clase")
	public String getdTipoClase() {
		return dTipoClase;
	}

	public void setdTipoClase(String dTipoClase) {
		this.dTipoClase = dTipoClase;
	}
	
	@Basic(optional = false)
	@Column(name = "f_ingreso")
	public String getfIngreso() {
		return fIngreso;
	}

	public void setfIngreso(String fIngreso) {
		this.fIngreso = fIngreso;
	}
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "tbTipoClase" )
	public List<ASClase> getAsClaseList() {
		return asClaseList;
	}

	public void setAsClaseList(List<ASClase> asClaseList) {
		this.asClaseList = asClaseList;
	}



}
