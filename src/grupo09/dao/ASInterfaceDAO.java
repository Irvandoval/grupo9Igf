package grupo09.dao;

import java.util.List;

import grupo09.daogenerica.DAO;
import grupo09.dominio.ASClase;
import grupo09.dominio.ASInterface;

import grupo09.utilidades.datos.HibernateUtil;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ASInterfaceDAO implements DAO<ASInterface, Integer>{
	@Autowired
	private HibernateUtil hibernateUtil;
	@Autowired
	public ASInterfaceDAO(HibernateUtil hibernateUtil){
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
	
	public void guardar(ASInterface obj) {
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
	
	public void eliminar(ASInterface obj) {
		iniciaOperacion() ;
		sesion.delete(obj);
		 // 5. Guardo los Cambios de la sesion
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
		
	}
	
	public List<ASInterface> listarTodos(Class<ASInterface> obj) {
		iniciaOperacion();
		Criteria crit = sesion.createCriteria(obj);
		List<ASInterface> objs = (List<ASInterface>) crit.list();
		sesion.close();
		return objs;
	}
	
	public ASInterface daById(Class<ASInterface> clase, Integer id) {
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(clase)
				.add(Restrictions.eq("cInterface", id));
		ASInterface obj=(ASInterface) crit.uniqueResult();	
		sesion.close();
		return obj;
	}

}
