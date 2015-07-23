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
  String start = request.getParameter("startDate"),
          end = request.getParameter("endDate");
  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
  Date date1 = null, date2 = null;
  try {
    date1 = format.parse(start);
    date2 = format.parse(end);
  } catch (Exception e) {
    e.printStackTrace();
  }
  %>
<%
  ArrayList<Integer> nichtVerfFahrzeuge = new ArrayList<Integer>();
  FahrzeugmodellDAO fMDAO = new FahrzeugmodellDAO();
  List<Fahrzeugmodell> allModelle = fMDAO.readAllFahrzeugmodelle();
  int kundenNummer =(int) loggedKunde.getId();
  int fahrzeugNummer = 0, laufleistung = 0, anzahl_sitzplaetze = 0, i, k, j = 0;
  String nummernschild = null, hersteller = null, fahrzeugtyp = null;
  FahrzeugDAO fDAO = new FahrzeugDAO();
  List<Fahrzeug> allFahrzeuge = fDAO.readAllFahrzeuge();
  ViewDAO viewDAO = new ViewDAO();
  List<FahrzeugeMitTermindaten> verfFahrzeuge = viewDAO.getFahrzeugeMitTermindaten(start,end);

  if (start != null) {
    if(checkDate(date1, date2)){
    }else {
%>
<script>
  alert("Das Enddatum kann nicht vor dem Startdatum liegen!");
  window.location.href= "createTermin.jsp";
</script>
<%
    }
  }
%>
<%!

  public boolean checkDate(Date d1, Date d2){
    if (d1.after(d2)) {
      return false;
    } else {
      return true;
    }
  }

  public void createNewTermin(Date anfangsTag, Date endTag, int kundennummer, int fahrzeugnummer){
    TerminDAO tDAO = new TerminDAO();
    tDAO.addTermin(anfangsTag, endTag, kundennummer);
    RechnungDAO rDAO = new RechnungDAO();
    int diffInDays = (int)( (endTag.getTime() - anfangsTag.getTime())
            / (1000 * 60 * 60 * 24));
    rDAO.addRechnung(diffInDays*100,kundennummer,anfangsTag,endTag);
    TerminManagementDAO tMDAO = new TerminManagementDAO();
    List<Termin> terminList = tDAO.readAllTermine();
    List<Rechnung> rechnungList = rDAO.getAll();
    int rechnungsnummer = rechnungList.get(rechnungList.size()-1).getRechnungsNummer();
    int terminnumer = terminList.get(terminList.size()-1).getTerminnummer();
    tMDAO.addTerminManagement(rechnungsnummer,fahrzeugnummer,terminnumer);
  }

%>


<div class="container">
  <table class="table table-bordered table-hover">
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
        boolean fahrzeugVerf = true;
        for (int m = 0; m < nichtVerfFahrzeuge.size(); m++) {
          if(allFahrzeuge.get(i).getFahrzeugNummer() == (int) nichtVerfFahrzeuge.get(m)) {
            fahrzeugVerf = false;
          }
        }
        if (fahrzeugVerf) {
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
    <%
        }
      }%>
  </table>
  <form action="#" method="post">
    <label for="chosenFahrzeug" class="sr-only">Email</label>
    <input type="int" id="chosenFahrzeug" name="chosenFahrzeug" class="form-control" placeholder="Fahrzeugnummer" required autofocus>
    <input type='hidden' name = 'startDate'    value = <%=start %>>
    <input type='hidden' name = 'endDate'    value =  <%=end %>>
    <a href="#"><button id ="sub" value="Submit" class="btn btn-lg btn-primary btn-block" type="submit">Fahrzeug buchen</button></a>
  </form>
</div>

<%
  if (request.getParameter("chosenFahrzeug") != null) {
    int fahrzeug = Integer.parseInt(request.getParameter("chosenFahrzeug"));
    createNewTermin(date1,date2,kundenNummer,fahrzeug);
%>
<script>
  alert("Ihr Termin wurde gebucht!");
  window.location.href= "myAccount.jsp";
</script>
<%
  }
%>
</body>
</html>
