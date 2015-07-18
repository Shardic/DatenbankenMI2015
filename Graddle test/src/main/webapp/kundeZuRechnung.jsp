<%@ page import="DataAccessObjects.ViewDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="Views.KundeZuRechnung" %>
<%@ page import="java.util.Iterator" %>
<%--
  Created by IntelliJ IDEA.
  User: Konrad
  Date: 18.07.2015
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Kundeliste</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
<%
  int i;
  int Kundennummer, Rechnungsnummer, Rechnungsbetrag;
  String Kundenname;
  ViewDAO myviews = new ViewDAO();
  List<KundeZuRechnung> viewListe = myviews.getKundeZuRechnungView();
%>

<div class="container">
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>KundenID</th>
      <th>Name</th>
      <th>RechnungsID</th>
      <th>Betrag</th>
    </tr>
    </thead>


    <%

        for (Iterator iterator = viewListe.iterator(); iterator.hasNext();){
          KundeZuRechnung kunde = (KundeZuRechnung) iterator.next();
          Kundennummer = kunde.getKundennummer();
          Rechnungsnummer = kunde.getRechnungsnummer();
          Rechnungsbetrag = kunde.getRechnungsbetrag();
          Kundenname = kunde.getName();


    %>

    <tbody>
    <tr>
      <td><%= Kundennummer%></td>
      <td><%= Kundenname%></td>
      <td><%= Rechnungsnummer%></td>
      <td><%= Rechnungsbetrag%></td>
    </tr>
    </tbody>

    <%}%>
  </table>
</div>

</body>
</html>
