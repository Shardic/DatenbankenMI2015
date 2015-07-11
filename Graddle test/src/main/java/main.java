import Tables.Kunde;

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

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try{
            transaction = session.beginTransaction();
            List kunden = session.createQuery("FROM kunde").list();
            for (int i = 0; i< kunden.size();i++){
                System.out.print("First Name: " + kunden);
            }
            transaction.commit();
        }catch (HibernateException e) {
            if (transaction!=null) transaction.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }

    }
}
