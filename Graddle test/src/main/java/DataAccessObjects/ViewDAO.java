package DataAccessObjects;

import Hibernate.HibernateUtil;
import Views.KundeZuRechnung;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.Iterator;
import java.util.List;

/**
 * Created by Konrad on 18.07.2015.
 */
public class ViewDAO {

    public ViewDAO() {

    }

    /**
     * Diese Methode gibt eine Liste mit allen Kunden zurück;
     * Success return List mit allen Kunden
     * fail: return null
     * @return List<Kunde> kunden
     */
    public List<KundeZuRechnung> getKundeZuRechnungView(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List myview = null;
        try{
            tx = session.beginTransaction();
            myview = session.createQuery("FROM KundeZuRechnung").list();

            for (Iterator iterator = myview.iterator(); iterator.hasNext();){
                KundeZuRechnung kunde = (KundeZuRechnung) iterator.next();
                System.out.println("Kundennummer: " + kunde.getKundennummer());
                System.out.println("Rechnungsnummer: " + kunde.getRechnungsnummer());
                System.out.println("Betrag: " + kunde.getRechnungsbetrag());
                System.out.println("Name: " + kunde.getName());
            }

            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return myview;
    }
}
