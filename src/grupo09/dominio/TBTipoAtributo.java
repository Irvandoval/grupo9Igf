package grupo09.dominio;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TB_tipo_atributo", catalog = "modelo_proyecto", schema = "")
/*@NamedQueries({
@NamedQuery(name = "TBTipoAtributos.findById", query = "SELECT t FROM TBTipoAtributo t WHERE t.cTipoAtributo = :cTipoAtributo"),
@NamedQuery(name = "TBTipoAtributos.findAll", query = "SELECT t FROM TBTipoAtributo t"),
@NamedQuery(name = "TBTipoAtributos.findBydTipoAtributo", query = "SELECT t FROM TBTipoAtributo t WHERE t.dTipoAtributo = :dTipoAtributo") 
})*/
public class TBTipoAtributo implements Serializable{

	
	private static final long serialVersionUID = 1L;
	private String cTipoAtributo;
	private String dTipoAtributo;
	private String fIngreso;
	private List <ASAtributo> asAtributoList;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "tbTipoAtributo" )
	public List<ASAtributo> getAsAtributoList() {
		return asAtributoList;
	}

	public void setAsAtributoList(List<ASAtributo> asAtributoList) {
		this.asAtributoList = asAtributoList;
	}

	public TBTipoAtributo(String cTipoAtributo, String dTipoAtributo, String fIngreso) {
		this.cTipoAtributo = cTipoAtributo;
		this.dTipoAtributo = dTipoAtributo;
		this.fIngreso = fIngreso;
	}
	
	public TBTipoAtributo(){}
	
	@Id
	@Basic(optional = false)
	@Column(name = "c_tipo_atributo")
	public String getcTipoAtributo() {
		return cTipoAtributo;
	}

	public void setcTipoAtributo(String cTipoAtributo) {
		this.cTipoAtributo = cTipoAtributo;
	}
	
	@Basic(optional = false)
	@Column(name = "d_tipo_atributo")
	public String getdTipoAtributo() {
		return dTipoAtributo;
	}

	public void setdTipoAtributo(String dTipoAtributo) {
		this.dTipoAtributo = dTipoAtributo;
	}
	
	@Basic(optional = false)
	@Column(name = "f_ingreso")
	public String getfIngreso() {
		return fIngreso;
	}

	public void setfIngreso(String fIngreso) {
		this.fIngreso = fIngreso;
	}

}
