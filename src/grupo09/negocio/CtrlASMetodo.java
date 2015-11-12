package grupo09.negocio;

import java.util.List;

import grupo09.dao.ASClaseDAO;
import grupo09.dao.ASMetodoDAO;
import grupo09.dominio.ASClase;
import grupo09.dominio.ASMetodo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Transactional
@Service
public class CtrlASMetodo {
	
	@Autowired
	private ASMetodoDAO asmDAO;

	
	@Autowired
	public CtrlASMetodo(ASMetodoDAO asmDAO) {
		this.asmDAO = asmDAO;
	}
	
	public List<ASMetodo> daASMetodos(){
		return asmDAO.listarTodos(ASMetodo.class);
	}
	
	public boolean agregar(ASMetodo tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (asmDAO.daById(ASMetodo.class, tb.getcClase()) == null) {
			asmDAO.guardar(tb);
			return true;
		} else {
			return false;
		}

	}
	public boolean editar(ASMetodo tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (asmDAO.daById(ASMetodo.class, tb.getcClase()) != null) {
			asmDAO.guardar(tb);
			return true; // existe y se guarda
		} else {
			return false;// no existe 
		}

	}
	
	public boolean eliminar(Integer id){
		ASMetodo tc= asmDAO.daById(ASMetodo.class, id);
		if(tc != null){
			asmDAO.eliminar(tc);
			return true;
			
		}else{
			return false;
		}
	}

	public ASMetodo obtenerByID(Integer id) {
		return asmDAO.daById(ASMetodo.class, id);
	}

}
