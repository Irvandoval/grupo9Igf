package grupo09.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import grupo09.daogenerica.DAO;
import grupo09.dominio.ASClase;
import grupo09.dominio.ASInterfaceImplementa;
import grupo09.utilidades.datos.HibernateUtil;
@Repository
public class ASInterfaceImplementaDAO implements DAO<ASInterfaceImplementa, Integer>{
	@Autowired
	private HibernateUtil hibernateUtil;
	@Autowired
	public ASInterfaceImplementaDAO(HibernateUtil hibernateUtil){
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
	
	public void guardar(ASInterfaceImplementa asii) {
		try {
			iniciaOperacion() ;
			sesion.saveOrUpdate(asii) ;
			tx.commit() ;
			sesion.flush() ;
			} catch (HibernateException he) {
			manejaExcepcion(he) ;
			throw he ;
			} finally {
			sesion.close() ;
			}
		
	}

	public void eliminar(ASInterfaceImplementa asii) {
		iniciaOperacion() ;
		sesion.delete(asii);
		 // 5. Guardo los Cambios de la sesion
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
		
	}

	@Override
	public List<ASInterfaceImplementa> listarTodos(
			Class<ASInterfaceImplementa> casii) {
		iniciaOperacion();
		Criteria crit = sesion.createCriteria(casii);
		List<ASInterfaceImplementa> asiis = (List<ASInterfaceImplementa>) crit.list();
		sesion.close();
		return asiis;
	}

	@Override
	public ASInterfaceImplementa daById(Class<ASInterfaceImplementa> casii,
			Integer id) {
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(casii)
				.add(Restrictions.eq("cInterfaceImplementa", id));
		ASInterfaceImplementa asii=(ASInterfaceImplementa) crit.uniqueResult();	
		sesion.close();
		return asii;
	}

}
