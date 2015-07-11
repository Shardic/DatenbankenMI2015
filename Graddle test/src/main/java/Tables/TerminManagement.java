package Tables;

import javax.persistence.Column;
import javax.persistence.Id;

/**
 * Created by Fabian on 11.07.15.
 */
public class TerminManagement {

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
