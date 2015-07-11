import Managers.KundenManager;
import Tables.Kunde;
import Hibernate.HibernateUtil;

import java.util.Iterator;
import java.util.List;

import org.hibernate.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Created by Fabian on 27.06.15.
 */
public class main {



    public static void main(String [] args) {
        System.out.println("Hello World");
          /*
            Kunde newk = new Kunde("name", "email");
            newKid = (Integer) session.save(newk);
            */

        //http://www.tutorialspoint.com/hibernate/hibernate_quick_guide.htm




        //DBConnection d = new DBConnection();
        Kunde medium = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            List employees = session.createQuery("FROM Kunde").list();
            for (Iterator iterator =
                 employees.iterator(); iterator.hasNext();){
                Kunde employee = (Kunde) iterator.next();
                System.out.print("First Name: " + employee.getName());
                System.out.print("  Last Name: " + employee.getEmail());
                System.out.println("  Salary: " + employee.getId());
            }
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }
}
