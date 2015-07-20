<%--
  Created by IntelliJ IDEA.
  User: Konrad
  Date: 20.07.2015
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>

<jsp:useBean id="kunde" class="Tables.Kunde" scope="session"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mein Account <%= kunde.getName() %></title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
Hier nur ein Test der Bean<br>
<%= kunde.getName() %> <br>
<%= kunde.getEmail() %> <br>
<%= kunde.getId() %> <br>
<%= kunde.getPasswort() %> <br>

und jetzt kommen die Rechnungen des Kunden mit der ID <%= kunde.getId() %>, aber Testweise ID = 1<br>
<jsp:include page="kundeZuRechnung.jsp" >
  <jsp:param name="id" value="1" />
</jsp:include>
</body>
</html>
