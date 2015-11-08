package grupo09.dao;


import java.util.*;

import grupo09.daogenerica.DAO;
import grupo09.dominio.TBTipoMetodo;
import grupo09.utilidades.datos.HibernateUtil;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//comentario
@Repository
public class TBTipoMetodoDAO implements DAO<TBTipoMetodo, String> {
	
	
	@Autowired
	private HibernateUtil hibernateUtil;
	@Autowired
	public TBTipoMetodoDAO(HibernateUtil hibernateUtil){
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
	
	public void guardar(TBTipoMetodo tbtc) {
		try {
			iniciaOperacion() ;
			sesion.saveOrUpdate(tbtc) ;
			tx.commit() ;
			sesion.flush() ;
			} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
			} finally {
			sesion.close() ;
			}

	}
	
	public  void eliminar(TBTipoMetodo tb){
		iniciaOperacion() ;
		sesion.delete(tb);
		 // 5. Guardo los Cambios de la sesion
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
	}
	
	public List<TBTipoMetodo> listarTodos(Class<TBTipoMetodo> tb) {
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(tb);
		List<TBTipoMetodo> tbtcs = (List<TBTipoMetodo>) crit.list();
		sesion.close();
		return tbtcs;
	}
	
	
	public TBTipoMetodo daById(Class<TBTipoMetodo> tb,String codigo) {
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(tb)
				.add(Restrictions.eq("cTipoMetodo", codigo));
		TBTipoMetodo tbtc=(TBTipoMetodo) crit.uniqueResult();	
		sesion.close();
		return tbtc;
	}

}

