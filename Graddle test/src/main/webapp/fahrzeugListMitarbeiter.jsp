<%@ page import="DataAccessObjects.FahrzeugDAO" %>
<%@ page import="Tables.Fahrzeug" %>
<%@ page import="java.util.List" %>
<%@ page import="DataAccessObjects.FahrzeugmodellDAO" %>
<%@ page import="Tables.Fahrzeugmodell" %>
<%--
  Created by IntelliJ IDEA.
  User: Marco
  Date: 16.07.2015
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Fahrzeugliste</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
  <link href="bootstrap/css/mycss.css" rel="stylesheet">
</head>
<body>
<%
  int i;
  int j;
  int id, laufleistung, sitzplaetze = 0;
  String nummernschild, hersteller = null, fahrzeugtyp = null;
  FahrzeugDAO fDAO = new FahrzeugDAO();
  FahrzeugmodellDAO fMDAO = new FahrzeugmodellDAO();
  List<Fahrzeug> allFahrzeuge = fDAO.readAllFahrzeuge();
  List<Fahrzeugmodell> allFModelle = fMDAO.readAllFahrzeugmodelle();
%>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container">
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li><a href="kundenList.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Kundenliste</button></a></li>
        <li><a href="termineList.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Alle Termine</button></a></li>
        <li><a href="fahrzeugListMitarbeiter.jsp"><button class="btn btn-lg btn-primary btn-block active" type="button">Alle Fahrzeuge</button></a></li>
        <li><a href="ausloggen.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Ausloggen</button></a></li>
        <li><a href="myAccount.jsp"><button class="btn btn-lg btn-info btn-block" type="button">Als Kunde</button></a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>

<div class="container account-content">
  <table class="table table-bordered table-hover">
  <thead>
  <tr>
    <th>Fahrzeugnummer</th>
    <th>Laufleistung</th>
    <th>Nummernschild</th>
    <th>Hersteller</th>
    <th>Fahrzeugtyp</th>
    <th>Sitzplätze</th>
  </tr>
  </thead>
  <%
    for(i=0; i< allFahrzeuge.size(); i++){
      id = allFahrzeuge.get(i).getFahrzeugNummer();
      laufleistung = allFahrzeuge.get(i).getLaufleistung();
      nummernschild = allFahrzeuge.get(i).getNummernschild();
      for(j = 0; j< allFModelle.size(); j++) {
        if (allFahrzeuge.get(i).getFModellNummer() == allFModelle.get(j).getModellnummer()) {
          hersteller = allFModelle.get(j).getHersteller();
          fahrzeugtyp = allFModelle.get(j).getFahrzeugTyp();
          sitzplaetze = allFModelle.get(j).getAnzahlSitzplaetze();
        }
      }
  %>
  <tbody>
    <tr>
      <td><%= id%></td>
      <td><%= laufleistung%></td>
      <td><%= nummernschild%></td>
      <td><%= hersteller%></td>
      <td><%= fahrzeugtyp%></td>
      <td><%= sitzplaetze%></td>
    </tr>
  </tbody>
   <%}%>
</table>
</div>
</body>
</html>
