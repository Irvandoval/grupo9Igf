package grupo09.negocio;

import grupo09.dao.TBTipoClaseDAO;

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
}
