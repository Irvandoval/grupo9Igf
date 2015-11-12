package grupo09.negocio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import grupo09.dao.ASInterfaceDAO;
import grupo09.dominio.ASInterface;


public class CtrlASInterface {
	@Autowired
	private ASInterfaceDAO objDao;
	@Autowired
	public CtrlASInterface(ASInterfaceDAO objDao) {
		this.objDao = objDao;
	}
	public List<ASInterface> daASInterface(){
		return objDao.listarTodos(ASInterface.class);
	}
	public boolean agregar(ASInterface tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (objDao.daById(ASInterface.class, tb.getcInterface()) == null) {
			objDao.guardar(tb);
			return true;
		} else {
			return false;
		}

	}
	public boolean editar(ASInterface tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (objDao.daById(ASInterface.class, tb.getcInterface()) != null) {
			objDao.guardar(tb);
			return true; // existe y se guarda
		} else {
			return false;// no existe 
		}

	}
	
	public boolean eliminar(Integer id){
		ASInterface tc= objDao.daById(ASInterface.class, id);
		if(tc != null){
			objDao.eliminar(tc);
			return true;
			
		}else{
			return false;
		}
	}

	public ASInterface obtenerByID(Integer id) {
		return objDao.daById(ASInterface.class, id);
	}
	
}
