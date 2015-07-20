package Views;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Konrad on 18.07.2015.
 */
@Entity
@Table(name = "kunde_zu_rechnung")

public class KundeZuRechnung implements Serializable {

    private int rechnungsnummer;
    private Integer rechnungsbetrag;
    private int kundennummer;
    private String name;

    @Id
    @Column(name = "rechnungsnummer", nullable = false, insertable = true, updatable = true)
    public int getRechnungsnummer() {
        return rechnungsnummer;
    }

    public void setRechnungsnummer(int rechnungsnummer) {
        this.rechnungsnummer = rechnungsnummer;
    }

    @Basic
    @Column(name = "rechnungsbetrag", nullable = true, insertable = true, updatable = true)
    public Integer getRechnungsbetrag() {
        return rechnungsbetrag;
    }

    public void setRechnungsbetrag(Integer rechnungsbetrag) {
        this.rechnungsbetrag = rechnungsbetrag;
    }

    @Id
    @Column(name = "kundennummer", nullable = false, insertable = true, updatable = true)
    public int getKundennummer() {
        return kundennummer;
    }

    public void setKundennummer(int kundennummer) {
        this.kundennummer = kundennummer;
    }

    @Basic
    @Column(name = "name", nullable = true, insertable = true, updatable = true, length = 50)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        KundeZuRechnung that = (KundeZuRechnung) o;

        if (rechnungsnummer != that.rechnungsnummer) return false;
        if (kundennummer != that.kundennummer) return false;
        if (rechnungsbetrag != null ? !rechnungsbetrag.equals(that.rechnungsbetrag) : that.rechnungsbetrag != null)
            return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = rechnungsnummer;
        result = 31 * result + (rechnungsbetrag != null ? rechnungsbetrag.hashCode() : 0);
        result = 31 * result + kundennummer;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
