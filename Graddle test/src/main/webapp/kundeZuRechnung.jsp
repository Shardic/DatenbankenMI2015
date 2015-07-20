<%@ page import="DataAccessObjects.ViewDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="Views.KundeZuRechnung" %>
<%@ page import="java.util.Iterator" %>
<%--
  Created by IntelliJ IDEA.
  User: Konrad
--%>
<jsp:useBean id="kunde" class="Tables.Kunde" scope="session"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kundeliste</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
<%
    int i;
    int kundennummer, rechnungsnummer, rechnungsbetrag;
    String kundenname;
    ViewDAO myviews = new ViewDAO();
    List<KundeZuRechnung> viewListe;


    //TODO: Natürlich sollte nicht jeder einfach alle Kundenrechnungen einsehen können, also müsste noch ein Prüfen auf Mitarbeiter (oder ähnlich) stattfinden
    if (request.getParameter("id") == null || request.getParameter("id") == "") {
        viewListe = myviews.getKundeZuRechnungView();
    } else {
        Integer requestId = Integer.parseInt(request.getParameter("id"));
        //TODO: prüft, ob die Kunden Id auch tatsächlich die request Id ist, aber für testzwecke weglassen
        //if (kunde.getId() == requestId) {
            viewListe = myviews.getKundeZuRechnungView(requestId);
        //}
    }


%>

<div class="container">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>KundenID</th>
            <th>Name</th>
            <th>RechnungsID</th>
            <th>Betrag</th>
        </tr>
        </thead>


        <%

            for (Iterator iterator = viewListe.iterator(); iterator.hasNext(); ) {
                KundeZuRechnung iter = (KundeZuRechnung) iterator.next();
                kundennummer = iter.getKundennummer();
                rechnungsnummer = iter.getRechnungsnummer();
                rechnungsbetrag = iter.getRechnungsbetrag();
                kundenname = iter.getName();


        %>

        <tbody>
        <tr>
            <td><%= kundennummer%>
            </td>
            <td><%= kundenname%>
            </td>
            <td><%= rechnungsnummer%>
            </td>
            <td><%= rechnungsbetrag%>
            </td>
        </tr>
        </tbody>

        <%}%>
    </table>
</div>

</body>
</html>
