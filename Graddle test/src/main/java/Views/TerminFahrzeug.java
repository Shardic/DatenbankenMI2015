package Views;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

/**
 * Created by Konrad on 19.07.2015.
 */
@Entity
@Table(name = "termin_fahrzeug")
public class TerminFahrzeug  implements Serializable {
    private int terminnummer;
    private Date starttag;
    private Date endtag;
    private int fahrzeugnummer;

    @Id
    @Column(name = "terminnummer")
    public int getTerminnummer() {
        return terminnummer;
    }

    public void setTerminnummer(int terminnummer) {
        this.terminnummer = terminnummer;
    }

    @Basic
    @Column(name = "starttag")
    public Date getStarttag() {
        return starttag;
    }

    public void setStarttag(Date starttag) {
        this.starttag = starttag;
    }

    @Basic
    @Column(name = "endtag")
    public Date getEndtag() {
        return endtag;
    }

    public void setEndtag(Date endtag) {
        this.endtag = endtag;
    }

    @Id
    @Column(name = "fahrzeugnummer")
    public int getFahrzeugnummer() {
        return fahrzeugnummer;
    }

    public void setFahrzeugnummer(int fahrzeugnummer) {
        this.fahrzeugnummer = fahrzeugnummer;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TerminFahrzeug that = (TerminFahrzeug) o;

        if (terminnummer != that.terminnummer) return false;
        if (fahrzeugnummer != that.fahrzeugnummer) return false;
        if (starttag != null ? !starttag.equals(that.starttag) : that.starttag != null) return false;
        if (endtag != null ? !endtag.equals(that.endtag) : that.endtag != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = terminnummer;
        result = 31 * result + (starttag != null ? starttag.hashCode() : 0);
        result = 31 * result + (endtag != null ? endtag.hashCode() : 0);
        result = 31 * result + fahrzeugnummer;
        return result;
    }
}
