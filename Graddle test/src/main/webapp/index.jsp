<%--
  Created by IntelliJ IDEA.
  User: Fabian
  Date: 14.07.15
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="loggedKunde" class="Tables.Kunde" scope="session"/>
<%
if (loggedKunde.getId()!= 0) {
  System.out.println(loggedKunde.getId());
%>
<jsp:forward page="myAccount.jsp"/>
<%
}
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Index</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="bootstrap/css/mycss.css" rel="stylesheet">
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
      </div>
    </div>
  </div>

  </body>
</html>
