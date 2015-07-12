package Tables;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Fabian on 11.07.15.
 */
@Entity
@Table(name="termin")
public class Termin {
    @Id
    @GeneratedValue
    @Column(name = "terminnummer")
    private int terminNummer;

    @Column(name = "tkundennummer")
    private int tkundenNummer;

    @Column(name = "starttag")
    private Date startTag;

    @Column(name = "endtag")
    private Date endTag;

    public Termin(){}

    public int getTerminnummer() {
        return terminNummer;
    }

    public void setTerminnummer(int terminnummer) {
        this.terminNummer = terminnummer;
    }

    public int getTkundennummer() {
        return tkundenNummer;
    }

    public void setTkundennummer(int tkundennummer) {
        this.tkundenNummer = tkundennummer;
    }

    public Date getStarttag() {
        return startTag;
    }

    public void setStarttag(Date starttag) {
        this.startTag = starttag;
    }

    public Date getEndtag() {
        return endTag;
    }

    public void setEndtag(Date endtag) {
        this.endTag = endtag;
    }
}
