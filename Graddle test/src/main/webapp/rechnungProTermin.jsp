<%@ page import="DataAccessObjects.ViewDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="Views.RechnungProTermin" %>
<%--
  Created by IntelliJ IDEA.
  User: Konrad
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Rechnung zu Termin</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
<%
  int i;
  int terminnummer, betrag;
  ViewDAO myviews = new ViewDAO();
  List<RechnungProTermin> viewListe = myviews.getRechnungProTermin();
%>

<div class="container">
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>Terminnummer</th>
      <th>Rechnungsbetrag</th>
    </tr>
    </thead>


    <%

      for (Iterator iterator = viewListe.iterator(); iterator.hasNext();){
        RechnungProTermin iter = (RechnungProTermin) iterator.next();
        terminnummer = iter.getTermin();
        betrag = iter.getRechnung();


    %>

    <tbody>
    <tr>
      <td><%= terminnummer%></td>
      <td><%= betrag%></td>
    </tr>
    </tbody>

    <%}%>
  </table>
</div>

</body>
</html>
