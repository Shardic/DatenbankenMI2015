package DataAccessObjects;

import Hibernate.HibernateUtil;
import Tables.Geschaeftsstelle;
import Tables.Mitarbeiter;
import Tables.Termin;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.Iterator;
import java.util.List;

/**
 * Created by oliverbammann on 12.07.15.
 */
public class GeschaeftsstellenDAO {

    public GeschaeftsstellenDAO() {

    }


    /**
     * Diese Methode legt einen neuen Datensatz in der Tabelle Geschaeftsstelle an
     * Success return id der neuen Geschaeftsstelle
     * fail: return null
     * @param ort
     * @param plz
     * @return
     */
    public Integer addGeschaeftsstelle(String ort, String plz) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        Integer newGeschaeftsstellenNr = null;
        try{
            tx = session.beginTransaction();
            Geschaeftsstelle newGeschaeftsstelle = new Geschaeftsstelle(ort, plz);
            newGeschaeftsstellenNr = (Integer) session.save(newGeschaeftsstelle);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return newGeschaeftsstellenNr;
    }

    /**
     * Diese Methode gibt eine Liste mit allen Geschaeftsstellen zurück
     * Success: Liste mit allen Geschaeftsstellen
     * fail: return null
     * @return
     */
    public List<Geschaeftsstelle> readAllGeschaeftsstellen(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List geschaeftsstellen = null;
        try{
            tx = session.beginTransaction();
            geschaeftsstellen = session.createQuery("FROM Geschaeftsstelle ").list();
            for (Iterator iterator = geschaeftsstellen.iterator(); iterator.hasNext();){
                Geschaeftsstelle geschaeftsstelle = (Geschaeftsstelle) iterator.next();
                System.out.println("id: " + "\t" + geschaeftsstelle.getGeschaeftsstellennummer());
                System.out.println("ort: " + geschaeftsstelle.getOrt());
                System.out.println("plz: " + geschaeftsstelle.getPlz());
            }
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return geschaeftsstellen;
    }

    /**
     * Diese Methode ändert den Ort und die Plz von der Geschaeftsstelle mit der geschaeftsstellennr
     * @param geschaeftsstellennr
     * @param ort
     * @param plz
     */
    public void updateOrtPlz(int geschaeftsstellennr, String ort, String plz){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Geschaeftsstelle geschaeftstelle = (Geschaeftsstelle)session.get(Termin.class, geschaeftsstellennr);
            geschaeftstelle.setOrt(ort);
            geschaeftstelle.setPlz(plz);
            session.update(geschaeftstelle);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode löscht die Geschaeftsstelle mit der geschaeftsstellenNr
     * @param geschaeftsstellenNr
     */
    public void deleteGeschaeftsstelle(int geschaeftsstellenNr){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Geschaeftsstelle geschaeftsstelle = (Geschaeftsstelle)session.get(Mitarbeiter.class, geschaeftsstellenNr);
            session.delete(geschaeftsstelle);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode gibt die Geschaeftsstelle mit der geschaeftsstellennr zurück
     * @param geschaeftsstellennr
     * @return
     */
    public Geschaeftsstelle getGeschaeftsstelleById(int geschaeftsstellennr){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        Geschaeftsstelle geschaeftsstelle;
        List<Geschaeftsstelle> geschaeftsstelleList = null;
        Geschaeftsstelle foundedGeschaeftsstelle = null;
        try{
            tx = session.beginTransaction();
            geschaeftsstelleList = session.createQuery("FROM Geschaeftsstelle ").list();
            for(int i = 0; i < geschaeftsstelleList.size(); i++){
                if(geschaeftsstelleList.get(i).getGeschaeftsstellennummer()==geschaeftsstellennr){
                    foundedGeschaeftsstelle = geschaeftsstelleList.get(i);
                }
            }
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return foundedGeschaeftsstelle;
    }
}
