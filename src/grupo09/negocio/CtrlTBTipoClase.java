package grupo09.negocio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import grupo09.dao.TBTipoClaseDAO;
import grupo09.dominio.TBTipoClase;

@Transactional
@Service
public class CtrlTBTipoClase {

	@Autowired
	private TBTipoClaseDAO tbtcDAO;

	@Autowired
	public CtrlTBTipoClase(TBTipoClaseDAO tbtcDAO) {
		this.tbtcDAO = tbtcDAO;
	}

	public List<TBTipoClase> daTBTipoClases() {
		return tbtcDAO.listarTodos(TBTipoClase.class);
	}

	public boolean agregar(TBTipoClase tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (tbtcDAO.daById(TBTipoClase.class, tb.getcTipoClase()) == null) {
			tbtcDAO.guardar(tb);
			return true;
		} else {
			return false;
		}

	}
	public boolean editar(TBTipoClase tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (tbtcDAO.daById(TBTipoClase.class, tb.getcTipoClase()) != null) {
			tbtcDAO.guardar(tb);
			return true; // existe y se guarda
		} else {
			return false;// no existe 
		}

	}
	public boolean eliminar(String id){
		TBTipoClase tc= tbtcDAO.daById(TBTipoClase.class, id);
		if(tc != null){
			tbtcDAO.eliminar(tc);
			return true;
			
		}else{
			return false;
		}
	}

	public TBTipoClase obtenerByID(String id) {
		return tbtcDAO.daById(TBTipoClase.class, id);
	}
	

}
