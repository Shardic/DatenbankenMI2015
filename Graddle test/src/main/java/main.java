import org.hibernate.HibernateException;

import javax.security.auth.login.Configuration;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Fabian on 27.06.15.
 */
public class main {
    public static void main(String [] args) {
        System.out.println("Hello World");
        TestClass h = new TestClass();
        h.setUsername("hahha");
        System.out.println(h.getUsername());
        //DBConnection d = new DBConnection();
    }
}
