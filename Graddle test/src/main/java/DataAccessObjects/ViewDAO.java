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
     * Diese Methode gibt eine Liste mit den Rechnungen von Kunde X zurück;
     * @param nummer Kundennummer
     * @return List<KundeZuRechnung> Rechnungen von Kunde X
     */
    public List<KundeZuRechnung> getKundeZuRechnungView(Integer nummer){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List myview = null;
        try{
            tx = session.beginTransaction();
            myview = session.createQuery("FROM KundeZuRechnung k where k.kundennummer = "+nummer).list();

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
     * Gibt die Liste der Termine von Kunde X zurück;
     *
     * @return List<TerminZuKunde> Kundentermine
     */
    public List<TerminZuKunde> getTerminZuKunde(Integer nummer){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List myview = null;
        try{
            tx = session.beginTransaction();
            myview = session.createQuery("FROM TerminZuKunde k where k.tkundennummer = "+nummer).list();
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
     * Gibt die Liste ALLER Kundentermine zurück;
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

    public List<FahrzeugeMitTermindaten> getFahrzeugeMitTermindaten(String start, String end){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List myview = null;
        System.out.println(start);
        try{
            tx = session.beginTransaction();
            myview =  session.createQuery("FROM FahrzeugeMitTermindaten WHERE endtag <= '" + start + "' AND starttag >= '"+end+"'").list();
            if (myview.size() == 0) {
                System.out.println("keine ergebnisse");
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