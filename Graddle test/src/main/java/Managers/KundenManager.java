package Managers;

import Hibernate.HibernateUtil;
import Tables.Kunde;
import org.hibernate.Session;
import org.hibernate.Transaction;



/**
 * Created by Fabian on 11.07.15.
 */
public class KundenManager {

    public KundenManager(){}


    public Kunde getKundeByID(int id) {
        Kunde medium = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            medium = (Kunde) session.get(Kunde.class, id);
            transaction.commit();
        }
        catch (Exception e) {
            if (transaction!=null) transaction.rollback();
            throw e;
        }
        finally {
            session.close();
        }
        return medium;
    }
}
