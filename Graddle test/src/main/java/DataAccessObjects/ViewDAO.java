package DataAccessObjects;

import Hibernate.HibernateUtil;
import Views.*;
import Views.FahrzeugeMitTermindaten;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Konrad on 18.07.2015.
 *
 * das sind die VIEWS, von Hibernate werden sie wie normale Tabellen behandelt und benötigen daher Primary Keys (siehe view mapping datein)
 * Man sollte jedoch nicht versuchen hier Daten zu schreiben, denn das geht bei Views nicht und würde sicher zu fehlern führen, das ganze ist also
 * READ ONLY
 */
public class ViewDAO {

    public ViewDAO() {

    }

    public List<FahrzeugeMitTermindaten> getFahrzeugeMitTermindaten(String start, String end){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List myview = null;
        try{
            tx = session.beginTransaction();
            myview =  session.createQuery("FROM FahrzeugeMitTermindaten WHERE endtag >= '" + start + "' AND starttag <= '" + end + "'").list();
            if (myview.size() == 0) {
                System.out.println("Keine Fahrzeuge mehr zu den Daten verfügbar");
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

    /**
     * Gibt die Liste der Rechnungen von Kunde X zurück;
     * @param nummer Kundennummer
     * @return List<Rechnungsansicht> Kunden Rechnungen
     */
    public List<Rechnungsansicht> getRechnungsansicht(Integer nummer){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List myview = null;
        try{
            tx = session.beginTransaction();
            myview = session.createQuery("FROM Rechnungsansicht where rkundennummer ="+nummer).list();
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return myview;
    }

    /**
     * Gibt die Liste der Rechnungen aller Rechnungsansichten zurück;
     * @return List<Rechnungsansicht>  Rechnungen
     */
    public List<Rechnungsansicht> getRechnungsansicht(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List myview = null;
        try{
            tx = session.beginTransaction();
            myview = session.createQuery("FROM Rechnungsansicht").list();
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