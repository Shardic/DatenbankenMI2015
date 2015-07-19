<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: Marco
  Date: 17.07.2015
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Erstelle Termin</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>



<%
  Date start, end;
  String  name,
          email,
          passwort,
          passwort1;

%>
<%!

  public boolean checkPasswords(String pw1, String pw2){
    return true;
  }

  public void createNewTermin(Date start, Date end, int kundennummer, int fahrzeugnummer){

  }
%>

<form action="#" method="post" required>
  <div class="container">
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <h1 style="text-align: center">Termin erstellen</h1>
      </div>
    </div>
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <h6>Startdatum</h6>
        <label for="inputStart" class="sr-only">Name</label>
        <input type="date" name="startDate" id="inputStart" class="form-control" required>
        <h6>Enddatum</h6>
        <label for="inputEnd" class="sr-only">Email</label>
        <input type="date" name="startDate" id="inputEnd" class="form-control" required>
        <br>
        <label for="kundenNummer" class="sr-only">kundenNummer</label>
        <input type="int" name="kundenNummer" id="kundenNummer" class="form-control" placeholder="Kunden Nummer (Muss ausgetauscht werden bei der Sessionnutzung) required">
        <br>
        <label for="fahrzeugNummer" class="sr-only">Fahrzeugnummer</label>
        <input list="fahrzeuge" name="fahrzeugNummer" id="fahrzeugNummer" class="form-control" placeholder="Fahrzeug auswählen" required>
        <br>
        <a href="createTermin.jsp"><button value="Submit" class="btn btn-lg btn-primary btn-block" type="submit">Termin erstellen</button></a>
        <datalist id = fahrzeuge>
          <option value = 1>
        </datalist>
      </div>
    </div>
  </div>

  <%

    if (request.getParameter("name") != null) {
      name = request.getParameter("name");
      email = request.getParameter("email");
      passwort = request.getParameter("passwort");
      passwort1 = request.getParameter("passwort1");
      if(checkPasswords(passwort, passwort1)){
       // createNewTermin();
      }else{
        out.print("Fail");
  %>
  <script>
    alert("Die Passwörter stimmen nicht überein");
  </script>
  <%
      }
    }
  %>
</form>
<div class="container">
  <a href="fahrzeugList.jsp" target="_blank"><button class="btn btn-lg btn-primary btn-block">Fahrzeuge Anzeigen</button></a>
</div>
</body>
</html>
