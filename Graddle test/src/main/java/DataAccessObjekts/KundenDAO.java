package DataAccessObjekts;

import Hibernate.HibernateUtil;
import Tables.Kunde;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.Iterator;
import java.util.List;


/**
 * Created by Fabian on 11.07.15.
 */
public class KundenDAO {


    public KundenDAO(){}

    /**
     * Diese Methode gibt den den Kunden mit dem param name zurück
     * fail return null
     * @param name
     * @return
     */
    public List<Kunde> getKundeByName(String email, String passwort){
        List<Kunde> kunden = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            kunden = session.createQuery("FROM Kunde where name=name and passwort = passwort").list();
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return kunden;
    }

    /**
     * Diese Methode legt eine neue Row im Table Kunde an.
     * Success: return id des neuen Kunden
     * fail: return null
     * @param name
     * @param email
     * @return newKundeId
     */
    public Integer addKunde(String name,String email, String passwort){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        Integer newKundeId = null;
        try{
            tx = session.beginTransaction();
            Kunde newKunde = new Kunde(name,email,passwort);
            newKundeId = (Integer) session.save(newKunde);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return newKundeId;
    }

    /**
     * Diese Methode gibt eine Liste mit allen Kunden zurück;
     * Success return List mit allen Kunden
     * fail: return null
     * @return List<Kunde> kunden
     */
    public List<Kunde> readAllKunden(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List kunden = null;
        try{
            tx = session.beginTransaction();
            kunden = session.createQuery("FROM Kunde").list();
            for (Iterator iterator =
                 kunden.iterator(); iterator.hasNext();){
                Kunde kunde = (Kunde) iterator.next();
                System.out.print("id: " + "\t" + kunde.getId());
                System.out.print("  name: " + kunde.getName());
                System.out.print("  email: " + kunde.getEmail());
                System.out.println("  passwort: " + kunde.getPasswort());
            }
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return kunden;
    }

    /**
     * Diese Methode ändert die Email Adresse des Kunden mit der kundenid
     * @param kundenid
     * @param newEmailAddress
     */
    public void updateKundenEmail(Integer kundenid ,String newEmailAddress){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Kunde kunde = (Kunde)session.get(Kunde.class, kundenid);
            kunde.setEmail(newEmailAddress);
            session.update(kunde);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode ändert den Name des Kunden mit der kundenid
     * @param kundenid
     * @param newName
     */
    public void updateKundenNamen(Integer kundenid, String newName){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Kunde kunde = (Kunde)session.get(Kunde.class, kundenid);
            kunde.setName(newName);
            session.update(kunde);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode ändert das Passwort des Kunden mit der kundenid
     * @param kundenid
     * @param newPasswort
     */
    public void updateKundenPasswort(int kundenid, String newPasswort){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Kunde kunde = (Kunde)session.get(Kunde.class, kundenid);
            kunde.setPasswort(newPasswort);
            session.update(kunde);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode löscht den Kunden miz der kundenid
     * @param kundenid
     */
    public void deleteKunde(Integer kundenid){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Kunde kunde = (Kunde)session.get(Kunde.class, kundenid);
            session.delete(kunde);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

}
