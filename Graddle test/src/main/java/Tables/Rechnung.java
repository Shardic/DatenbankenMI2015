package Tables;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Created by Fabian on 11.07.15.
 */
public class Rechnung {

    @Id
    @GeneratedValue
    @Column(name = "rechnungsnummer")
    private int rechnungsNummer;

    @Column(name = "anzahl_tage")
    private int anzahlTage;

    @Column(name = "rechnungsbetrag")
    private int rechnungsBetrag;

    @Column(name = "rkundennummer")
    private int rKudenNummer;

    public Rechnung(){}

    public int getRechnungsNummer() {
        return rechnungsNummer;
    }

    public void setRechnungsNummer(int rechnungsNummer) {
        this.rechnungsNummer = rechnungsNummer;
    }

    public int getAnzahlTage() {
        return anzahlTage;
    }

    public void setAnzahlTage(int anzahlTage) {
        this.anzahlTage = anzahlTage;
    }

    public int getRechnungsBetrag() {
        return rechnungsBetrag;
    }

    public void setRechnungsBetrag(int rechnungsBetrag) {
        this.rechnungsBetrag = rechnungsBetrag;
    }

    public int getrKudenNummer() {
        return rKudenNummer;
    }

    public void setrKudenNummer(int rKudenNummer) {
        this.rKudenNummer = rKudenNummer;
    }
}
