

<%@ page import="DataAccessObjects.KundenDAO" %>
<%@ page import="Tables.Kunde" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Fabian
  Date: 15.07.15
  Time: 17:17
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
    int id;
    String name, email, passwort;
    KundenDAO kDao = new KundenDAO();
    List<Kunde> allKunden = kDao.readAllKunden();
  %>
  <table>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Passwort</th>
  </tr>


  <%
    for(i=0; i< allKunden.size(); i++){
      System.out.println(allKunden.get(i).getName());
      id = allKunden.get(i).getId();
      name = allKunden.get(i).getName();
      email = allKunden.get(i).getEmail();
      passwort = allKunden.get(i).getPasswort();


  %>


      <tr>
        <td><%= id%></td>
        <td><%= name%></td>
        <td><%= email%></td>
        <td><%= passwort%></td>
      </tr>

  <%}%>
  </table>

</body>
</html>
