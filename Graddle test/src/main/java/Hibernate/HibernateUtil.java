package Hibernate;
/**
 * Created by Fabian on 11.07.15.
 */
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtil {
    private static SessionFactory mSessionFactory = buildSessionFactory();

    private static SessionFactory buildSessionFactory(){
        try{
            if(mSessionFactory == null){
                Configuration configuration = new Configuration().configure(HibernateUtil.class.getResource("/hibernate.cfg.xml"));
                StandardServiceRegistryBuilder serviceRegistryBuilder = new StandardServiceRegistryBuilder();
                serviceRegistryBuilder.applySettings(configuration.getProperties());
                ServiceRegistry serviceRegistry = serviceRegistryBuilder.build();
                mSessionFactory = configuration.buildSessionFactory(serviceRegistry);
            }
            return mSessionFactory;
        } catch(Throwable e){
            System.err.println("Initial SessionFactory creation failed." + e);
            throw new ExceptionInInitializerError(e);
        }
    }

    public static SessionFactory getSessionFactory(){
        return mSessionFactory;
    }

    public static void shutdown()
    {
        getSessionFactory().close();
    }
}
