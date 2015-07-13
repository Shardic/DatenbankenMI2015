package DataAccessObjekts;

import Hibernate.HibernateUtil;
import Tables.Rechnung;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.sql.Date;
import java.util.List;

/**
 * Created by Konrad on 12.07.2015.
 */
public class RechnungManager {

    /**
     * Standard Konstruktor
     */
    public RechnungManager() {

    }

    /**
     * Liefert die Rechnung mit der ID zur�ck oder NULL bei Fehler
     * @param id Rechnungs ID
     */
    public Rechnung getRechnung(int id) {
        Rechnung r = null;
        List<Rechnung> results = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();

            r = (Rechnung)session.get(Rechnung.class, id);
            /*
            results = session.createQuery("FROM Rechnung").list();
            for(int i = 0; i < results.size(); i++){
                if(results.get(i).getRechnungsNummer() == id){
                    r = results.get(i);
                }
            }
            */
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }

        return r;
    }

    /**
     * Liefert alle bekannten Rechnungen
     * @return Rechnungliste
     */
    public List<Rechnung> getAll() {
        List<Rechnung> results = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();

            results = session.createQuery("FROM Rechnung").list();

            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }

        return results;
    }


    /**
     * Legt neue Rechnung an
     * Success return id der Rechnung
     * fail: return null
     * @param betrag
     * @param kundenNummer
     * @param startTag
     * @param endTag
     * @return ID der Rechnung
     */
    public Integer addRechnung(int betrag, int kundenNummer, Date startTag, Date endTag){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        Integer result = null;
        try{
            tx = session.beginTransaction();
            Rechnung r = new Rechnung(betrag, kundenNummer, startTag, endTag);
            result = (Integer) session.save(r);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return result;
    }

    /**
     * �berschreibt die Rechnung auf dem Platz ID mit dem eingegebenen Rechnungsobjekt, ABER �ndert nicht dessen ID
     * Success return true
     * fail: return false
     * @param neu die neue Rechnung
     * @param id die rechnungsnummer der alten
     * @return true success / false fail
     */
    public boolean updateRechnung (Rechnung neu, int id) {
        boolean result = false;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Rechnung alt = (Rechnung)session.get(Rechnung.class, id);
            alt.setEndTag(neu.getEndTag());
            alt.setStartTag(neu.getStartTag());
            alt.setRechnungsBetrag(neu.getRechnungsBetrag());
            alt.setrKudenNummer(neu.getrKudenNummer());
            session.update(alt);
            tx.commit();
            result = true;
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return result;
        }

    /**
     * l�scht die Rechnung mit der ID
     * @param id
     * @return true success / false fail
     */
    public boolean deletRechnung(int id){
        boolean result = false;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Rechnung r = (Rechnung)session.get(Rechnung.class, id);
            session.delete(r);
            tx.commit();
            result = true;
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return result;
    }

}
