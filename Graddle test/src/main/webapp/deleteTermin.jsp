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
<%@ page import="Views.Rechnungsansicht" %>
<%--
  Created by IntelliJ IDEA.
  User: Konrad
  Date: 25.07.2015
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
  <title>Termin Löschen</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
<%
  Rechnungsansicht rechnungsansicht = (Rechnungsansicht) session.getAttribute("Object");
 /* System.out.println("fahrzeug:"+rechnungsansicht.getFahrzeugnummer());
  System.out.println("rechnung:"+rechnungsansicht.getRechnungsnummer());
  System.out.println("termin:"+rechnungsansicht.getTerminnummer());*/

  TerminDAO tDao = new TerminDAO();
  RechnungDAO rDAO = new RechnungDAO();
  TerminManagementDAO tmDAO = new TerminManagementDAO();
  tDao.deleteTermin(rechnungsansicht.getTerminnummer());
  rDAO.deletRechnung(rechnungsansicht.getRechnungsnummer());
  //tmDAO.deleteTerminmanagement(rechnungsansicht.getRechnungsnummer(),rechnungsansicht.getFahrzeugnummer() , rechnungsansicht.getTerminnummer());
%>
<script>
  alert("Ihr Termin wurde storniert!");
  window.location.href= "myAccount.jsp";
</script>

</body>
</html>