package grupo09.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import grupo09.daogenerica.DAO;
import grupo09.dominio.TBAplicativo;
import grupo09.utilidades.datos.HibernateUtil;


public class TBAplicativoDAO implements DAO<TBAplicativo, String> {
	@Autowired
	private HibernateUtil hibernateUtil;
	@Autowired
	public TBAplicativoDAO(HibernateUtil hibernateUtil){
		this.hibernateUtil = hibernateUtil;
	}
	private SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	private Session sesion;
	private Transaction tx;
	

	private void iniciaOperacion() throws HibernateException {
		sesion = sessionFactory.openSession();
		tx = sesion.beginTransaction();
	}

	private void manejaExcepcion(HibernateException he)
			throws HibernateException {
		tx.rollback();
		throw new HibernateException("Ocurrió un error en la capa DAO", he);
	}

	@Override
	public void guardar(TBAplicativo obj) {
		try {
			iniciaOperacion() ;
			sesion.saveOrUpdate(obj) ;
			tx.commit() ;
			sesion.flush() ;
			} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
			} finally {
			sesion.close() ;
			}
		
	}

	@Override
	public void eliminar(TBAplicativo obj) {
		// TODO Auto-generated method stub
		iniciaOperacion() ;
		sesion.delete(obj);
		 // 5. Guardo los Cambios de la sesion
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
		
	}

	@Override
	public List<TBAplicativo> listarTodos(Class<TBAplicativo> clase) {
		// TODO Auto-generated method stub
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(clase);
		List<TBAplicativo> tbtcs = (List<TBAplicativo>) crit.list();
		sesion.close();
		return tbtcs;
	}

	@Override
	public TBAplicativo daById(Class<TBAplicativo> clase, String codigo) {
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(clase)
				.add(Restrictions.eq("cTipoClase", codigo));
		TBAplicativo tbtc=(TBAplicativo) crit.uniqueResult();	
		sesion.close();
		return tbtc;
	}
	
}
