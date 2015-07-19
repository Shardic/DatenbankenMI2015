package DataAccessObjects;

import Hibernate.HibernateUtil;
import Views.*;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

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

    /**
     * Diese Methode gibt eine Liste mit allen Kunden und deren Rechnungen zurück;
     * @return List<KundeZuRechnung> kunden mit Rechnung
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

    /**
     * Gibt die Liste der Standorte und Mitarbeiter an zurück;
     * @return List<Arbeitsort> Standorte und Mitarbeiter
     */
    public List<Arbeitsort> getArbeitsort(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List myview = null;
        try{
            tx = session.beginTransaction();
            myview = session.createQuery("FROM Arbeitsort").list();
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
     * Gibt die Liste der Rechnungen;
     * @return List<RechnungProTermin> Standorte und Mitarbeiter
     */
    public List<RechnungProTermin> getRechnungProTermin(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List myview = null;
        try{
            tx = session.beginTransaction();
            myview = session.createQuery("FROM RechnungProTermin").list();
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
     * Gibt die Liste der Fahrzeuge, die an Terminen ausgeliehen wurde;
     * @return List<TerminFahrzeug> Standorte und Mitarbeiter
     */
    public List<TerminFahrzeug> getTerminFahrzeug(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List myview = null;
        try{
            tx = session.beginTransaction();
            myview = session.createQuery("FROM TerminFahrzeug").list();
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
     * Gibt die Liste der Kundentermine zurück;
     * @return List<TerminZuKunde> Kundentermine
     */
    public List<TerminZuKunde> getTerminZuKunde(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List myview = null;
        try{
            tx = session.beginTransaction();
            myview = session.createQuery("FROM TerminZuKunde").list();
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