package grupo09.negocio;

import java.util.List;

import grupo09.dao.TBAplicativoDAO;
import grupo09.dominio.TBAplicativo;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class CtrlTBAplicativo {

	@Autowired
	private TBAplicativoDAO tbtcDAO;

	@Autowired
	public CtrlTBAplicativo(TBAplicativoDAO tbtcDAO) {
		this.tbtcDAO = tbtcDAO;
	}
	
	public List<TBAplicativo> daTBAplicativos() {
		return tbtcDAO.listarTodos(TBAplicativo.class);
	}

	public boolean agregar(TBAplicativo tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (tbtcDAO.daById(TBAplicativo.class, tb.getcAplicativo()) == null) {
			tbtcDAO.guardar(tb);
			return true;
		} else {
			return false;
		}

	}
	public boolean editar(TBAplicativo tb) {
		// comprobamos si no existe un registro con el id ingresado
		if (tbtcDAO.daById(TBAplicativo.class, tb.getcAplicativo()) != null) {
			tbtcDAO.guardar(tb);
			return true; // existe y se guarda
		} else {
			return false;// no existe 
		}

	}
	public boolean eliminar(String id){
		TBAplicativo tc= tbtcDAO.daById(TBAplicativo.class, id);
		if(tc != null){
			tbtcDAO.eliminar(tc);
			return true;
			
		}else{
			return false;
		}
	}

	public TBAplicativo obtenerByID(String id) {
		return tbtcDAO.daById(TBAplicativo.class, id);
	}
}
