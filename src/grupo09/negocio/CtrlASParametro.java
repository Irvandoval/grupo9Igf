package grupo09.negocio;


import grupo09.dao.ASParametroDAO;

import grupo09.dominio.ASParametro;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class CtrlASParametro {
	
	@Autowired
	private ASParametroDAO aspDAO;

	
	@Autowired
	public CtrlASParametro(ASParametroDAO aspDAO) {
		this.aspDAO = aspDAO;
	}
	
	public List<ASParametro> daASParametros(){
		return aspDAO.listarTodos(ASParametro.class);
	}
	
	public boolean agregar(ASParametro tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (aspDAO.daById(ASParametro.class, tb.getcPArametro()) == null) {
			aspDAO.guardar(tb);
			return true;
		} else {
			return false;
		}

	}
	public boolean editar(ASParametro tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (aspDAO.daById(ASParametro.class, tb.getcPArametro()) != null) {
			aspDAO.guardar(tb);
			return true; // existe y se guarda
		} else {
			return false;// no existe 
		}

	}
	
	public boolean eliminar(Integer id){
		ASParametro tc= aspDAO.daById(ASParametro.class, id);
		if(tc != null){
			aspDAO.eliminar(tc);
			return true;
			
		}else{
			return false;
		}
	}

	public ASParametro obtenerByID(Integer id) {
		return aspDAO.daById(ASParametro.class, id);
	}

}
