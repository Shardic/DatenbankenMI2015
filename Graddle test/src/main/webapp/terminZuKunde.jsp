<%@ page import="DataAccessObjects.ViewDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Date" %>
<%@ page import="Views.TerminZuKunde" %>
<%@ page import="Tables.Termin" %>
<%@ page import="DataAccessObjects.TerminDAO" %>
<%@ page import="utils.TageRechner" %>
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
  int kundennummer, terminnummer;
  long tage;
  Date starttag, endtag;
  Date heute = new Date();
  TerminDAO myviews = new TerminDAO();
  List<Termin> viewListe = null;

  if (loggedKunde.getId() == 0) {
    %>
      <jsp:forward page="index.jsp"/>
    <%
  } else {
    viewListe = myviews.readAllTermine(loggedKunde.getId());
  }


%>

<div class="container">
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>Starttag</th>
      <th>Endtag</th>
      <th>Anzahl Tage</th>
      <th>Bearbeiten</th>
    </tr>
    </thead>


    <%

      for (Iterator iterator = viewListe.iterator(); iterator.hasNext();){
        Termin iter = (Termin) iterator.next();
        starttag = iter.getStarttag();
        kundennummer = iter.getTkundennummer();
        terminnummer = iter.getTerminnummer();
        endtag = iter.getEndtag();
        tage = TageRechner.getAnzahlTage(starttag, endtag);


    %>

    <tbody>
    <tr>

      <td><%= starttag%>
      </td>
      <td><%= endtag%></td>
      <td><%= tage%></td>
      <%
        if (TageRechner.isBeforeDay(heute, starttag)) {
      %>
       <td><a href="editTermin.jsp?id=<%= terminnummer%>"><button class="btn btn-lg btn-primary btn-block" type="button">Bearbeiten</button></a></td>
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
