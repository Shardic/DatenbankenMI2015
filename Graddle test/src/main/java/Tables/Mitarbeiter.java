package Tables;

import javax.persistence.*;

/**
 * Created by Fabian on 11.07.15.
 */

@Entity
@Table(name="mitarbeiter")
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

    public  Mitarbeiter(String name, String email, Integer gNummer){
        this.name = name;
        this.email = email;
        this.mitGeschaeftsstellennummer = gNummer;
    }

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
