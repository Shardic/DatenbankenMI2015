import Managers.KundenManager;
import Tables.Kunde;
import Hibernate.HibernateUtil;

import java.util.Iterator;
import java.util.List;

import org.hibernate.*;

/**
 * Created by Fabian on 27.06.15.
 */
public class main {



    public static void main(String [] args) {
        System.out.println("Hello World");


        //DBConnection d = new DBConnection();
        Kunde medium = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        int newKid;
        try {
            transaction = session.beginTransaction();
            Kunde newk = new Kunde("name", "email");
            newKid = (Integer) session.save(newk);
            transaction.commit();
        }
        catch (Exception e) {
            if (transaction!=null) transaction.rollback();
            throw e;
        }
        finally {
            session.close();
        }


    }
}
