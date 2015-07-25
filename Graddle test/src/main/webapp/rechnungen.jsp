<%@ page import="DataAccessObjects.ViewDAO" %>
<%@ page import="java.util.List" %>
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
    <link href="bootstrap/css/mycss.css" rel="stylesheet">
</head>
<body>
<%
    int i;
    int kundennummer, rechnungsnummer, rechnungsbetrag, fahrzeugnummer;
    long tage;
    String nummernschild;
    Date starttag, endtag;

    ViewDAO myviews = new ViewDAO();
    List<Rechnungsansicht> viewListe = null;



    if (loggedKunde.getId() == 0) {
        %>
            <jsp:forward page="index.jsp"/>
        <%
    } else {
        viewListe = myviews.getRechnungsansicht(loggedKunde.getId());
    }




%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="termine.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Meine Termine</button></a></li>
                <li><a href="rechnungen.jsp"><button class="btn btn-lg btn-primary btn-block active" type="button">Meine Rechnungen</button></a></li>
                <li><a href="createTermin.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Fahrzeug buchen</button></a></li>
                <li><a href="updateUser.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Konto bearbeiten</button></a></li>
                <li><a href="ausloggen.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Ausloggen</button></a></li>
                <li><a href="mitarbeiterAnsicht.jsp"><button class="btn btn-lg btn-info btn-block" type="button">Als Mitarbeiter</button></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container account-content">
    <table class="table table-bordered table-hover">
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
            <td><%= nummernschild%></td> <%-- TODO: Hier der Link zu einer Fahrzeugdetailansicht <td><a href="fahrzeugAnsicht.jsp?id=<%=fahrzeugnummer%>"><%= nummernschild%></a></td> --%>
        </tr>
        </tbody>

        <%}%>
    </table>
</div>

</body>
</html>
