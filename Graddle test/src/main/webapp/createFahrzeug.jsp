<%@ page import="DataAccessObjects.FahrzeugDAO" %>
<%@ page import="DataAccessObjects.FahrzeugmodellDAO" %>
<%@ page import="Tables.Fahrzeug" %>
<%@ page import="Tables.Fahrzeugmodell" %>
<%--
  Created by IntelliJ IDEA.
  User: Marco
  Date: 17.07.2015
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<headlle>
    <title>Erstelle Fahrzeug</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</headlle>
<body>
<%
  int laufleistung,
      geschaeftstellennummer,
      modellNummer;
  String  nummernschild;

%>
<%!
  public boolean checkModell(int modellnummer){
    FahrzeugmodellDAO fMDAO = new FahrzeugmodellDAO();
    Fahrzeugmodell vorhanden = fMDAO.getFahrzeugmodell(modellnummer);
    if (vorhanden == null) {
      return false;
    }
    return true;
  }

  public void createNewFahrzeug(int laufleistung, String nummernschild, int geschaeftstellennummer, int modellnummer){
    FahrzeugDAO fDao = new FahrzeugDAO();
    fDao.addFahrzeug(laufleistung, nummernschild, geschaeftstellennummer, modellnummer);
  }

%>

</body>
</html>
