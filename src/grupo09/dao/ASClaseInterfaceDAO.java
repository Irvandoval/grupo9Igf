package grupo09.dao;

import java.util.List;

import grupo09.daogenerica.DAO;
import grupo09.dominio.ASClase;
import grupo09.dominio.ASClaseInterface;
import grupo09.dominio.ASInterfaceImplementa;
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
public class ASClaseInterfaceDAO implements DAO<ASClaseInterface, Integer> {
	@Autowired
	private HibernateUtil hibernateUtil;
	@Autowired
	public ASClaseInterfaceDAO(HibernateUtil hibernateUtil){
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

	public void guardar(ASClaseInterface asci) {
		try {
			iniciaOperacion() ;
			sesion.saveOrUpdate(asci) ;
			tx.commit() ;
			sesion.flush() ;
			} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
			} finally {
			sesion.close() ;
			}
		
	}

	public void eliminar(ASClaseInterface asci) {
		iniciaOperacion() ;
		sesion.delete(asci);
		 // 5. Guardo los Cambios de la sesion
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
	}


	public List<ASClaseInterface> listarTodos(Class<ASClaseInterface> clase) {
		iniciaOperacion();
		Criteria crit = sesion.createCriteria(clase);
		List<ASClaseInterface> ascis = (List<ASClaseInterface>) crit.list();
		sesion.close();
		return ascis;
	}

	
	public ASClaseInterface daById(Class<ASClaseInterface> clase, Integer id) {
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(clase)
				.add(Restrictions.eq("cClaseInterface", id));
		ASClaseInterface asii=(ASClaseInterface) crit.uniqueResult();	
		sesion.close();
		return asii;
	}
	
}
