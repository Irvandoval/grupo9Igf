package grupo09.negocio;

import java.util.List;


import grupo09.dao.ASObservacionDAO;


import grupo09.dominio.ASObservacion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service

public class CtrlASObservacion {
	@Autowired
	private ASObservacionDAO ascDAO;
	
	@Autowired
	public CtrlASObservacion(ASObservacionDAO ascDAO) {
		this.ascDAO = ascDAO;
	}
	
	public List<ASObservacion> daASObservaciones(){    //ases
		return ascDAO.listarTodos(ASObservacion.class);
	}
	
	public boolean agregar(ASObservacion tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (ascDAO.daById(ASObservacion.class, tb.getcObservacion()) == null) {
			ascDAO.guardar(tb);
			return true;
		} else {
			return false;
		}

	}
	
	public boolean editar(ASObservacion tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (ascDAO.daById(ASObservacion.class, tb.getcObservacion()) != null) {
			ascDAO.guardar(tb);
			return true; // existe y se guarda
		} else {
			return false;// no existe 
		}

	}
	
	public boolean eliminar(Integer id){
		ASObservacion tc= ascDAO.daById(ASObservacion.class, id);
		if(tc != null){
			ascDAO.eliminar(tc);
			return true;
			
		}else{
			return false;
		}
	}
	
	public ASObservacion obtenerByID(Integer id) {
		return ascDAO.daById(ASObservacion.class, id);
	}

}
