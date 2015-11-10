package grupo09.dao;

import java.util.List;

import grupo09.utilidades.datos.HibernateUtil;
import grupo09.daogenerica.DAO;
import grupo09.dominio.ASClase;
import grupo09.dominio.ASObservacion;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ASObservacionDAO implements DAO<ASObservacion, Integer> {

	@Autowired
	private HibernateUtil hibernateUtil;
	@Autowired
	public ASObservacionDAO(HibernateUtil hibernateUtil){
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
		throw new HibernateException("Ocurrio un error en la capa DAO", he);
	}
	
	
	public void guardar(ASObservacion asc) {
		try {
			iniciaOperacion() ;
			sesion.saveOrUpdate(asc) ;
			tx.commit() ;
			sesion.flush() ;
			} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
			} finally {
			sesion.close() ;
			}

	}
	
	public  void eliminar(ASObservacion asc){
		iniciaOperacion() ;
		sesion.delete(asc);
		 // 5. Guardo los Cambios de la sesion
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
	}
	
	public List<ASObservacion> listarTodos(Class<ASObservacion> asc) {
		iniciaOperacion();
		Criteria crit = sesion.createCriteria(asc);
		List<ASObservacion> ascs = (List<ASObservacion>) crit.list();
		sesion.close();
		return ascs;
	}


	public ASObservacion daById(Class<ASObservacion> clase, Integer id) {
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(clase)
				.add(Restrictions.eq("cObservacion", id));
		ASObservacion asc=(ASObservacion) crit.uniqueResult();	
		sesion.close();
		return asc;
	}
	
}
