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

<div class="container">
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
        terminnummer = iter.getTerminnummer();
        rechnungsnummer = iter.getRechnungsnummer();
        fahrzeugnummer = iter.getFahrzeugnummer();
        System.out.println("Termin:");
        System.out.println(starttag);
        System.out.println(endtag);
        System.out.println(tage);
        System.out.println(terminnummer);
        System.out.println(rechnungsnummer);
        System.out.println(fahrzeugnummer);
      /*
      for (Iterator iterator = viewListe.iterator(); iterator.hasNext();){
        Termin iter = (Termin) iterator.next();
        starttag = iter.getStarttag();
        kundennummer = iter.getTkundennummer();
        terminnummer = iter.getTerminnummer();
        endtag = iter.getEndtag();
        tage = TageRechner.getAnzahlTage(starttag, endtag);
      */

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
