<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="DataAccessObjects.TerminDAO" %>
<%@ page import="DataAccessObjects.TerminManagementDAO" %>
<%@ page import="Tables.Termin" %>
<%@ page import="java.util.List" %>
<%@ page import="DataAccessObjects.RechnungDAO" %>
<%@ page import="Tables.Rechnung" %>
<%@ page import="Tables.Fahrzeug" %>
<%@ page import="DataAccessObjects.FahrzeugDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: Marco
  Date: 17.07.2015
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Erstelle Termin</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>



<%
  int k = 0;
  FahrzeugDAO fDAO = new FahrzeugDAO();
  List<Fahrzeug> fahrzeuge = fDAO.readAllFahrzeuge();
  Date start, end;
  int kundenNummer, fahrzeugNummer;
  boolean test = true;

%>
<%!

  public boolean checkDate(Date d1, Date d2){
    if (d1.after(d2)) {
      return false;
    }
    return true;
  }

  public boolean checkKunde(int kundenNummer) {

    return true;
  }

  public boolean checkFahrzeugVerfuegbar(int fahrzeugNummer) {

    return true;
  }

  public void createNewTermin(Date start, Date end, int kundennummer, int fahrzeugnummer){
    TerminDAO tDAO = new TerminDAO();
    tDAO.addTermin(start, end, kundennummer);
    RechnungDAO rDAO = new RechnungDAO();
    int diffInDays = (int)( (end.getTime() - start.getTime())
            / (1000 * 60 * 60 * 24));
    rDAO.addRechnung(diffInDays*100,kundennummer,start,end);
    TerminManagementDAO tMDAO = new TerminManagementDAO();
    List<Termin> terminList = tDAO.readAllTermine();
    List<Rechnung> rechnungList = rDAO.getAll();
    int rechnungsnummer = rechnungList.get(rechnungList.size()-1).getRechnungsNummer();
    int terminnumer = terminList.get(terminList.size()-1).getTerminnummer();
    tMDAO.addTerminManagement(rechnungsnummer,fahrzeugnummer,terminnumer);
  }
%>

<form action="#" method="post" required>
  <div class="container">
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <h1 style="text-align: center">Termin erstellen</h1>
      </div>
    </div>
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <h6>Startdatum</h6>
        <label for="inputStart" class="sr-only">Name</label>
        <input type="date" name="startDate" id="inputStart" class="form-control" required >
        <h6>Enddatum</h6>
        <label for="inputEnd" class="sr-only">Email</label>
        <input type="date" name="endDate" id="inputEnd" class="form-control" required>
        <!--
        <br>
        <label for="kundenNummer" class="sr-only">kundenNummer</label>
        <input type="int" name="kundenNummer" id="kundenNummer" class="form-control" placeholder="Kunden Nummer (Muss ausgetauscht werden bei der Sessionnutzung) required">
        <br>
        <label for="fahrzeugNummer" class="sr-only">Fahrzeugnummer</label>
        <input list="fahrzeuge" name="fahrzeugNummer" id="fahrzeugNummer" class="form-control" placeholder="Fahrzeug auswählen" required>
        <br>
        -->
        <br>
        <a href="createTermin.jsp"><button value="Submit" class="btn btn-lg btn-primary btn-block" type="submit">Fahrzeuge Finden</button></a>
      </div>
    </div>
  </div>


  <%
    if (request.getParameter("startDate") != null) {
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
      start = format.parse(request.getParameter("startDate"));
      end = format.parse(request.getParameter("endDate"));
      kundenNummer = Integer.parseInt(request.getParameter("kundenNummer"));
      fahrzeugNummer =Integer.parseInt(request.getParameter("fahrzeugNummer"));
      if(checkDate(start, end)){
       if (checkKunde(kundenNummer)) {
        if (checkFahrzeugVerfuegbar(fahrzeugNummer)) {
          createNewTermin(start, end, kundenNummer, fahrzeugNummer);
        } else {
            %>
            <script>
              alert("Das Fahrzeug existiert nicht");
            </script>
            <%
        }
       } else {
         %>
          <script>
            alert("Dieser Kunde existiert nicht!");
          </script>
         <%
       }
      }else{
  %>
  <script>
    alert("Das Enddatum kann nicht vor dem Startdatum liegen!");
  </script>
  <%
      }
    }
  %>
</form>


</body>
</html>