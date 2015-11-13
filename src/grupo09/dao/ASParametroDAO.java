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
import grupo09.dominio.ASMetodo;
import grupo09.dominio.ASParametro;
import grupo09.utilidades.datos.HibernateUtil;

public class ASParametroDAO implements DAO<ASParametro, Integer>{
	@Autowired
	private HibernateUtil hibernateUtil;
	@Autowired
	public ASParametroDAO(HibernateUtil hibernateUtil){
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
	public void guardar(ASParametro obj) {
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
	public void eliminar(ASParametro asp) {
		// TODO Auto-generated method stub
		iniciaOperacion() ;
		sesion.delete(asp);
		 // 5. Guardo los Cambios de la sesion
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
	}
	
	
	
	@Override
	public List<ASParametro> listarTodos(Class<ASParametro> clase) {
		// TODO Auto-generated method stub
		iniciaOperacion();
		Criteria crit = sesion.createCriteria(clase);
		List<ASParametro> asp = (List<ASParametro>) crit.list();
		sesion.close();
		return asp;
	}
	@Override
	public ASParametro daById(Class<ASParametro> clase, Integer id) {
		// TODO Auto-generated method stub
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(clase)
				.add(Restrictions.eq("cPArametro", id));
		ASParametro asp=(ASParametro) crit.uniqueResult();	
		sesion.close();
		return asp;
	}
	}
