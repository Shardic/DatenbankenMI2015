package DataAccessObjekts;

import Hibernate.HibernateUtil;
import Tables.Mitarbeiter;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.Iterator;
import java.util.List;

/**
 * Created by Fabian on 11.07.15.
 */
public class MitarbeiterDAO {

    public MitarbeiterDAO(){}

    /**
     * Diese Methode gibt den Mitarbeiter mit dem param name & email zurück
     * Success return Mitarbeiter
     * fail return null
     * @param name
     * @param email
     * @return
     */
    public Mitarbeiter getMitarbeiter(String name,String email){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List<Mitarbeiter> mitarbiter = null;
        Mitarbeiter foundedMitarbeiter = null;
        try{
            tx = session.beginTransaction();
            mitarbiter = session.createQuery("FROM Mitarbeiter ").list();
            for(int i = 0; i < mitarbiter.size(); i++){
                if(mitarbiter.get(i).getName().equals(name) && mitarbiter.get(i).getEmail().equals(email)){
                    foundedMitarbeiter = mitarbiter.get(i);
                }
            }
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return foundedMitarbeiter;
    }

    /**
     * Diese Methode legt eine neue Row in der Tablle mitarbeiter an
     * Success return id des neuen Kunden
     * fail: return null
     * @param name
     * @param email
     * @param geschaeftsstellenNummer
     * @return
     */
    public Integer addMitarbeiter(String name, String email, Integer geschaeftsstellenNummer){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        Integer newMitarbeiterId = null;
        try{
            tx = session.beginTransaction();
            Mitarbeiter newMitarbeiter = new Mitarbeiter(name,email,geschaeftsstellenNummer);
            newMitarbeiterId = (Integer) session.save(newMitarbeiter);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return newMitarbeiterId;
    }

    /**
     * Diese Methode gibt eine Liste mit allen Mitarbeitern zurück
     * Success: Liste mit allen Mitarbeitern
     * fail: return null
     * @return List<Mitarbeiter>
     */
    public List<Mitarbeiter> readAllMitarbeiter(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List mitarbiter = null;
        try{
            tx = session.beginTransaction();
            mitarbiter = session.createQuery("FROM Mitarbeiter ").list();
            for (Iterator iterator = mitarbiter.iterator(); iterator.hasNext();){
                Mitarbeiter arbeiter = (Mitarbeiter) iterator.next();
                System.out.print("id: " + "\t" + arbeiter.getMitarbeiterNummer());
                System.out.print("  name: " + arbeiter.getName());
                System.out.print("  email: " + arbeiter.getEmail());
                System.out.println("  Geschäftsstellennummer: " + arbeiter.getMitGeschaeftsstellennummer());
            }
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return mitarbiter;
    }

    /**
     * Diese Methode ändert die Email Adresse des Mitarbeiters mit der mitarbeiterid
     * @param mitarbeiterid
     * @param newMitarbeiterEmail
     */
    public void updateMitarbeiterEmail(Integer mitarbeiterid, String newMitarbeiterEmail){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Mitarbeiter mitarbeiter = (Mitarbeiter)session.get(Mitarbeiter.class, mitarbeiterid);
            mitarbeiter.setEmail(newMitarbeiterEmail);
            session.update(mitarbeiter);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode ändert den Namen des Mitarbeiters mit der mitarbeiterid
     * @param mitarbeiterid
     * @param newMitarbeiterNamen
     */
    public void updateMitarbeiterNamen(Integer mitarbeiterid, String newMitarbeiterNamen){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Mitarbeiter mitarbeiter = (Mitarbeiter)session.get(Mitarbeiter.class, mitarbeiterid);
            mitarbeiter.setName(newMitarbeiterNamen);
            session.update(mitarbeiter);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode ändert die Geschäftsstelle des Mitarbeiters mit der mitarbeiterid
     * @param mitarbeiterid
     * @param newGeschaeftsstelle
     */
    public void updateMitarbeiterGeschaeftsstelle(Integer mitarbeiterid, Integer newGeschaeftsstelle){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Mitarbeiter mitarbeiter = (Mitarbeiter)session.get(Mitarbeiter.class, mitarbeiterid);
            mitarbeiter.setMitGeschaeftsstellennummer(newGeschaeftsstelle);
            session.update(mitarbeiter);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode löscht den Mitarbeiter mit der mitarbeiterid
     * @param mitarbeiterid
     */
    public void deleteMitarbeiter(Integer mitarbeiterid){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Mitarbeiter mitarbeiter = (Mitarbeiter)session.get(Mitarbeiter.class, mitarbeiterid);
            session.delete(mitarbeiter);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }
}
