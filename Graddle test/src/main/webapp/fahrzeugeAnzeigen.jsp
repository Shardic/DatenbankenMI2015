<%--
  Created by IntelliJ IDEA.
  User: Fabian
  Date: 20.07.15
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="DataAccessObjects.FahrzeugDAO" %>
<%@ page import="Tables.Fahrzeug" %>
<%@ page import="java.util.List" %>
<%@ page import="DataAccessObjects.FahrzeugmodellDAO" %>
<%@ page import="Tables.Fahrzeugmodell" %>

<%
  int i;
  int j;
  int id, laufleistung, sitzplaetze = 0;
  String nummernschild, hersteller = null, fahrzeugtyp = null;
  FahrzeugDAO fDAO = new FahrzeugDAO();
  FahrzeugmodellDAO fMDAO = new FahrzeugmodellDAO();
  List<Fahrzeug> allFahrzeuge = fDAO.readAllFahrzeuge();
  List<Fahrzeugmodell> allFModelle = fMDAO.readAllFahrzeugmodelle();
%>
<div class="container">
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>Fahrzeugnummer</th>
      <th>Laufleistung</th>
      <th>Nummernschild</th>
      <th>Hersteller</th>
      <th>Fahrzeugtyp</th>
      <th>Sitzplaetze</th>
    </tr>
    </thead>
    <%
      for(i=0; i< allFahrzeuge.size(); i++){
        id = allFahrzeuge.get(i).getFahrzeugNummer();
        laufleistung = allFahrzeuge.get(i).getLaufleistung();
        nummernschild = allFahrzeuge.get(i).getNummernschild();
        for(j = 0; j< allFModelle.size(); j++) {
          if (allFahrzeuge.get(i).getFModellNummer() == allFModelle.get(j).getModellnummer()) {
            hersteller = allFModelle.get(j).getHersteller();
            fahrzeugtyp = allFModelle.get(j).getFahrzeugTyp();
            sitzplaetze = allFModelle.get(j).getAnzahlSitzplaetze();
          }
        }
    %>
    <tbody>
    <tr>
      <td><%= id%></td>
      <td><%= laufleistung%></td>
      <td><%= nummernschild%></td>
      <td><%= hersteller%></td>
      <td><%= fahrzeugtyp%></td>
      <td><%= sitzplaetze%></td>
    </tr>
    </tbody>
    <%}%>
  </table>
</div>