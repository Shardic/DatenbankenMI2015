import Tabels.Kunde;
import javax.security.auth.login.Configuration;
import java.awt.*;
import java.util.*;
import java.util.List;

import org.hibernate.*;


/**
 * Created by Fabian on 27.06.15.
 */
public class main {
    public static void main(String [] args) {
        System.out.println("Hello World");


        //DBConnection d = new DBConnection();

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Criteria criteria = session.createCriteria(Kunde.class);
            List allUsers = criteria.list();
            System.out.print("HIER" + allUsers.get(0));

            transaction.commit();
        }
        catch (Exception e) {
            System.err.print("HIER FEHLER");
            if (transaction!=null) transaction.rollback();
            throw e;
        }
        finally {
            session.close();
        }

    }
}
