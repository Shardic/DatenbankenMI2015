package Tables;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Created by Fabian on 11.07.15.
 */
public class Fahrzeugmodell {

    @Id
    @GeneratedValue
    @Column(name = "modellnummer")
    private int modellnummer;

    @Column(name = "laufleistung")
    private String heersteller;

    @Column(name = "fahrzeugTyp")
    private String fahrzeugTyp;

    @Column(name = "anzahl_sitzplaetze")
    private int anzahlSitzplaetze;

    public Fahrzeugmodell(){}

    public int getModellnummer() {
        return modellnummer;
    }

    public void setModellnummer(int modellnummer) {
        this.modellnummer = modellnummer;
    }

    public String getHeersteller() {
        return heersteller;
    }

    public void setHeersteller(String heersteller) {
        this.heersteller = heersteller;
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
