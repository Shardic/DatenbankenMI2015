package DataAccessObjekts;

import Hibernate.HibernateUtil;
import Tables.Fahrzeug;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.Iterator;
import java.util.List;

/**
 * Created by mikehuesing on 12.07.15.
 */
public class FahrzeugManager {

    public FahrzeugManager(){}

    /**
     * Diese Methode gibt das Fahrzeug mit dem param fahrzeugnummer zurück
     * Success return Fahrzeug
     * fail return null
     * @param fahrzeugnummer
     * @return
     */
    public Fahrzeug getFahrzeug(int fahrzeugnummer){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List<Fahrzeug> fahrzeuge = null;
        Fahrzeug foundFahrzeug = null;
        try{
            tx = session.beginTransaction();
            fahrzeuge = session.createQuery("FROM Kunde ").list();
            for(int i = 0; i < fahrzeuge.size(); i++){
                if(fahrzeuge.get(i).getFahrzeugNummer() == fahrzeugnummer){
                    foundFahrzeug = fahrzeuge.get(i);
                }
            }
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return foundFahrzeug;
    }

    /**
     * Diese Methode legt eine neue Row in der Tabelle fahrzeug an
     * Success return id des neues Fahrzeug
     * fail: return null
     * @param laufleistung
     * @param nummernschild
     * @param fgeschaeftsstellennummer
     * @param fmodellnummer
     * @return
     */
    public Integer addFahrzeug(Integer laufleistung, String nummernschild, Integer fgeschaeftsstellennummer,
                               Integer fmodellnummer){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        Integer newFahrzeugId = null;
        try{
            tx = session.beginTransaction();
            Fahrzeug newFahrzeug = new Fahrzeug(laufleistung,nummernschild,fgeschaeftsstellennummer,fmodellnummer);
            newFahrzeugId = (Integer) session.save(newFahrzeug);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return newFahrzeugId;
    }

    /**
     * Diese Methode gibt eine Liste mit allen Fahrzeugen zurück
     * Success: Liste mit allen Fahrzeugen
     * fail: return null
     * @return List<Fahrzeug>
     */
    public List<Fahrzeug> readAllFahrzeuge(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List fahrzeuge = null;
        try{
            tx = session.beginTransaction();
            fahrzeuge = session.createQuery("FROM Fahrzeug ").list();
            for (Iterator iterator = fahrzeuge.iterator(); iterator.hasNext();){
                Fahrzeug fahrzeug = (Fahrzeug) iterator.next();
                System.out.print("id: " + "\t" + fahrzeug.getFahrzeugNummer());
                System.out.print("  nummernschild: " + fahrzeug.getNummernschild());
                System.out.print("  laufleistung: " + fahrzeug.getLaufleistung());
                System.out.print("  fahrzeugmodellnummer: " + fahrzeug.getFrzModellNummer());
                System.out.println("  fahrzeuggeschäftsstellennummer: " + fahrzeug.getfGeschaeftsstellenNummer());
            }
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return fahrzeuge;
    }

    /**
     * Diese Methode ändert das nummernschild des Fahrzeugs mit der fahrzeugid
     * @param fahrzeugid
     * @param newNummernschild
     */
    public void updateNummernschild(Integer fahrzeugid, String newNummernschild){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Fahrzeug fahrzeug = (Fahrzeug)session.get(Fahrzeug.class, fahrzeugid);
            fahrzeug.setNummernschild(newNummernschild);
            session.update(fahrzeug);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode ändert die fGeschaeftsstellennumer des Fahrzeugs mit der fahrzeugid
     * @param fahrzeugid
     * @param newFGeschaeftsstellenNummer
     */
    public void updateFGeschaeftsstellenNummer(Integer fahrzeugid, Integer newFGeschaeftsstellenNummer){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Fahrzeug fahrzeug = (Fahrzeug)session.get(Fahrzeug.class, fahrzeugid);
            fahrzeug.setfGeschaeftsstellenNummer(newFGeschaeftsstellenNummer);
            session.update(fahrzeug);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode ändert die frzModellnummer des Fahrzeugs mit der fahrzeugid
     * @param fahrzeugid
     * @param newFrzModellNummer
     */
    public void updateFrzModellNummer(Integer fahrzeugid, Integer newFrzModellNummer){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Fahrzeug fahrzeug = (Fahrzeug)session.get(Fahrzeug.class, fahrzeugid);
            fahrzeug.setFrzModellNummer(newFrzModellNummer);
            session.update(fahrzeug);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode ändert die laufleistung des Fahrzeugs mit der fahrzeugid
     * @param fahrzeugid
     * @param newLaufleistung
     */
    public void updateLaufleistung(Integer fahrzeugid, Integer newLaufleistung){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Fahrzeug fahrzeug = (Fahrzeug)session.get(Fahrzeug.class, fahrzeugid);
            fahrzeug.setLaufleistung(newLaufleistung);
            session.update(fahrzeug);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }


    /**
     * Diese Methode löscht das Fahrzeug mit der fahrzeugid
     * @param fahrzeugid
     */
    public void deleteFahrzeug(Integer fahrzeugid){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Fahrzeug fahrzeug = (Fahrzeug)session.get(Fahrzeug.class, fahrzeugid);
            session.delete(fahrzeug);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

}
