<%--
  Created by IntelliJ IDEA.
  User: oliverbammann
  Date: 15.07.15
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-4 col-md-offset-4">
      <h1 style="text-align: center">Login</h1>
    </div>
  </div>
  <div class="row">
    <div class="col-md-4 col-md-offset-4">
    <form role="form" method="post" action="">
      <label for="inputEmail" class="sr-only">Email</label>
      <input type="email" id="inputEmail" class="form-control" placeholder="Email" required autofocus>
      <br>
      <label for="inputPassword" class="sr-only">Passwort</label>
      <input type="password" id="inputPassword" class="form-control" placeholder="Passwort" required>
      <br>
      <a href="login.jsp"><button class="btn btn-lg btn-primary btn-block" type="submit">Einloggen</button></a>
      <br>
      <a href="registrieren.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Noch nicht registriert?</button></a>
    </form>
    </div>
  </div>
</div>
</body>
</html>
