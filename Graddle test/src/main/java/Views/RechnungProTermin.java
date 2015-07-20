package Views;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Konrad on 19.07.2015.
 */
@Entity
@Table(name = "rechnung_pro_termin")
public class RechnungProTermin  implements Serializable {
    private int termin;
    private Integer rechnung;

    @Id
    @Column(name = "termin")
    public int getTermin() {
        return termin;
    }

    public void setTermin(int termin) {
        this.termin = termin;
    }

    @Id
    @Column(name = "rechnung")
    public Integer getRechnung() {
        return rechnung;
    }

    public void setRechnung(Integer rechnung) {
        this.rechnung = rechnung;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RechnungProTermin that = (RechnungProTermin) o;

        if (termin != that.termin) return false;
        if (rechnung != null ? !rechnung.equals(that.rechnung) : that.rechnung != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = termin;
        result = 31 * result + (rechnung != null ? rechnung.hashCode() : 0);
        return result;
    }
}
