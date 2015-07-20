<%@ page import="DataAccessObjects.ViewDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.sql.Date" %>
<%@ page import="Views.TerminZuKunde" %>
<%--
  Created by IntelliJ IDEA.
  User: Konrad
--%>
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
  List<TerminZuKunde> viewListe = myviews.getTerminZuKunde();
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
