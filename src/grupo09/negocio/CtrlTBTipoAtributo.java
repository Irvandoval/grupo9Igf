package grupo09.negocio;

import grupo09.dao.TBTipoAtributoDAO;
import grupo09.dominio.TBTipoAtributo;
import grupo09.dominio.TBTipoClase;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class CtrlTBTipoAtributo {

	@Autowired
	private TBTipoAtributoDAO tbtcDAO;

	@Autowired
	public CtrlTBTipoAtributo(TBTipoAtributoDAO tbtcDAO) {
		this.tbtcDAO = tbtcDAO;
	}

	public List<TBTipoAtributo> daTBTipoAtributos() {
		return tbtcDAO.listarTodos(TBTipoAtributo.class);
	}

	public boolean agregar(TBTipoAtributo tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (tbtcDAO.daById(TBTipoAtributo.class, tb.getcTipoAtributo()) == null) {
			tbtcDAO.guardar(tb);
			return true;
		} else {
			return false;
		}	
	
    }
	
	public boolean editar(TBTipoAtributo tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (tbtcDAO.daById(TBTipoAtributo.class, tb.getcTipoAtributo()) != null) {
			tbtcDAO.guardar(tb);
			return true; // existe y se guarda
		} else {
			return false;// no existe 
		}

	}
	public boolean eliminar(String id){
		TBTipoAtributo tc= tbtcDAO.daById(TBTipoAtributo.class, id);
		if(tc != null){
			tbtcDAO.eliminar(tc);
			return true;
			
		}else{
			return false;
		}
	}
	
	public TBTipoAtributo obtenerByID(String id) {
		return tbtcDAO.daById(TBTipoAtributo.class, id);
	}
}
