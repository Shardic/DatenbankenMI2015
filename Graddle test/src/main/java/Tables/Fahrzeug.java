package Tables;
import javax.persistence.*;

/**
 * Created by Fabian on 11.07.15.
 */
@Entity
@Table(name="fahrzeug")
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

    public Fahrzeug(Integer laufleistung, String nummernschild, Integer fgeschaeftsstellennummer,
                    Integer fmodellnummer){
        this.laufleistung = laufleistung;
        this.nummernschild = nummernschild;
        this.fGeschaeftsstellenNummer = fgeschaeftsstellennummer;
        this.frzModellNummer =  fmodellnummer;
    }

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
