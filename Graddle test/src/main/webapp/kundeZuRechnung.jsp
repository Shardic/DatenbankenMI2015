<%@ page import="DataAccessObjects.ViewDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="Views.KundeZuRechnung" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="Views.Rechnungsansicht" %>
<%@ page import="java.util.Date" %>
<%@ page import="utils.TageRechner" %>
<%--
  Created by IntelliJ IDEA.
  User: Konrad
--%>
<jsp:useBean id="loggedKunde" class="Tables.Kunde" scope="session"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Meine Rechnungen</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
<%
    int i;
    int kundennummer, rechnungsnummer, rechnungsbetrag, fahrzeugnummer;
    long tage;
    String nummernschild;
    Date starttag, endtag;

    ViewDAO myviews = new ViewDAO();
    List<Rechnungsansicht> viewListe;


    //TODO: Natürlich sollte nicht jeder einfach alle Kundenrechnungen einsehen können, also müsste noch ein Prüfen auf Mitarbeiter (oder ähnlich) stattfinden
    if (request.getParameter("id") == null || request.getParameter("id") == "") {
        viewListe = myviews.getRechnungsansicht();
    } else {
        Integer requestId = Integer.parseInt(request.getParameter("id"));
        //TODO: prüft, ob die Kunden Id auch tatsächlich die request Id ist, aber für testzwecke weglassen
        //if (loggedKunde.getId() == requestId) {
            viewListe = myviews.getRechnungsansicht(requestId);
        //}
    }


%>

<div class="container">
    <table class="table table-bordered">
        <thead>
        <tr>

            <th>Rechnungsnummer</th>
            <th>Starttag</th>
            <th>Endtag</th>
            <th>Anzahl Tage</th>
            <th>Betrag</th>
            <th>Nummernschild</th>
        </tr>
        </thead>


        <%

            for (Iterator iterator = viewListe.iterator(); iterator.hasNext(); ) {
                Rechnungsansicht iter = (Rechnungsansicht) iterator.next();
                kundennummer = iter.getRkundennummer();
                rechnungsnummer = iter.getRechnungsnummer();
                rechnungsbetrag = iter.getRechnungsbetrag();
                nummernschild = iter.getNummernschild();
                fahrzeugnummer = iter.getFahrzeugnummer();
                starttag = iter.getStarttag();
                endtag = iter.getEndtag();
                tage = TageRechner.getAnzahlTage(starttag, endtag);
        %>

        <tbody>
        <tr>

            <td><%= rechnungsnummer%></td>
            <td><%= starttag%></td>
            <td><%= endtag%></td>
            <td><%= tage%></td>
            <td><%= rechnungsbetrag%></td>
            <td><%= nummernschild%></a></td> <%-- TODO: Hier der Link zu einer Fahrzeugdetailansicht <td><a href="fahrzeugAnsicht.jsp?id=<%=fahrzeugnummer%>"><%= nummernschild%></a></td> --%>
        </tr>
        </tbody>

        <%}%>
    </table>
</div>

</body>
</html>
