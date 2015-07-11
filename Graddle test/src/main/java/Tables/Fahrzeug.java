package Tables;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Created by Fabian on 11.07.15.
 */
public class Fahrzeug {

    @Id
    @GeneratedValue
    @Column(name = "fahrzeugnummer")
    private int fahrzeugNummer;

    @Column(name = "laufleistung")
    private int laufleistung;

    @Column(name = "nummernschild")
    private String nummernschild;

    @Column(name = "fgeschaeftsstellennummer")
    private int fGeschaeftsstellenNummer;

    @Column(name = "frzmodellnummer")
    private int frzModellNummer;

    public Fahrzeug(){}

    public int getFahrzeugNummer() {
        return fahrzeugNummer;
    }

    public void setFahrzeugNummer(int fahrzeugNummer) {
        this.fahrzeugNummer = fahrzeugNummer;
    }

    public int getLaufleistung() {
        return laufleistung;
    }

    public void setLaufleistung(int laufleistung) {
        this.laufleistung = laufleistung;
    }

    public String getNummernschild() {
        return nummernschild;
    }

    public void setNummernschild(String nummernschild) {
        this.nummernschild = nummernschild;
    }

    public int getfGeschaeftsstellenNummer() {
        return fGeschaeftsstellenNummer;
    }

    public void setfGeschaeftsstellenNummer(int fGeschaeftsstellenNummer) {
        this.fGeschaeftsstellenNummer = fGeschaeftsstellenNummer;
    }

    public int getFrzModellNummer() {
        return frzModellNummer;
    }

    public void setFrzModellNummer(int frzModellNummer) {
        this.frzModellNummer = frzModellNummer;
    }
}
