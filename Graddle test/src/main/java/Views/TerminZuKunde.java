package Views;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

/**
 * Created by Konrad on 19.07.2015.
 */
@Entity
@Table(name = "termin_zu_kunde")
public class TerminZuKunde  implements Serializable {
    private Date starttag;
    private Integer tkundennummer;

    @Id
    @Column(name = "starttag")
    public Date getStarttag() {
        return starttag;
    }

    public void setStarttag(Date starttag) {
        this.starttag = starttag;
    }

    @Id
    @Column(name = "tkundennummer")
    public Integer getTkundennummer() {
        return tkundennummer;
    }

    public void setTkundennummer(Integer tkundennummer) {
        this.tkundennummer = tkundennummer;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TerminZuKunde that = (TerminZuKunde) o;

        if (starttag != null ? !starttag.equals(that.starttag) : that.starttag != null) return false;
        if (tkundennummer != null ? !tkundennummer.equals(that.tkundennummer) : that.tkundennummer != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = starttag != null ? starttag.hashCode() : 0;
        result = 31 * result + (tkundennummer != null ? tkundennummer.hashCode() : 0);
        return result;
    }
}
