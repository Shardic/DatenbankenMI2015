<%@ page import="DataAccessObjects.ViewDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Date" %>
<%@ page import="Tables.Termin" %>
<%@ page import="DataAccessObjects.TerminDAO" %>
<%@ page import="utils.TageRechner" %>
<%@ page import="Views.Rechnungsansicht" %>
<%--
  Created by IntelliJ IDEA.
  User: Konrad
--%>
<jsp:useBean id="loggedKunde" class="Tables.Kunde" scope="session"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Termin zu Kunde</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
  <link href="bootstrap/css/mycss.css" rel="stylesheet">
</head>
<body>
<%
  int i;
  int rechnungsnummer, fahrzeugnummer, terminnummer;
  long tage;
  Date starttag, endtag;
  Date heute = new Date();
  TerminDAO myviews = new TerminDAO();
  ViewDAO myRechnung = new ViewDAO();
  List<Termin> viewListe = null;
  List<Rechnungsansicht> rListe = null;

  if (loggedKunde.getId() == 0) {
    %>
      <jsp:forward page="index.jsp"/>
    <%
  } else {
    viewListe = myviews.readAllTermine(loggedKunde.getId());
    rListe = myRechnung.getRechnungsansicht(loggedKunde.getId());
  }


%>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container">
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li><a href="termine.jsp"><button class="btn btn-lg btn-primary btn-block active" type="button">Meine Termine</button></a></li>
        <li><a href="rechnungen.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Meine Rechnungen</button></a></li>
        <li><a href="createTermin.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Fahrzeug buchen</button></a></li>
        <li><a href="updateUser.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Konto bearbeiten</button></a></li>
        <li><a href="ausloggen.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Ausloggen</button></a></li>
        <li><a href="mitarbeiterAnsicht.jsp"><button class="btn btn-lg btn-info btn-block" type="button">Als Mitarbeiter</button></a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>

<div class="container account-content">
  <table class="table table-bordered table-hover">
    <thead>
    <tr>
      <th>Starttag</th>
      <th>Endtag</th>
      <th>Anzahl Tage</th>
      <th>Bearbeiten</th>
    </tr>
    </thead>


    <%
      for (Iterator iterator = rListe.iterator(); iterator.hasNext();) {
        Rechnungsansicht iter = (Rechnungsansicht) iterator.next();
        starttag = iter.getStarttag();
        endtag = iter.getEndtag();
        tage = TageRechner.getAnzahlTage(starttag, endtag);
    %>

    <tbody>
    <tr>

      <td><%= starttag%></td>
      <td><%= endtag%></td>
      <td><%= tage%></td>
      <%
        if (TageRechner.isBeforeDay(heute, starttag)) {

        session.setAttribute("Object", iter);
      %>
       <td><a href="deleteTermin.jsp"><button class="btn btn-sm btn-success btn-block" type="button">Stornieren</button></a></td>

      <%
      } else {
      %>
      <td><a href="rechnungen.jsp"><button class="btn btn-sm btn-primary btn-block" type="button">Rechnung</button></a></td>
      <%
      }
      %>
    </tr>
    </tbody>

    <%}%>
  </table>
</div>

</body>
</html>
