package grupo09.dominio;

import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TB_aplicativo", catalog = "modelo_proyecto", schema = "")
public class TBAplicativo {
     private String cAplicativo;
     private String dAplicativo;
     private String fIngreso;
     private List<ASClase> asClaseList;
     
    public TBAplicativo(){}
	public TBAplicativo(String cAplicativo, String dAplicativo, String fIngreso) {
		this.cAplicativo = cAplicativo;
		this.dAplicativo = dAplicativo;
		this.fIngreso = fIngreso;
	}
	
	@Id
	@Basic(optional = false)
	@Column(name = "c_aplicativo")
	public String getcAplicativo() {
		return cAplicativo;
	}

	public void setcAplicativo(String cAplicativo) {
		this.cAplicativo = cAplicativo;
	}
	@Basic(optional = false)
	@Column(name = "d_aplicativo")
	public String getdAplicativo() {
		return dAplicativo;
	}

	public void setdAplicativo(String dAplicativo) {
		this.dAplicativo = dAplicativo;
	}
	
	@Basic(optional = false)
	@Column(name = "f_ingreso")
	public String getfIngreso() {
		return fIngreso;
	}

	public void setfIngreso(String fIngreso) {
		this.fIngreso = fIngreso;
	}
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "tbAplicativo" )
	public List<ASClase> getAsClaseList() {
		return asClaseList;
	}

	public void setAsClaseList(List<ASClase> asClaseList) {
		this.asClaseList = asClaseList;
	}
     
     
}
