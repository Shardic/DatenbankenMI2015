package Tables;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Created by Fabian on 11.07.15.
 */
public class Mitarbeiter {

    @Id
    @GeneratedValue
    @Column(name = "mitarbeiternummer")
    private int mitarbeiterNummer;

    @Column(name = "name")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name="mitgeschaeftsstellennummer")
    private  int mitGeschaeftsstellennummer;

    public Mitarbeiter(){}

    public int getMitarbeiterNummer() {
        return mitarbeiterNummer;
    }

    public void setMitarbeiterNummer(int mitarbeiterNummer) {
        this.mitarbeiterNummer = mitarbeiterNummer;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getMitGeschaeftsstellennummer() {
        return mitGeschaeftsstellennummer;
    }

    public void setMitGeschaeftsstellennummer(int mitGeschaeftsstellennummer) {
        this.mitGeschaeftsstellennummer = mitGeschaeftsstellennummer;
    }
}
