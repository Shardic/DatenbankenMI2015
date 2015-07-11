package Tables;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Created by Fabian on 11.07.15.
 */
public class Geschaeftsstelle {

    @Id
    @GeneratedValue
    @Column(name = "geschaeftsstellennummer")
    private int geschaeftsstellennummer;

    @Column(name = "ort")
    private String ort;

    @Column(name = "plz")
    private String plz;

    public Geschaeftsstelle(){}

    public int getGeschaeftsstellennummer() {
        return geschaeftsstellennummer;
    }

    public void setGeschaeftsstellennummer(int geschaeftsstellennummer) {
        this.geschaeftsstellennummer = geschaeftsstellennummer;
    }

    public String getOrt() {
        return ort;
    }

    public void setOrt(String ort) {
        this.ort = ort;
    }

    public String getPlz() {
        return plz;
    }

    public void setPlz(String plz) {
        this.plz = plz;
    }
}
