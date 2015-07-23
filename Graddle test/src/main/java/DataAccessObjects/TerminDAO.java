package DataAccessObjects;

import Hibernate.HibernateUtil;
import Tables.Mitarbeiter;
import Tables.Termin;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by oliverbammann on 12.07.15.
 */
public class TerminDAO {

    public TerminDAO() {

    }

    /**
     * Diese Methode legt einen neuen Datensatz in der Tabelle Termin an
     * Success return id des neuen Termins
     * fail: return null
     * @param starttag
     * @param endtag
     * @param kundennummer
     * @return
     */
    public Integer addTermin(Date starttag, Date endtag, int kundennummer) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        Integer newTerminNr = null;
        try{
            tx = session.beginTransaction();
            Termin newTermin = new Termin(starttag, endtag, kundennummer);
            newTerminNr = (Integer) session.save(newTermin);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return newTerminNr;
    }


    /**
     * Diese Methode gibt eine Liste mit allen Terminen zurück
     * Success: Liste mit allen Terminen
     * fail: return null
     * @return
     */
    public List<Termin> readAllTermine(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List termine = null;
        try{
            tx = session.beginTransaction();
            termine = session.createQuery("FROM Termin ").list();
            for (Iterator iterator = termine.iterator(); iterator.hasNext();){
                Termin termin = (Termin) iterator.next();
                System.out.println("id: " + "\t" + termin.getTerminnummer());
                System.out.println("  starttag: " + termin.getStarttag().toString());
                System.out.println("  endtag: " + termin.getEndtag().toString());
                System.out.println("  Kundennummer: " + termin.getTkundennummer());
            }
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return termine;
    }

    /**
     * Diese Methode gibt eine Liste mit allen Terminen von Kunde X zurück
     * @param nummer Kundennummer
     * @return Termine wo Kunden Id passt
     */
    public List<Termin> readAllTermine(Integer nummer){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List termine = null;
        try{
            tx = session.beginTransaction();
            termine = session.createQuery("FROM Termin where tkundenNummer = "+nummer).list();
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return termine;
    }

    /**
     * Diese Methode ändert den Starttag des Termins mit der terminnummer
     * @param terminnummer
     * @param starttag
     */
    public void updateTerminStarttag(int terminnummer, Date starttag){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Termin termin = (Termin)session.get(Termin.class, terminnummer);
            termin.setStarttag(starttag);
            session.update(termin);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode ändert den Endtag des Termins mit der terminnummer
     * @param terminnummer
     * @param endtag
     */
    public void updateTerminEndtag(int terminnummer, Date endtag){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Termin termin = (Termin)session.get(Termin.class, terminnummer);
            termin.setEndtag(endtag);
            session.update(termin);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode ändert den Start- und Endtag des Termins mit der terminnummer
     * @param terminnummer
     * @param starttag
     * @param endtag
     */
    public void updateTerminStartEndtag(int terminnummer, Date starttag, Date endtag){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Termin termin = (Termin)session.get(Termin.class, terminnummer);
            termin.setStarttag(starttag);
            termin.setEndtag(endtag);
            session.update(termin);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode ändert die Kundennummer des Termins mit der terminnummer
     * @param terminnummer
     * @param kundennummer
     */
    public void updateTerminKunde(int terminnummer, int kundennummer){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Termin termin = (Termin)session.get(Termin.class, terminnummer);
            termin.setTkundennummer(kundennummer);
            session.update(termin);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode löscht den Termin mit der terminnummer
     * @param terminnummer
     */
    public void deleteTermin(int terminnummer){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Termin termin = (Termin)session.get(Mitarbeiter.class, terminnummer);
            session.delete(termin);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    /**
     * Diese Methode gibt den Termin mit der terminnummer zurück
     * @param terminnummer
     * @return
     */
    public Termin getTerminById(int terminnummer){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        List<Termin> termine = null;
        Termin foundedTermin = null;
        try{
            tx = session.beginTransaction();
            termine = session.createQuery("FROM Termin ").list();
            for(int i = 0; i < termine.size(); i++){
                if(termine.get(i).getTerminnummer()==terminnummer){
                    foundedTermin = termine.get(i);
                }
            }
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return foundedTermin;
    }


}
