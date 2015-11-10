package grupo09.dao;

import java.util.List;

import grupo09.daogenerica.DAO;
import grupo09.dominio.ASClase;
import grupo09.utilidades.datos.HibernateUtil;
import grupo09.dominio.ASMetodo;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

public class ASMetodoDAO implements DAO<ASMetodo, Integer>{
	@Autowired
	private HibernateUtil hibernateUtil;
	@Autowired
	public ASMetodoDAO(HibernateUtil hibernateUtil){
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
	public void guardar(ASMetodo obj) {
		// TODO Auto-generated method stub
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
	public void eliminar(ASMetodo asm) {
		// TODO Auto-generated method stub
		
		iniciaOperacion() ;
		sesion.delete(asm);
		 // 5. Guardo los Cambios de la sesion
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;

		
	}
	@Override
	public List<ASMetodo> listarTodos(Class<ASMetodo> clase) {
		iniciaOperacion();
		Criteria crit = sesion.createCriteria(clase);
		List<ASMetodo> ascm = (List<ASMetodo>) crit.list();
		sesion.close();
		return ascm;
	}
	@Override
	public ASMetodo daById(Class<ASMetodo> clase, Integer id) {
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(clase)
				.add(Restrictions.eq("cMetodo", id));
		ASMetodo asm=(ASMetodo) crit.uniqueResult();	
		sesion.close();
		return asm;
	}
}