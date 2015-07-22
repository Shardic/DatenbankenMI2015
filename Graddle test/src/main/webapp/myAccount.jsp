<%--
  Created by IntelliJ IDEA.
  User: Konrad
  Date: 20.07.2015
  Time: 13:50
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
    <title>Mein Account <%= loggedKunde.getName() %></title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Autovermietung</a>
    </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="myAccount.jsp">Home</a></li>
        <li><a href="terminZuKunde.jsp?id=<%=loggedKunde.getId()%>">Meine Termine</a></li>
        <li><a href="kundeZuRechnung.jsp?id=<%=loggedKunde.getId()%>">Meine Rechnungen</a></li>
        <li><a href="#">Fahrzeug buchen</a></li>
        <li><a href="createTermin.jsp">Termin buchen</a></li>
        <li><a href="updateUser.jsp">Konto bearbeiten</a></li>
        <li><a href="ausloggen.jsp">Ausloggen</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>

<div class="container" style="margin-top: 70px">
  <p>Kunde</p><br>
  <p>Name: <%= loggedKunde.getName() %> </p>
  <p>Email: <%= loggedKunde.getEmail() %> </p>
  <p>Nummer: <%= loggedKunde.getId() %> </p>
  <p>Passwort: <%= loggedKunde.getPasswort() %> </p>
</div>


</body>
</html>
