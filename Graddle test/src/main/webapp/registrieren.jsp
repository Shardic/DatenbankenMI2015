<%@ page import="DataAccessObjects.KundenDAO" %>
<%@ page import="java.net.PasswordAuthentication" %>
<%--
  Created by IntelliJ IDEA.
  User: Fabian
  Date: 16.07.15
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrieren</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="bootstrap/css/mycss.css" rel="stylesheet">
</head>
<body>

<%

String  name = null,
        email = null,
        passwort = null,
        passwort1 = null;
%>
<%!

  public boolean checkPasswords(String pw1, String pw2){
    if(pw1.equals(pw2)){
      return true;
    }
    return false;
  }

  public void createNewKunde(String name, String email, String passwort){
    KundenDAO kDao = new KundenDAO();
    kDao.addKunde(name,email,passwort);
  }

%>

  <form action="#" method="post">
    <div class="container">
      <div class="row">
        <div class="col-md-4 col-md-offset-4">
          <h1 style="text-align: center">Registrieren</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <label for="inputName" class="sr-only">Name</label>
            <input type="text" name="name" id="inputName" class="form-control" placeholder="Name" required autofocus>
            <br>
            <label for="inputEmail" class="sr-only">Email</label>
            <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email" required>
            <br>
            <label for="inputPassword" class="sr-only">Passwort</label>
            <input type="password" name="passwort" id="inputPassword" class="form-control" placeholder="Passwort" required>
            <br>
            <label for="inputPassword2" class="sr-only">Passwort wiederholen</label>
            <input type="password" name="passwort1" id="inputPassword2" class="form-control" placeholder="Passwort wiederholen" required>
            <br>
            <a href="#"><button id ="sub" value="Submit" class="btn btn-lg btn-primary btn-block" type="submit">Registrieren</button></a>
            <br>
            <a href="registrieren.jsp"><button class="btn btn-lg btn-primary btn-block" type="submit">Bereits registriert?</button></a>
        </div>
      </div>
    </div>
      <%
  boolean areAllFieldsFilledIn = (request.getParameter("name") != null) && (request.getParameter("email") != null) && (request.getParameter("passwort") != null) && (request.getParameter("passwort1") != null) ? true : false;
      if (areAllFieldsFilledIn) {
          name = request.getParameter("name");
          email = request.getParameter("email");
          passwort = request.getParameter("passwort");
          passwort1 = request.getParameter("passwort1");
              if(checkPasswords(passwort, passwort1)){
                      createNewKunde(name,email,passwort);
              %>
                  <script>
                      alert("Sie wurden erfolgreich registriert.");
                      window.location.href = "login.jsp";
                  </script>
              <%
              }else{
              %>
              <script>
                  alert("Die Passwörter stimmen nicht überein");
              </script>
              <%
              }
      }


      %>

  </form>

</body>
</html>
