import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;



/**
 * Created by Fabian on 27.06.15.
 */
public class TestClass {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer memberNr;
    @Column(name="user_name", nullable=false, length=20)
    private String username;
    @Column(nullable=false, length=255)
    private String email;

    void setUsername(String newName){
        this.username = newName;
    }

    String getUsername(){
        return this.username;
    }
}
