package Tables;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Fabian on 11.07.15.
 */
@Entity
@Table(name="terminmanagement")
public class TerminManagement implements Serializable {

    @Id
    @Column(name = "mterminnummer")
    private int mTerminnummer;

    @Id
    @Column(name = "mrechnungsnummer")
    private int mRechunungsnummer;

    @Id
    @Column(name = "mfahrzeugnummer")
    private int mFahrzeugnummer;

    public TerminManagement(){}

    public TerminManagement(int rechnung, int fahrzeug, int termin) {
        this.mRechunungsnummer = rechnung;
        this.mFahrzeugnummer = fahrzeug;
        this.mTerminnummer = termin;
    }

    public int getmTerminnummer() {
        return mTerminnummer;
    }

    public void setmTerminnummer(int mTerminnummer) {
        this.mTerminnummer = mTerminnummer;
    }

    public int getmRechunungsnummer() {
        return mRechunungsnummer;
    }

    public void setmRechunungsnummer(int mRechunungsnummer) {
        this.mRechunungsnummer = mRechunungsnummer;
    }

    public int getmFahrzeugnummer() {
        return mFahrzeugnummer;
    }

    public void setmFahrzeugnummer(int mFahrzeugnummer) {
        this.mFahrzeugnummer = mFahrzeugnummer;
    }
}
