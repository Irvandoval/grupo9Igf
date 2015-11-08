package grupo09.dao;

import java.util.*;

import grupo09.daogenerica.DAO;
import grupo09.dominio.TBTipoAtributo;
import grupo09.utilidades.datos.HibernateUtil;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
//comentario
@Repository
public class TBTipoAtributoDAO implements DAO<TBTipoAtributo, String>{
	@Autowired
	private HibernateUtil hibernateUtil;
	@Autowired
	public TBTipoAtributoDAO(HibernateUtil hibernateUtil){
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

	public void guardar(TBTipoAtributo tbtc) {
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
	public  void eliminar(TBTipoAtributo tb){
		iniciaOperacion() ;
		sesion.delete(tb);
		 // 5. Guardo los Cambios de la sesion
	    tx.commit() ;
	    sesion.flush() ;
	    // 6. Cierro la sesion
	    sesion.close() ;
	}

	public List<TBTipoAtributo> listarTodos(Class<TBTipoAtributo> tb) {
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(tb);
		List<TBTipoAtributo> tbtcs = (List<TBTipoAtributo>) crit.list();
		sesion.close();
		return tbtcs;
	}

	public TBTipoAtributo daById(Class<TBTipoAtributo> tb,String codigo) {
		sesion = sessionFactory.openSession();
		Criteria crit = sesion.createCriteria(tb)
				.add(Restrictions.eq("cTipoAtributo", codigo));
		TBTipoAtributo tbtc=(TBTipoAtributo) crit.uniqueResult();	
		sesion.close();
		return tbtc;
	}

}
