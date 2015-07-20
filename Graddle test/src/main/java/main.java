


import DataAccessObjects.FahrzeugDAO;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Fabian on 27.06.15.
 */
public class main {



    public static void main(String [] args) {
        System.out.println("Hello World");
        FahrzeugDAO fDAO = new FahrzeugDAO();
        Date start = null, end = null;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try {
            start = format.parse("2015-08-01");
            end = format.parse("2015-08-30");
        } catch(ParseException e) {
            e.printStackTrace();
        }
        int xcv = 1;
        if (fDAO.isFahrzeugAvailable(1,start,end)) {
            System.out.println("fahrzeug verfuegbar (darf nicht kommen bei ID 1)");
        }
    }
}
