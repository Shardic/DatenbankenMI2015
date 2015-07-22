<%@ page import="java.util.Date" %>
<%@ page import="Tables.Termin" %>
<%@ page import="Tables.Rechnung" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="Views.FahrzeugeMitTermindaten" %>
<%@ page import="Tables.Fahrzeug" %>
<%@ page import="DataAccessObjects.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Tables.Fahrzeugmodell" %>
<%--
  Created by IntelliJ IDEA.
  User: Marco
  Date: 22.07.2015
  Time: 00:29
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="loggedKunde" class="Tables.Kunde" scope="session"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Erstelle Termin Fahrzeugauswahl</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>

<body>
<%

  Date start = null,
          end = null;
  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
  try {
    start = format.parse(request.getParameter("startDate"));
    end = format.parse(request.getParameter("endDate"));
  } catch (Exception e) {
    e.printStackTrace();
  }
  ArrayList<Integer> nichtVerfFahrzeuge = new ArrayList<Integer>();
  FahrzeugmodellDAO fMDAO = new FahrzeugmodellDAO();
  List<Fahrzeugmodell> allModelle = fMDAO.readAllFahrzeugmodelle();
  int kundenNummer = loggedKunde.getId();
  int fahrzeugNummer = 0, laufleistung = 0, anzahl_sitzplaetze = 0, i, k, j = 0;
  String nummernschild = null, hersteller = null, fahrzeugtyp = null;
  FahrzeugDAO fDAO = new FahrzeugDAO();
  List<Fahrzeug> allFahrzeuge = fDAO.readAllFahrzeuge();
  ViewDAO viewDAO = new ViewDAO();
  List<FahrzeugeMitTermindaten> verfFahrzeuge = viewDAO.getFahrzeugeMitTermindaten(start,end);

%>
<%!

  public boolean checkDate(Date d1, Date d2){
    if (d1.after(d2)) {
      return false;
    }
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

<div class="container">
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>Fahrzeugnummer</th>
      <th>Laufleistung</th>
      <th>Nummernschild</th>
      <th>Hersteller</th>
      <th>Fahrzeugtyp</th>
      <th>Sitzplaetze</th>
    </tr>
    </thead>
    <%
      //Holt sich die Fahrzeuge aus der View mit den Termindaten, die nicht verfügbar sind und zeigt dann alle
      //übrigen Fahrzeuge an, die nicht in der Liste sind.
      for (k = 0; k < verfFahrzeuge.size();k++) {
        nichtVerfFahrzeuge.add(verfFahrzeuge.get(k).getFahrzeugnummer());
      }
      for(i=0; i< allFahrzeuge.size(); i++){
        for (int m = 0; m < nichtVerfFahrzeuge.size(); m++) {
          if (!(nichtVerfFahrzeuge.get(m).equals(allFahrzeuge.get(i).getFahrzeugNummer()))) {
            fahrzeugNummer = allFahrzeuge.get(i).getFahrzeugNummer();
            laufleistung = allFahrzeuge.get(i).getLaufleistung();
            nummernschild = allFahrzeuge.get(i).getNummernschild();
            for (j = 0; j < allModelle.size(); j++) {
              if (allFahrzeuge.get(i).getFModellNummer() == allModelle.get(j).getModellnummer()) {
                hersteller = allModelle.get(j).getHersteller();
                fahrzeugtyp = allModelle.get(j).getFahrzeugTyp();
                anzahl_sitzplaetze = allModelle.get(j).getAnzahlSitzplaetze();
              }
            }
          }
        }
    %>
    <tbody>
    <tr>
      <td><%= fahrzeugNummer%></td>
      <td><%= laufleistung%></td>
      <td><%= nummernschild%></td>
      <td><%= hersteller%></td>
      <td><%= fahrzeugtyp%></td>
      <td><%= anzahl_sitzplaetze%></td>
    </tr>
    </tbody>
    <%}%>
  </table>
</div>


<%
  if (request.getParameter("startDate") != null) {
    if(checkDate(start, end)){
    }else {
      %>
      <script>
              alert("Das Enddatum kann nicht vor dem Startdatum liegen!");
              window.location.href= "createTermin.jsp";
      </script>
<%
      }
    }

  //if (request.getParameter() != null) {
   // fahrzeugNummer = request.getParameter("");
  //}
%>

</body>
</html>
