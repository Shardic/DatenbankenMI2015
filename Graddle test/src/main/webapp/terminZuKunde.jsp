<%@ page import="DataAccessObjects.ViewDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.sql.Date" %>
<%@ page import="Views.TerminZuKunde" %>
<%--
  Created by IntelliJ IDEA.
  User: Konrad
--%>
<jsp:useBean id="kunde" class="Tables.Kunde" scope="session"/>
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
  int kundennummer;
  Date starttag;
  ViewDAO myviews = new ViewDAO();
  List<TerminZuKunde> viewListe;

  //TODO: Natürlich sollte nicht jeder einfach alle Kundenrechnungen einsehen können, also müsste noch ein Prüfen auf Mitarbeiter (oder ähnlich) stattfinden
  if (request.getParameter("id") == null || request.getParameter("id") == "") {
    viewListe = myviews.getTerminZuKunde();
  } else {
    Integer requestId = Integer.parseInt(request.getParameter("id"));
    //TODO: prüft, ob die Kunden Id auch tatsächlich die request Id ist, aber für testzwecke weglassen
    //if (kunde.getId() == requestId) {
    viewListe = myviews.getTerminZuKunde(requestId);
    //}
  }
%>

<div class="container">
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>Kundennummer</th>
      <th>Starttag</th>
    </tr>
    </thead>


    <%

      for (Iterator iterator = viewListe.iterator(); iterator.hasNext();){
        TerminZuKunde iter = (TerminZuKunde) iterator.next();
        starttag = iter.getStarttag();
        kundennummer = iter.getTkundennummer();


    %>

    <tbody>
    <tr>
      <td><%= kundennummer%></td>
      <td><%= starttag%></td>
    </tr>
    </tbody>

    <%}%>
  </table>
</div>

</body>
</html>
