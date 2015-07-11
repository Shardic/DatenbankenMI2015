import Managers.KundenManager;
import Tables.Kunde;

import java.util.Iterator;
import java.util.List;

import org.hibernate.*;


/**
 * Created by Fabian on 27.06.15.
 */
public class main {



    public static void main(String [] args) {
        System.out.println("Hello World");


        //DBConnection d = new DBConnection();
        KundenManager k = new KundenManager();
        Kunde ka = k.getKundeByID(0);


    }
}
