<%@ page import="DataAccessObjects.KundenDAO" %>
<%@ page import="Tables.Kunde" %>

<%--
  Created by IntelliJ IDEA.
  User: oliverbammann
  Date: 20.07.15
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>

<%
  KundenDAO kundenDAO = new KundenDAO();
  String emailEingabe = request.getParameter("email");
  String passwortEingabe = request.getParameter("passwort");
  Kunde kunde;
  if (kundenDAO.isKundeEmailTrue(emailEingabe, passwortEingabe)) {
    kunde = kundenDAO.getKundeByEmail(emailEingabe, passwortEingabe);
  } else {
    kunde = null;
  }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-4 col-md-offset-4">
      <%
      if (kunde==null){
      %>
      <p>Login ist fehlgeschlagen, die Daten sind nicht korrekt.</p>
      <p>Bitte erneut <a href="login.jsp">einloggen</a> oder <a href="registrieren.jsp">registrieren.</a></p>

      <%} else {
      %>
      <jsp:useBean id="loggedKunde" class="Tables.Kunde" scope="session"/>
      <jsp:setProperty name="loggedKunde" property="id" value="<%=kunde.getId()%>"/>
      <jsp:setProperty name="loggedKunde" property="name" value="<%=kunde.getName()%>"/>
      <jsp:setProperty name="loggedKunde" property="email" value="<%=kunde.getEmail()%>"/>
      <jsp:setProperty name="loggedKunde" property="passwort" value="<%=kunde.getPasswort()%>"/>
      <jsp:forward page="myAccount.jsp"/>
      <%}%>
    </div>
  </div>
</div>

</body>
</html>
