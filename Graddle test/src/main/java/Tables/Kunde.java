package Tables;
import javax.persistence.*;

/**
 * Created by Fabian on 29.06.15.
 */
@Entity
@Table(name="kunde")
public class Kunde {

    @Id @GeneratedValue
    @Column(name = "kundennummer")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name="passwort")
    private String passwort;

    public Kunde(){}
    public Kunde(String name, String email, String passwort){
        this.name = name;
        this.email = email;
        this.passwort = passwort;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getPasswort() {
        return passwort;
    }

    public void setPasswort(String passwort) {
        this.passwort = passwort;
    }
}
