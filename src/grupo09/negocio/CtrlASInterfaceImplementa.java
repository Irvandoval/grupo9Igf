package grupo09.negocio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import grupo09.dao.ASInterfaceImplementaDAO;
import grupo09.dominio.ASInterfaceImplementa;
@Transactional
@Service
public class CtrlASInterfaceImplementa {
	@Autowired
	private ASInterfaceImplementaDAO asiiDAO;

	@Autowired
	public CtrlASInterfaceImplementa(ASInterfaceImplementaDAO asiiDAO) {
		this.asiiDAO = asiiDAO;
	}
	
	public List<ASInterfaceImplementa> daASInterfaceImplementas(){
		return asiiDAO.listarTodos(ASInterfaceImplementa.class);
	}
	
	public boolean agregar(ASInterfaceImplementa tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (asiiDAO.daById(ASInterfaceImplementa.class, tb.getcInterfaceImplementa()) == null) {
			asiiDAO.guardar(tb);
			return true;
		} else {
			return false;
		}

	}
	public boolean editar(ASInterfaceImplementa tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (asiiDAO.daById(ASInterfaceImplementa.class, tb.getcInterfaceImplementa()) != null) {
			asiiDAO.guardar(tb);
			return true; // existe y se guarda
		} else {
			return false;// no existe 
		}

	}
	
	public boolean eliminar(Integer id){
		ASInterfaceImplementa tc= asiiDAO.daById(ASInterfaceImplementa.class, id);
		if(tc != null){
			asiiDAO.eliminar(tc);
			return true;
			
		}else{
			return false;
		}
	}

	public ASInterfaceImplementa obtenerByID(Integer id) {
		return asiiDAO.daById(ASInterfaceImplementa.class, id);
	}
}
