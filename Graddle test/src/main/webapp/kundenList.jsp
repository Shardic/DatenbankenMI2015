

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
<jsp:useBean id="loggedKunde" class="Tables.Kunde" scope="session"/>
<%
  if (loggedKunde.getId()== 0) {
%>
<jsp:forward page="index.jsp"/>
<%
  }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kundeliste</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
  <link href="bootstrap/css/mycss.css" rel="stylesheet">
</head>
<body>
  <%
    int i;
    int id;
    String name, email, passwort;
    KundenDAO kDao = new KundenDAO();
    List<Kunde> allKunden = kDao.readAllKunden();
  %>

  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
      <div id="navbar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li><a href="kundenList.jsp"><button class="btn btn-lg btn-primary btn-block active" type="button">Kundenliste</button></a></li>
          <li><a href="termineList.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Alle Termine</button></a></li>
          <li><a href="fahrzeugList.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Alle Fahrzeuge</button></a></li>
          <li><a href="ausloggen.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Ausloggen</button></a></li>
          <li><a href="myAccount.jsp"><button class="btn btn-lg btn-info btn-block" type="button">Als Kunde</button></a></li>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
  </nav>

  <div class="container account-content">
  <table class="table table-bordered">
  <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Passwort</th>
    </tr>
  </thead>


  <%
    for(i=0; i< allKunden.size(); i++){
     // System.out.println(allKunden.get(i).getName());
      id = allKunden.get(i).getId();
      name = allKunden.get(i).getName();
      email = allKunden.get(i).getEmail();
      passwort = allKunden.get(i).getPasswort();
  %>

  <tbody>
      <tr>
        <td><%= id%></td>
        <td><%= name%></td>
        <td><%= email%></td>
        <td><%= passwort%></td>
      </tr>
  </tbody>

  <%}%>
  </table>
  </div>

</body>
</html>
