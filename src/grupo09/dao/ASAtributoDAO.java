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
import grupo09.dominio.ASAtributo;
import grupo09.utilidades.datos.HibernateUtil;

public class ASAtributoDAO implements DAO<ASAtributo, Integer>{

	@Autowired
	private HibernateUtil hibernateUtil;
	@Autowired
	public ASAtributoDAO(HibernateUtil hibernateUtil){
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
	
	public void guardar(ASAtributo asc) {
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
	
	public  void eliminar(ASAtributo asc){
		iniciaOperacion() ;
		sesion.delete(asc);
		 // 5. Guardo los Cambios de la sesion
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
	}

	public List<ASAtributo> listarTodos(Class<ASAtributo> asc) {
		iniciaOperacion();
		Criteria crit = sesion.createCriteria(asc);
		List<ASAtributo> ascs = (List<ASAtributo>) crit.list();
		sesion.close();
		return ascs;
	}


	public ASAtributo daById(Class<ASAtributo> clase, Integer id) {
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(clase)
				.add(Restrictions.eq("cAtributo", id));
		ASAtributo asc=(ASAtributo) crit.uniqueResult();	
		sesion.close();
		return asc;
	}
	
}
