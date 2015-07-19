package Views;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Konrad on 19.07.2015.
 */
@Entity
@Table(name = "arbeitsort")
public class Arbeitsort implements Serializable {
    private String name;
    private String ort;

    @Id
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Id
    @Column(name = "ort")
    public String getOrt() {
        return ort;
    }

    public void setOrt(String ort) {
        this.ort = ort;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Arbeitsort that = (Arbeitsort) o;

        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (ort != null ? !ort.equals(that.ort) : that.ort != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = name != null ? name.hashCode() : 0;
        result = 31 * result + (ort != null ? ort.hashCode() : 0);
        return result;
    }
}
