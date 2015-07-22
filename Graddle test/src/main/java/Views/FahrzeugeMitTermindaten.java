package Views;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Marco on 22.07.2015.
 */
@Entity
@Table(name = "fahrzeuge_mit_termindaten")
public class FahrzeugeMitTermindaten implements Serializable {

    @Id
    @Column(name = "fahrzeugnummer")
    private int fahrzeugnummer;
    public int getFahrzeugnummer() {
        return fahrzeugnummer;
    }

    public void setFahrzeugnummer(int fahrzeugnummer) {
        this.fahrzeugnummer = fahrzeugnummer;
    }

    @Column(name = "laufleistung")
    private int laufleistung;
    public int getLaufleistung() {
        return laufleistung;
    }

    public void setLaufleistung(int laufleistung) {
        this.laufleistung = laufleistung;
    }

    @Column(name = "nummernschild")
    private String nummernschild;
    public String getNummernschild() {
        return nummernschild;
    }

    public void setNummernschild(String nummernschild) {
        this.nummernschild = nummernschild;
    }

    @Column(name = "hersteller")
    private String hersteller;
    public String getHersteller() {
        return hersteller;
    }

    public void setHersteller(String hersteller) {
        this.hersteller = hersteller;
    }

    @Column(name = "fahrzeugtyp")
    private String fahrzeugtyp;
    public String getFahrzeugtyp() {
        return fahrzeugtyp;
    }

    public void setFahrzeugtyp(String fahrzeugtyp) {
        this.fahrzeugtyp = fahrzeugtyp;
    }

    @Column(name = "anzahl_sitzplaetze")
    private int anzahl_sitzplaetze;
    public int getAnzahl_sitzplaetze() {
        return anzahl_sitzplaetze;
    }

    public void setAnzahl_sitzplaetze(int anzahl_sitzplaetze) {
        this.anzahl_sitzplaetze = anzahl_sitzplaetze;
    }

    @Column(name = "starttag")
    private Date starttag;
    public Date getStarttag() {
        return starttag;
    }

    public void setStarttag(Date starttag) {
        this.starttag = starttag;
    }

    @Column(name = "endtag")
    private Date endtag;
    public Date getEndtag() {
        return endtag;
    }

    public void setEndtag(Date endtag) {
        this.endtag = endtag;
    }


    public FahrzeugeMitTermindaten() { }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FahrzeugeMitTermindaten that = (FahrzeugeMitTermindaten) o;
        return true;
    }
}