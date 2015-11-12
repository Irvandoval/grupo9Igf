package grupo09.negocio;

import grupo09.dao.ASAtributoDAO;
import grupo09.dominio.ASAtributo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class CtrlASAtributo {

	@Autowired
	private ASAtributoDAO ascDAO;

	@Autowired
	public CtrlASAtributo(ASAtributoDAO ascDAO) {
		this.ascDAO = ascDAO;
	}
	
	public List<ASAtributo> daASAtributos(){
		return ascDAO.listarTodos(ASAtributo.class);
	}
	
	public boolean agregar(ASAtributo tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (ascDAO.daById(ASAtributo.class, tb.getcAtributo()) == null) {
			ascDAO.guardar(tb);
			return true;
		} else {
			return false;
		}

	}
	public boolean editar(ASAtributo tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (ascDAO.daById(ASAtributo.class, tb.getcAtributo()) != null) {
			ascDAO.guardar(tb);
			return true; // existe y se guarda
		} else {
			return false;// no existe 
		}

	}
	
	public boolean eliminar(Integer id){
		ASAtributo tc= ascDAO.daById(ASAtributo.class, id);
		if(tc != null){
			ascDAO.eliminar(tc);
			return true;
			
		}else{
			return false;
		}
	}

	public ASAtributo obtenerByID(Integer id) {
		return ascDAO.daById(ASAtributo.class, id);
	}
	
	
}
