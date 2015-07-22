package Views;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Konrad on 22.07.2015.
 */
@Entity
@Table(name = "rechnungsansicht")
public class Rechnungsansicht   implements Serializable {
    private int rechnungsnummer;
    private Integer rechnungsbetrag;
    private Integer rkundennummer;
    private Date starttag;
    private Date endtag;
    private String nummernschild;
    private int fahrzeugnummer;
    private Integer fmodellnummer;

    @Id
    @Column(name = "rechnungsnummer")
    public int getRechnungsnummer() {
        return rechnungsnummer;
    }

    public void setRechnungsnummer(int rechnungsnummer) {
        this.rechnungsnummer = rechnungsnummer;
    }

    @Basic
    @Column(name = "rechnungsbetrag")
    public Integer getRechnungsbetrag() {
        return rechnungsbetrag;
    }

    public void setRechnungsbetrag(Integer rechnungsbetrag) {
        this.rechnungsbetrag = rechnungsbetrag;
    }

    @Id
    @Column(name = "rkundennummer")
    public Integer getRkundennummer() {
        return rkundennummer;
    }

    public void setRkundennummer(Integer rkundennummer) {
        this.rkundennummer = rkundennummer;
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

    @Basic
    @Column(name = "nummernschild")
    public String getNummernschild() {
        return nummernschild;
    }

    public void setNummernschild(String nummernschild) {
        this.nummernschild = nummernschild;
    }

    @Id
    @Column(name = "fahrzeugnummer")
    public int getFahrzeugnummer() {
        return fahrzeugnummer;
    }

    public void setFahrzeugnummer(int fahrzeugnummer) {
        this.fahrzeugnummer = fahrzeugnummer;
    }

    @Basic
    @Column(name = "fmodellnummer")
    public Integer getFmodellnummer() {
        return fmodellnummer;
    }

    public void setFmodellnummer(Integer fmodellnummer) {
        this.fmodellnummer = fmodellnummer;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Rechnungsansicht that = (Rechnungsansicht) o;

        if (rechnungsnummer != that.rechnungsnummer) return false;
        if (fahrzeugnummer != that.fahrzeugnummer) return false;
        if (rechnungsbetrag != null ? !rechnungsbetrag.equals(that.rechnungsbetrag) : that.rechnungsbetrag != null)
            return false;
        if (rkundennummer != null ? !rkundennummer.equals(that.rkundennummer) : that.rkundennummer != null)
            return false;
        if (starttag != null ? !starttag.equals(that.starttag) : that.starttag != null) return false;
        if (endtag != null ? !endtag.equals(that.endtag) : that.endtag != null) return false;
        if (nummernschild != null ? !nummernschild.equals(that.nummernschild) : that.nummernschild != null)
            return false;
        if (fmodellnummer != null ? !fmodellnummer.equals(that.fmodellnummer) : that.fmodellnummer != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = rechnungsnummer;
        result = 31 * result + (rechnungsbetrag != null ? rechnungsbetrag.hashCode() : 0);
        result = 31 * result + (rkundennummer != null ? rkundennummer.hashCode() : 0);
        result = 31 * result + (starttag != null ? starttag.hashCode() : 0);
        result = 31 * result + (endtag != null ? endtag.hashCode() : 0);
        result = 31 * result + (nummernschild != null ? nummernschild.hashCode() : 0);
        result = 31 * result + fahrzeugnummer;
        result = 31 * result + (fmodellnummer != null ? fmodellnummer.hashCode() : 0);
        return result;
    }
}
