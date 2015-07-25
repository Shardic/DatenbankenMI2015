<%--
  Created by IntelliJ IDEA.
  User: Marco
  Date: 25.07.2015
  Time: 11:37
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
    <title>Mitarbeiter Ansicht</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="bootstrap/css/mycss.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="kundenList.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Kundenliste</button></a></li>
                <li><a href="termineList.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Alle Termine</button></a></li>
                <li><a href="fahrzeugListMitarbeiter.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Alle Fahrzeuge</button></a></li>
                <li><a href="ausloggen.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Ausloggen</button></a></li>
                <li><a href="myAccount.jsp"><button class="btn btn-lg btn-info btn-block" type="button">Als Kunde</button></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container account-content">
    <h1 class="text-center text-info">Willkommen in deinem Mitarbeiterkonto, <%=loggedKunde.getName()%>.</h1>
</div>

</body>
</html>
