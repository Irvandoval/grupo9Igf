package grupo09.dao;

import java.util.*;

import grupo09.daogenerica.DAO;
import grupo09.dominio.TBTipoClase;
import grupo09.utilidades.datos.HibernateUtil;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
//comentario
@Repository
public class TBTipoClaseDAO implements DAO<TBTipoClase, String>{
	@Autowired
	private HibernateUtil hibernateUtil;
	@Autowired
	public TBTipoClaseDAO(HibernateUtil hibernateUtil){
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

	public void guardar(TBTipoClase tbtc) {
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
	public  void eliminar(TBTipoClase tb){
		iniciaOperacion() ;
		sesion.delete(tb);
		 // 5. Guardo los Cambios de la sesion
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
	}

	public List<TBTipoClase> listarTodos(Class<TBTipoClase> tb) {
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(tb);
		List<TBTipoClase> tbtcs = (List<TBTipoClase>) crit.list();
		sesion.close();
		return tbtcs;
	}

	public TBTipoClase daById(Class<TBTipoClase> tb,String codigo) {
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(tb)
				.add(Restrictions.eq("cTipoClase", codigo));
		TBTipoClase tbtc=(TBTipoClase) crit.uniqueResult();	
		sesion.close();
		return tbtc;
	}

}
