<%@ page import="DataAccessObjects.ViewDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Date" %>
<%@ page import="Views.TerminFahrzeug" %>
<%--
  Created by IntelliJ IDEA.
  User: Konrad
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Termin zu Fahrzeug</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
<%
  int i;
  int terminnummer, fahrzeugnummer;
  Date starttag, endtag;
  ViewDAO myviews = new ViewDAO();
  List<TerminFahrzeug> viewListe = myviews.getTerminFahrzeug();
%>

<div class="container">
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>Terminnummer</th>
      <th>Starttag</th>
      <th>Endttag</th>
      <th>Fahrzeugnummer</th>
    </tr>
    </thead>


    <%

      for (Iterator iterator = viewListe.iterator(); iterator.hasNext();){
        TerminFahrzeug iter = (TerminFahrzeug) iterator.next();
        terminnummer = iter.getTerminnummer();
        starttag = iter.getStarttag();
        endtag = iter.getEndtag();
        fahrzeugnummer = iter.getFahrzeugnummer();


    %>

    <tbody>
    <tr>
      <td><%= terminnummer%></td>
      <td><%= starttag%></td>
      <td><%= endtag%></td>
      <td><%= fahrzeugnummer%></td>
    </tr>
    </tbody>

    <%}%>
  </table>
</div>

</body>
</html>
