package grupo09.dominio;


import java.io.Serializable;
import java.util.List;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Basic;
import javax.persistence.Column;

@Entity
@Table(name = "TB_tipo_metodo", catalog = "modelo_proyecto", schema = "")

public class TBTipoMetodo implements Serializable{

	private static final long serialVersionUID = 1L;
	private String cTipoMetodo;
	private String dTipoMetodo;
	private String fIngreso;
	private List<ASClase> asMetodoList;
	
	public TBTipoMetodo(String cTipoMetodo, String dTipoMetodo, String fIngreso) {
		this.cTipoMetodo = cTipoMetodo;
		this.dTipoMetodo = dTipoMetodo;
		this.fIngreso = fIngreso;
	}
	
	public TBTipoMetodo(){}
	
	@Id
	@Basic(optional = false)
	@Column(name = "c_tipo_metodo")
	public String getcTipoMetodo() {
		return cTipoMetodo;
	}

	public void setcTipoMetodo(String cTipoClase) {
		this.cTipoMetodo = cTipoMetodo;
	}
	
	@Basic(optional = false)
	@Column(name = "d_tipo_metodo")
	public String getdTipoMetodo() {
		return dTipoMetodo;
	}

	public void setdTipoMetodo(String dTipoClase) {
		this.dTipoMetodo = dTipoMetodo;
	}
	
	@Basic(optional = false)
	@Column(name = "f_ingreso")
	public String getfIngreso() {
		return fIngreso;
	}

	public void setfIngreso(String fIngreso) {
		this.fIngreso = fIngreso;
	}
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "tbTipoMetodo" )
	public List<ASClase> getAsMetodoList() {
		return asMetodoList;
	}

	public void setAsMetodoList(List<ASClase> asClaseList) {
		this.asMetodoList = asMetodoList;
	}
	
}

