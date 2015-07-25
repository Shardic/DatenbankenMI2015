<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="DataAccessObjects.TerminDAO" %>
<%@ page import="DataAccessObjects.TerminManagementDAO" %>
<%@ page import="Tables.Termin" %>
<%@ page import="java.util.List" %>
<%@ page import="DataAccessObjects.RechnungDAO" %>
<%@ page import="Tables.Rechnung" %>
<%@ page import="Tables.Fahrzeug" %>
<%@ page import="DataAccessObjects.FahrzeugDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: Marco
  Date: 17.07.2015
  Time: 21:15
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
    <title>Erstelle Termin</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
  <link href="bootstrap/css/mycss.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container">
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li><a href="termine.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Meine Termine</button></a></li>
        <li><a href="rechnungen.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Meine Rechnungen</button></a></li>
        <li><a href="createTermin.jsp"><button class="btn btn-lg btn-primary btn-block active" type="button">Fahrzeug buchen</button></a></li>
        <li><a href="updateUser.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Konto bearbeiten</button></a></li>
        <li><a href="ausloggen.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Ausloggen</button></a></li>
        <li><a href="mitarbeiterAnsicht.jsp"><button class="btn btn-lg btn-info btn-block" type="button">Als Mitarbeiter</button></a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>

<form action="createTerminFahrzeugwahl.jsp" method="post" required>
  <div class="container account-content">
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <h1 style="text-align: center">Termin erstellen</h1>
      </div>
    </div>
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <h6>Startdatum</h6>
        <label for="startDate" class="sr-only">Name</label>
        <input type="date" name="startDate" id="startDate" class="form-control" required >
        <h6>Enddatum</h6>
        <label for="endDate" class="sr-only">Email</label>
        <input type="date" name="endDate" id="endDate" class="form-control" required>
        <!--
        <br>
        <label for="kundenNummer" class="sr-only">kundenNummer</label>
        <input type="int" name="kundenNummer" id="kundenNummer" class="form-control" placeholder="Kunden Nummer (Muss ausgetauscht werden bei der Sessionnutzung) required">
        <br>
        <label for="fahrzeugNummer" class="sr-only">Fahrzeugnummer</label>
        <input list="fahrzeuge" name="fahrzeugNummer" id="fahrzeugNummer" class="form-control" placeholder="Fahrzeug auswählen" required>
        <br>
        -->
        <br>
        <a href="createTermin.jsp"><button value="Submit" class="btn btn-lg btn-primary btn-block" type="submit">Fahrzeuge finden</button></a>
      </div>
    </div>
  </div>
</form>


</body>
</html>