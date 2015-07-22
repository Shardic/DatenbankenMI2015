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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Erstelle Termin</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>

<form action="createTerminFahrzeugwahl.jsp" method="post" required>
  <div class="container">
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <h1 style="text-align: center">Termin erstellen</h1>
      </div>
    </div>
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <h6>Startdatum</h6>
        <label for="inputStart" class="sr-only">Name</label>
        <input type="date" name="startDate" id="inputStart" class="form-control" required >
        <h6>Enddatum</h6>
        <label for="inputEnd" class="sr-only">Email</label>
        <input type="date" name="endDate" id="inputEnd" class="form-control" required>
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
        <a href="createTermin.jsp"><button value="Submit" class="btn btn-lg btn-primary btn-block" type="submit">Fahrzeuge Finden</button></a>
      </div>
    </div>
  </div>
</form>


</body>
</html>