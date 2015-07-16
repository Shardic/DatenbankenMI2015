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
<form name="login" method="post">
<input type="hidden" name="pagename" value="login"/>
  <table>
    <tr>
      <td>Username</td>
      <td><input type="text" name="userName"/></td>
    </tr>
    <tr>
      <td>Password</td>
      <td><input type="password" name="password"/></td>
    </tr>
    <tr>
      <td><Button type="submit">Login</Button></td>
      <td><label></label></td>
    </tr>
  </table>
</form>
</body>
</html>
