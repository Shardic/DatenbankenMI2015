<%@ page import="DataAccessObjects.TerminDAO" %>
<%@ page import="Tables.Termin" %>
<%@ page import="java.util.List" %>
<%@ page import="DataAccessObjects.TerminManagementDAO" %>
<%@ page import="Tables.TerminManagement" %>
<%@ page import="java.util.Date" %>

<%--
  Created by IntelliJ IDEA.
  User: Marco
  Date: 17.07.2015
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Terminliste</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
<%
  int i;
  int j;
  int terminID, fahrzeugnummer = 0, rechnungsnummer = 0, kundennummer;
  Date start, end;
  TerminDAO tDAO = new TerminDAO();
  TerminManagementDAO tMDAO = new TerminManagementDAO();
  List<Termin> allTermine = tDAO.readAllTermine();
  List<TerminManagement> allTerminManagements = tMDAO.getAll();
%>

<%!

  public void showRechnung(int rechnungsNummer) {

  }
%>

<div class="container">
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>Terminnummer</th>
      <th>Starttag</th>
      <th>Endtag</th>
      <th>Kundennummer</th>
      <th>Fahrzeugnummer</th>
      <th>Rechnungsnummer</th>
    </tr>
    </thead>
      <%
    for(i=0; i< allTermine.size(); i++){
      terminID = allTermine.get(i).getTerminnummer();
      start = allTermine.get(i).getStarttag();
      end = allTermine.get(i).getEndtag();
      kundennummer = allTermine.get(i).getTkundennummer();
      for(j = 0; j< allTerminManagements.size(); j++) {
        if (terminID == allTerminManagements.get(j).getmTerminnummer()) {
          fahrzeugnummer = allTerminManagements.get(j).getmFahrzeugnummer();
          rechnungsnummer = allTerminManagements.get(j).getmRechunungsnummer();
        }
      }
  %>
    <tbody>
    <tr>
      <td><%= terminID%></td>
      <td><%= start%></td>
      <td><%= end%></td>
      <td><%= kundennummer%>
       <!-- <a href="login.jsp"><button class="btn btn-primary btn-group-xs" type="button">Kunde anzeigen</button></a> -->
      </td>
      <td><%= fahrzeugnummer%>
     <!-- <a href="login.jsp"><button class="btn btn-primary btn-group-xs" type="button">Fahrzeug anzeigen</button></a>-->
      </td>
      <td><%= rechnungsnummer%>
        <!--<a href=login.jsp><button class="btn btn-primary btn-group-xs" type="button">Rechnung anzeigen</button></a>-->
        </td>
    </tr>
    </tbody>
      <%}%>

</body>
</html>
