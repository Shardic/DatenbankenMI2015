package Tables;

import javax.persistence.*;

/**
 * Created by Fabian on 11.07.15.
 */
@Entity
@Table(name="fahrzeugmodell")
public class Fahrzeugmodell {

    @Id
    @GeneratedValue
    @Column(name = "modellnummer")
    private int modellnummer;

    @Column(name = "hersteller")
    private String hersteller;

    @Column(name = "fahrzeugtyp")
    private String fahrzeugTyp;

    @Column(name = "anzahl_sitzplaetze")
    private int anzahlSitzplaetze;

    public Fahrzeugmodell(){}

    public Fahrzeugmodell(String hersteller, String fahrzeugTyp, int anzahlSitzplaetze){

        this.hersteller = hersteller;
        this.fahrzeugTyp = fahrzeugTyp;
        this.anzahlSitzplaetze = anzahlSitzplaetze;
    }

    public int getModellnummer() {
        return modellnummer;
    }

    public void setModellnummer(int modellnummer) {
        this.modellnummer = modellnummer;
    }

    public String getHersteller() {
        return hersteller;
    }

    public void setHersteller(String hersteller) {
        this.hersteller = hersteller;
    }

    public int getAnzahlSitzplaetze() {
        return anzahlSitzplaetze;
    }

    public void setAnzahlSitzplaetze(int anzahlSitzplaetze) {
        this.anzahlSitzplaetze = anzahlSitzplaetze;
    }

    public String getFahrzeugTyp() {
        return fahrzeugTyp;
    }

    public void setFahrzeugTyp(String fahrzeugTyp) {
        this.fahrzeugTyp = fahrzeugTyp;
    }
}
