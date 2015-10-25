package grupo09.utilidades.datos;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class HibernateUtil {
    private static SessionFactory sessionFactory;
    
    public HibernateUtil(){ 
        try {
        	Configuration configuration = new Configuration();
            configuration.configure();
            ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();        
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);          
        } catch (Throwable e) {
        	System.err.println("Error in creating SessionFactory object." 
                    + e.getMessage());
            throw new ExceptionInInitializerError(e);
        }
    }
        
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
