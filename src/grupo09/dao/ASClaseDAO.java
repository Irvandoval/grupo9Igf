package grupo09.dao;

import java.util.List;

import grupo09.utilidades.datos.HibernateUtil;
import grupo09.daogenerica.DAO;
import grupo09.dominio.ASClase;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ASClaseDAO implements DAO<ASClase, Integer>{
	@Autowired
	private HibernateUtil hibernateUtil;
	@Autowired
	public ASClaseDAO(HibernateUtil hibernateUtil){
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
	
	public void guardar(ASClase asc) {
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
	
	public  void eliminar(ASClase asc){
		iniciaOperacion() ;
		sesion.delete(asc);
		 // 5. Guardo los Cambios de la sesion
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
	}
	
	public List<ASClase> listarTodos(Class<ASClase> asc) {
		iniciaOperacion();
		Criteria crit = sesion.createCriteria(asc);
		List<ASClase> ascs = (List<ASClase>) crit.list();
		sesion.close();
		return ascs;
	}


	public ASClase daById(Class<ASClase> clase, Integer id) {
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(clase)
				.add(Restrictions.eq("cClase", id));
		ASClase asc=(ASClase) crit.uniqueResult();	
		sesion.close();
		return asc;
	}
}
