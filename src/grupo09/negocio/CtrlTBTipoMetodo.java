package grupo09.negocio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import grupo09.dao.TBTipoMetodoDAO;
import grupo09.dominio.TBTipoMetodo;

@Transactional
@Service
public class CtrlTBTipoMetodo {

	
	@Autowired
	private TBTipoMetodoDAO tbtcDAO;
	
	
	@Autowired	    
	public CtrlTBTipoMetodo(TBTipoMetodoDAO tbtcDAO) {
		this.tbtcDAO = tbtcDAO;
	}
	
	public List<TBTipoMetodo> daTBTipoMetodos() {
		return tbtcDAO.listarTodos(TBTipoMetodo.class);
	}
	
	
	public boolean agregar(TBTipoMetodo tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (tbtcDAO.daById(TBTipoMetodo.class, tb.getcTipoMetodo()) == null) {
			tbtcDAO.guardar(tb);
			return true;
		} else {
			return false;
		}
	}
	
	public boolean editar(TBTipoMetodo tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (tbtcDAO.daById(TBTipoMetodo.class, tb.getcTipoMetodo()) != null) {
			tbtcDAO.guardar(tb);
			return true; // existe y se guarda
		} else {
			return false;// no existe 
		}

	}
	
	public boolean eliminar(String id){
		TBTipoMetodo tc= tbtcDAO.daById(TBTipoMetodo.class, id);
		if(tc != null){
			tbtcDAO.eliminar(tc);
			return true;
			
		}else{
			return false;
		}
	}
	
	public TBTipoMetodo obtenerByID(String id) {
		return tbtcDAO.daById(TBTipoMetodo.class, id);
	}
	
}