package grupo09.negocio;

import grupo09.dao.ASClaseInterfaceDAO;
import grupo09.dominio.ASClaseInterface;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class CtrlASClaseInterface {
	@Autowired
	private ASClaseInterfaceDAO objDao;
	@Autowired
	public CtrlASClaseInterface(ASClaseInterfaceDAO objDao) {
		this.objDao = objDao;
	}
	public List<ASClaseInterface> daASInterface(){
		return objDao.listarTodos(ASClaseInterface.class);
	}
	public boolean agregar(ASClaseInterface tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (objDao.daById(ASClaseInterface.class, tb.getcClaseInterface()) == null) {
			objDao.guardar(tb);
			return true;
		} else {
			return false;
		}

	}
	public boolean editar(ASClaseInterface tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (objDao.daById(ASClaseInterface.class, tb.getcClaseInterface()) != null) {
			objDao.guardar(tb);
			return true; // existe y se guarda
		} else {
			return false;// no existe 
		}

	}
	
	public boolean eliminar(Integer id){
		ASClaseInterface tc= objDao.daById(ASClaseInterface.class, id);
		if(tc != null){
			objDao.eliminar(tc);
			return true;
			
		}else{
			return false;
		}
	}

	public ASClaseInterface obtenerByID(Integer id) {
		return objDao.daById(ASClaseInterface.class, id);
	}
	
}
