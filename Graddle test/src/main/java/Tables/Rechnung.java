package Tables;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Fabian on 11.07.15.
 */
@Entity
@Table(name="rechnung")
public class Rechnung {

    @Id
    @GeneratedValue
    @Column(name = "rechnungsnummer")
    private int rechnungsNummer;

    @Column(name = "rechnungsbetrag")
    private int rechnungsBetrag;

    @Column(name = "rkundennummer")
    private int rKudenNummer;



    public Rechnung(){}

    public Rechnung(int betrag, int kunde) {
        this.rechnungsBetrag = betrag;
        this.rKudenNummer=kunde;
    }

    public int getRechnungsNummer() {
        return rechnungsNummer;
    }

    public void setRechnungsNummer(int rechnungsNummer) {
        this.rechnungsNummer = rechnungsNummer;
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
