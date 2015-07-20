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
  int xy;
  int xz;
  int idX, laufleistungX, sitzplaetzeX = 0;
  String nummernschildX, herstellerX = null, fahrzeugtypX = null;
  FahrzeugDAO fDAOX = new FahrzeugDAO();
  FahrzeugmodellDAO fMDAO = new FahrzeugmodellDAO();
  List<Fahrzeug> allFahrzeuge = fDAOX.readAllFahrzeuge();
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
      for(xy=0; xy< allFahrzeuge.size(); xy++){
        idX = allFahrzeuge.get(xy).getFahrzeugNummer();
        laufleistungX = allFahrzeuge.get(xy).getLaufleistung();
        nummernschildX = allFahrzeuge.get(xy).getNummernschild();
        for(xz = 0; xz< allFModelle.size(); xz++) {
          if (allFahrzeuge.get(xy).getFModellNummer() == allFModelle.get(xz).getModellnummer()) {
            herstellerX = allFModelle.get(xz).getHersteller();
            fahrzeugtypX = allFModelle.get(xz).getFahrzeugTyp();
            sitzplaetzeX = allFModelle.get(xz).getAnzahlSitzplaetze();
          }
        }
    %>
    <tbody>
    <tr>
      <td><%= idX%></td>
      <td><%= laufleistungX%></td>
      <td><%= nummernschildX%></td>
      <td><%= herstellerX%></td>
      <td><%= fahrzeugtypX%></td>
      <td><%= sitzplaetzeX%></td>
    </tr>
    </tbody>
    <%}%>
  </table>
</div>