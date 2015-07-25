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
  <link href="bootstrap/css/mycss.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container">
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li><a href="termine.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Meine Termine</button></a></li>
        <li><a href="rechnungen.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Meine Rechnungen</button></a></li>
        <li><a href="createTermin.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Fahrzeug buchen</button></a></li>
        <li><a href="updateUser.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Konto bearbeiten</button></a></li>
        <li><a href="ausloggen.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Ausloggen</button></a></li>
        <li><a href="mitarbeiterAnsicht.jsp"><button class="btn btn-lg btn-info btn-block" type="button">Als Mitarbeiter</button></a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>

<div class="container account-content">
  <h1 class="text-center text-info">Willkommen in deinem Kundenkonto, <%=loggedKunde.getName()%>.</h1>
  <br>
  <h3>Hier siehst Du unsere Fahrzeuge:</h3>
  <br>
  <jsp:include page="fahrzeugList.jsp"/>
</div>

</body>
</html>
