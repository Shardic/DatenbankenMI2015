package DataAccessObjects;

import Hibernate.HibernateUtil;
import Tables.Fahrzeugmodell;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.Iterator;
import java.util.List;

/**
 * Created by mikehuesing on 12.07.15.
 */
public class FahrzeugmodellDAO {

    public FahrzeugmodellDAO(){}

    /**
     * Diese Methode gibt das Fahrzeugmodell mit dem param fahrzeugTyp & Hersteller zurück
     * Success return Fahrzeugmodell
     * fail return null
     * @param fahrzeugTyp
     * @param hersteller
     * @return
     */
    public Fahrzeugmodell getFahrzeugmodell(String fahrzeugTyp,String hersteller){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List<Fahrzeugmodell> fahrzeugmodelle = null;
        Fahrzeugmodell foundFahrzeugmodell = null;
        try{
            tx = session.beginTransaction();
            fahrzeugmodelle = session.createQuery("FROM Fahrzeugmodell ").list();
            for(int i = 0; i < fahrzeugmodelle.size(); i++){
                if(fahrzeugmodelle.get(i).getFahrzeugTyp().equals(fahrzeugTyp)
                        && fahrzeugmodelle.get(i).getHersteller().equals(hersteller)){
                    foundFahrzeugmodell = fahrzeugmodelle.get(i);
                }
            }
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return foundFahrzeugmodell;
    }

    /**
     * Diese Methode legt eine neue Row in der Tabelle Fahrzeugmodell an
     * Success return id des neuen Fahrzeugmodell
     * fail: return null
     * @param fahrzeugTyp
     * @param hersteller
     * @param anzahlSitzplaetze
     * @return
     */
    public Integer addMitarbeiter(String fahrzeugTyp, String hersteller, Integer anzahlSitzplaetze){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        Integer newFahrzeugmodellId = null;
        try{
            tx = session.beginTransaction();
            Fahrzeugmodell newFahrzeugmodell = new Fahrzeugmodell(fahrzeugTyp,hersteller,anzahlSitzplaetze);
            newFahrzeugmodellId = (Integer) session.save(newFahrzeugmodell);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return newFahrzeugmodellId;
    }

    /**
     * Diese Methode gibt eine Liste mit allen Fahrzeugmodellen zurück
     * Success: Liste mit allen Fahrzeugmodellen
     * fail: return null
     * @return List<Fahrzeugmodell>
     */
    public List<Fahrzeugmodell> readAllFahrzeugmodelle(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List fahrzeumodelle = null;
        try{
            tx = session.beginTransaction();
            fahrzeumodelle = session.createQuery("FROM Fahrzeugmodell ").list();
            for (Iterator iterator = fahrzeumodelle.iterator(); iterator.hasNext();){
                Fahrzeugmodell fahrzeugmodell = (Fahrzeugmodell) iterator.next();
                System.out.print("Modellnummer: " + "\t" + fahrzeugmodell.getModellnummer());
                System.out.print("  Hersteller: " + fahrzeugmodell.getHersteller());
                System.out.print("  Sitzplätze: " + fahrzeugmodell.getAnzahlSitzplaetze());
                System.out.println("  Fahrzeug: " + fahrzeugmodell.getFahrzeugTyp());
            }
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return fahrzeumodelle;
    }

    /**
     * Diese Methode ändert Fahrzeugtyp des Fahrzeugmodells mit der fahrzeugmodellid
     * @param fahrzeugmodellid
     * @param newFahrzeugTyp
     */
    public void updateFahrzeugTyp(Integer fahrzeugmodellid, String newFahrzeugTyp){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Fahrzeugmodell fahrzeugmodell = (Fahrzeugmodell)session.get(Fahrzeugmodell.class, fahrzeugmodellid);
            fahrzeugmodell.setFahrzeugTyp(newFahrzeugTyp);
            session.update(fahrzeugmodell);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode ändert Hersteller des Fahrzeugmodells mit der fahrzeugmodellid
     * @param fahrzeugmodellid
     * @param newHersteller
     */
    public void updateHersteller(Integer fahrzeugmodellid, String newHersteller){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Fahrzeugmodell fahrzeugmodell = (Fahrzeugmodell)session.get(Fahrzeugmodell.class, fahrzeugmodellid);
            fahrzeugmodell.setHersteller(newHersteller);
            session.update(fahrzeugmodell);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode ändert die Anzahl der Sitzplaetze des Fahrzeugmodells mit der fahrzeugmodellid
     * @param fahrzeugmodellid
     * @param newAnzahlSitzplaetze
     */
    public void updateAnzahlSitzplaetze(Integer fahrzeugmodellid, Integer newAnzahlSitzplaetze){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Fahrzeugmodell fahrzeugmodell = (Fahrzeugmodell)session.get(Fahrzeugmodell.class, fahrzeugmodellid);
            fahrzeugmodell.setAnzahlSitzplaetze(newAnzahlSitzplaetze);
            session.update(fahrzeugmodell);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode löscht das Fahrzeugmodell mit der fahrzeugmodellid
     * @param fahrzeugmodellid
     */
    public void deleteMitarbeiter(Integer fahrzeugmodellid){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Fahrzeugmodell fahrzeugmodell = (Fahrzeugmodell)session.get(Fahrzeugmodell.class, fahrzeugmodellid);
            session.delete(fahrzeugmodell);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

}
