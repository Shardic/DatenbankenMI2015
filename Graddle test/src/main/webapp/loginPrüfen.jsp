<%@ page import="DataAccessObjects.KundenDAO" %>
<%@ page import="Tables.Kunde" %>

<%--
  Created by IntelliJ IDEA.
  User: oliverbammann
  Date: 20.07.15
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
<%
  KundenDAO kundenDAO = new KundenDAO();
  String emailEingabe = request.getParameter("email");
  String passwortEingabe = request.getParameter("passwort");
  Kunde kunde;
  if (kundenDAO.isKundeEmailTrue(emailEingabe, passwortEingabe)) {
    out.println("true");
    kunde = kundenDAO.getKundeByEmail(emailEingabe, passwortEingabe);
  } else {
    kunde = null;
  }
%>
<div class="container">
  <div class="row">
    <div class="col-md-4 col-md-offset-4">
      <%
      if (kunde==null){
      %>
      <p>Login ist fehlgeschlagen, die Daten sind nicht korrekt.</p>
      <p>Bitte erneut <a href="login.jsp">einloggen</a> oder <a href="registrieren.jsp">registrieren.</a></p>

      <%} else {
      out.println(kunde.getId());
      %>

      <%}%>
    </div>
  </div>
</div>

</body>
</html>
