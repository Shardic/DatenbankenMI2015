<%@ page import="DataAccessObjects.KundenDAO" %>
<%@ page import="org.hibernate.HibernateException" %>
<%--
  Created by IntelliJ IDEA.
  User: Fabian
  Date: 21.07.15
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%!
  public boolean checkPasswords(String pw1, String pw2){
    if(pw1.equals(pw2)){
      return true;
    }
    return false;
  }

%>

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
    <title>Update Kunde</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
  <link href="bootstrap/css/mycss.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container">
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li><a href="termine.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Meine Termine</button></a></li>
        <li><a href="rechnungen.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Meine Rechnungen</button></a></li>
        <li><a href="createTermin.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Fahrzeug buchen</button></a></li>
        <li><a href="updateUser.jsp"><button class="btn btn-lg btn-primary btn-block active" type="button">Konto bearbeiten</button></a></li>
        <li><a href="ausloggen.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Ausloggen</button></a></li>
        <li><a href="mitarbeiterAnsicht.jsp"><button class="btn btn-lg btn-info btn-block" type="button">Als Mitarbeiter</button></a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>

<form action="#" method="post">
  <div class="container account-content">
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <h1 style="text-align: center">Account ändern</h1>
      </div>
    </div>
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <label><h4>Name ändern:</h4></label>
        <input type="text" name="name" id="inputName" class="form-control" placeholder="Neuer Name">
        <br>
        <label><h4>Passwort ändern:</h4></label>
        <br>
        <input type="text" name="passwort1" id="inputPassword2" class="form-control" placeholder="Neues Passwort">
        <br>
        <input type="text" name="passwort2" id="inputPassword3" class="form-control" placeholder="Neues Passwort wiederholen">
        <br>
        <a href="login.jsp"><button id ="sub" value="Submit" class="btn btn-lg btn-primary btn-block" type="submit">Änderungen übernehmen</button></a>
      </div>
    </div>

    <%
      int userId = loggedKunde.getId();
      KundenDAO kDao = new KundenDAO();
      String newUserName = request.getParameter("name");
      String newUserPasswort = request.getParameter("passwort1");
      String newUserPaswortRepeat = request.getParameter("passwort2");
      boolean hasNameChanged = (request.getParameter("name") != "" && request.getParameter("name") != null) ?  true : false;

      boolean hasPasswortChanged =  (newUserPasswort != "" && newUserPasswort != null)
                                    && (newUserPaswortRepeat != "" && newUserPaswortRepeat != null) ? true : false;

      boolean hasNothingChanged = (newUserPasswort == "") && (newUserName =="")
                                  && (newUserPaswortRepeat == "") ? true : false;

      if(hasNameChanged){
        kDao.updateKundenNamen(userId, newUserName);
        %>
        <script>
          alert("Ihr Name würde erfolgreich geändert");
          window.location.href = "myAccount.jsp";
        </script>
        <%
      }
      if(hasPasswortChanged){
        if(checkPasswords(newUserPasswort, newUserPaswortRepeat)) {
          kDao.updateKundenPasswort(userId, newUserPasswort);
        %>
          <script>
            alert("Ihr Passwort wurde erfogreich geändert");
            window.location.href = "myAccount.jsp";
          </script>
        <%
        }else{
        %>
          <script>
            alert("Die neuen Passwörter stimmen nicht überein");
          </script>
        <%
        }
      }
      if(hasNameChanged && hasPasswortChanged){
          kDao.updateKundenNamen(userId, newUserName);
          kDao.updateKundenPasswort(userId, newUserPasswort);
        %>
        <script>
          alert("Ihr Name und Ihr Passwort wurden erfolgreich geändert");
          window.location.href = "myAccount.jsp";
        </script>
        <%
      }
      if(hasNothingChanged){
      %>
        <script>
          alert("Es wurden keine Änderungen vorgenommen.");
          window.location.href = "myAccount.jsp";
        </script>
      <%
      }
    %>
  </div>
</form>
</body>
</html>
