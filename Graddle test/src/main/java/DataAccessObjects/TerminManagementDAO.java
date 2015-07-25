package DataAccessObjects;

import Hibernate.HibernateUtil;
import Tables.TerminManagement;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Konrad on 12.07.2015.
 */
public class TerminManagementDAO {

    /**
     * Standard Konstruktor
     */
    public TerminManagementDAO() {

    }

    /**
     * Liefert alle TerminManagements zur�ck, der ALLE IDs benutzen oder NULL bei Fehler
     * @param rid Rechnungs ID
     * @param fid Fahrzeug ID
     * @param tid Termin ID
     * @return das TerminManagement mit allen �bereinstimmender ID
     */
    public TerminManagement getManagerStrict(Integer rid, Integer fid, Integer tid) {
        TerminManagement r = null;
        List<TerminManagement> results = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            results = session.createQuery("FROM TerminManagement").list();
            for(int i = 0; i < results.size(); i++){
                if(results.get(i).getmFahrzeugnummer() == fid && results.get(i).getmRechunungsnummer() == rid && results.get(i).getmTerminnummer() == tid){
                    r = results.get(i);
                }
            }

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
     * Liefert alle TerminManagements zur�ck, der eine der IDs benutzen oder NULL bei Fehler
     * @param rid Rechnungs ID
     * @param fid Fahrzeug ID
     * @param tid Termin ID
     * @return das TerminManagement mit einer �bereinstimmender ID
     */
    public TerminManagement getManagerRelaxed(Integer rid, Integer fid, Integer tid) {
        TerminManagement r = null;
        List<TerminManagement> results = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            results = session.createQuery("FROM TerminManagement").list();
            for(int i = 0; i < results.size(); i++){
                if(results.get(i).getmFahrzeugnummer() == fid || results.get(i).getmRechunungsnummer() == rid || results.get(i).getmTerminnummer() == tid){
                    r = results.get(i);
                }
            }

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
     * Liefert alle bekannten TerminManagement
     * @return all TerminManagement
     */
    public List<TerminManagement> getAll() {
        List<TerminManagement> results = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();

            results = session.createQuery("FROM TerminManagement").list();

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
     * Legt neuen TerminManagement an
     * Success true
     * fail: false
     * @param rid Rechnungs ID
     * @param fid Fahrzeug ID
     * @param tid Termin ID
     * @return true success / false fail
     */
    public Integer addTerminManagement(Integer rid, Integer fid, Integer tid){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        Integer result = null;
        try{
            tx = session.beginTransaction();
            TerminManagement r = new TerminManagement(rid, fid, tid);
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
     * löscht ein Terminmanagement
     * Success true
     * fail: false
     * @param rid Rechnungs ID
     * @param fid Fahrzeug ID
     * @param tid Termin ID
     * @return true success / false fail
     */
    public Integer deleteTerminmanagement(Integer rid, Integer fid, Integer tid){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        Integer result = null;
        try{
            tx = session.beginTransaction();
            TerminManagement t = (TerminManagement)session.load(TerminManagement.class, tid);
            session.delete(t);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return result;
    }

}
