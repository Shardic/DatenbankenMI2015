<%--
  Created by IntelliJ IDEA.
  User: Fabian
  Date: 14.07.15
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Index</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
  </head>
  <body>
  <div class="container">
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <h1 style="text-align: center">Autovermietung</h1>
      </div>
      <div class="col-md-4 col-md-offset-2" style="padding-top: 5%">
        <img src="Images/mainPageCars.jpg">
      </div>
    </div>
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <br>
        <a href="login.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Login</button></a>
        <br>
        <a href="registrieren.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Registrieren</button></a>
        <br>
        <a href="fahrzeugList.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Fahrzeuge anzeigen</button></a>
        <br>
        <a href="kundenList.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Kunden anzeigen</button></a>
        <br>
        <a href="kundeZuRechnung.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">View: Kunde zu Rechnung</button></a>
        <br>
        <a href="arbeitsort.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">View: Arbeitsort</button></a>
        <br>
        <a href="rechnungProTermin.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">View: Rechnung pro Termin</button></a>
        <br>
        <a href="terminFahrzeug.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">View: Terminfahrzeug</button></a>
        <br>
        <a href="terminZuKunde.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">View: Termin zu Kunde</button></a>
      </div>
    </div>
  </div>

  </body>
</html>
