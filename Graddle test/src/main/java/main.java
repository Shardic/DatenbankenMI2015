/**
 * Created by Fabian on 27.06.15.
 */
public class main {



    public static void main(String [] args) {
        System.out.println("Hello World");
        //http://www.tutorialspoint.com/hibernate/hibernate_quick_guide.htm
        /*
        KundenDAO km = new KundenDAO();
        //int id = km.addKunde("newKundewithManager", "gehtdichGarNichtsan@hs-bremen.de");
        List<Kunde> list = km.readAllKunden();
        for(int i= 0; i< list.size(); i++){
            System.out.println(list.get(i).getName());
        }
        //km.updateKundenEmail(1,"newKundenEmail@hs-bremen.de");
       // km.updateKundenNamen(1,"newNameFromManager");
       // km.deleteKunde(9);
       // Kunde k = km.getKundeByName("olli");
       // System.out.print(k.getId());

        MitarbeiterDAO mm = new MitarbeiterDAO();
        //mm.addMitarbeiter("newMitarbeiter", "newMitzarbeiter@hs-bremen.de", 1);
        List<Mitarbeiter> list = mm.readAllMitarbeiter();
        for(int i= 0; i< list.size(); i++){
            System.out.println(list.get(i).getName());
        }
        //mm.updateMitarbeiterGeschaeftsstelle(2,1);
        //mm.addMitarbeiter("newMitarbeiter2", "newMitzarbeiter2@hs-bremen.de", 1);
        //mm.deleteMitarbeiter(3);
        //mm.addMitarbeiter("newMitarbeiter2", "newMitzarbeiter2@hs-bremen.de", 1);
        Mitarbeiter newM = mm.getMitarbeiter("newMitarbeiter2", "newMitzarbeiter2@hs-bremen.de");
        System.out.println("Hier" + newM.getName());
        */
        /*
        RechnungDAO rm = new RechnungDAO();
        Rechnung r = rm.getRechnung(1);
        System.out.println(r.getRechnungsBetrag());
        rm.addRechnung(999, 5, new Date(5), new Date(5000));
        */

        /*KundenDAO km = new KundenDAO();
        List<Kunde> list = km.readAllKunden();
        for(int i= 0; i< list.size(); i++){
            System.out.println(list.get(i).getName());
        }*/


    }

}
