<%@ page import="DataAccessObjects.ViewDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="Views.KundeZuRechnung" %>
<%@ page import="java.util.Iterator" %>
<%--
  Created by IntelliJ IDEA.
  User: Konrad
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
  int kundennummer, rechnungsnummer, rechnungsbetrag;
  String kundenname;
  ViewDAO myviews = new ViewDAO();
  List<KundeZuRechnung> viewListe;

  System.out.println(request.getParameter("id"));

  viewListe = myviews.getKundeZuRechnungView();

  if (request.getParameter("id") == null) {
    viewListe = myviews.getKundeZuRechnungView();
  } else {
    Integer id = Integer.parseInt(request.getParameter("id"));
    viewListe = myviews.getKundeZuRechnungView(id);
  }

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
          KundeZuRechnung iter = (KundeZuRechnung) iterator.next();
          kundennummer = iter.getKundennummer();
          rechnungsnummer = iter.getRechnungsnummer();
          rechnungsbetrag = iter.getRechnungsbetrag();
          kundenname = iter.getName();


    %>

    <tbody>
    <tr>
      <td><%= kundennummer%></td>
      <td><%= kundenname%></td>
      <td><%= rechnungsnummer%></td>
      <td><%= rechnungsbetrag%></td>
    </tr>
    </tbody>

    <%}%>
  </table>
</div>

</body>
</html>
