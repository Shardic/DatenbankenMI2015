<%@ page import="DataAccessObjects.ViewDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="Views.Arbeitsort" %>
<%--
  Created by IntelliJ IDEA.
  User: Konrad
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Arbeitsort</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
<%
  int i;
  String name, ort;
  ViewDAO myviews = new ViewDAO();
  List<Arbeitsort> viewListe = myviews.getArbeitsort();
%>

<div class="container">
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>Mitarbeitername</th>
      <th>Arbeitsort</th>
    </tr>
    </thead>


    <%

      for (Iterator iterator = viewListe.iterator(); iterator.hasNext();){
        Arbeitsort iter = (Arbeitsort) iterator.next();
        name = iter.getName();
        ort = iter.getOrt();


    %>

    <tbody>
    <tr>
      <td><%= name%></td>
      <td><%= ort%></td>
    </tr>
    </tbody>

    <%}%>
  </table>
</div>

</body>
</html>
