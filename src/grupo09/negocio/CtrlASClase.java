package grupo09.negocio;

import java.util.List;

import grupo09.dao.ASClaseDAO;
import grupo09.dominio.ASClase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class CtrlASClase {
	@Autowired
	private ASClaseDAO ascDAO;

	@Autowired
	public CtrlASClase(ASClaseDAO ascDAO) {
		this.ascDAO = ascDAO;
	}
	
	public List<ASClase> daASClases(){
		return ascDAO.listarTodos(ASClase.class);
	}
	
	public boolean agregar(ASClase tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (ascDAO.daById(ASClase.class, tb.getcClase()) == null) {
			ascDAO.guardar(tb);
			return true;
		} else {
			return false;
		}

	}
	public boolean editar(ASClase tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (ascDAO.daById(ASClase.class, tb.getcClase()) != null) {
			ascDAO.guardar(tb);
			return true; // existe y se guarda
		} else {
			return false;// no existe 
		}

	}
	
	public boolean eliminar(Integer id){
		ASClase tc= ascDAO.daById(ASClase.class, id);
		if(tc != null){
			ascDAO.eliminar(tc);
			return true;
			
		}else{
			return false;
		}
	}

	public ASClase obtenerByID(Integer id) {
		return ascDAO.daById(ASClase.class, id);
	}

}
