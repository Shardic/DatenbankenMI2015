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
    <title>Autovermietung_Registrieren</title>
</head>
<body>

<%
String  name,
        email,
        passwort,
        passwort1;
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

  <h1>Registrieren</h1>
  <FORM ACTION="#" METHOD="POST" required>
    Name:
    <BR>
    <INPUT TYPE="TEXT" NAME="name" required>
    <% name = request.getParameter("name");%>
    <BR>
    Email:
    <BR>
    <INPUT TYPE="EMAIL" NAME="email" required>
    <BR>
    Passwor:
    <BR>
    <INPUT TYPE="PASSWORD" NAME="passwort" required>
    <BR>
    Passwor wiederholen:
    <BR>
    <INPUT TYPE="PASSWORD" NAME="passwort1" required>
    <BR>
    <BR>
    <INPUT TYPE="SUBMIT" value="Submit" required>
    <%
      if (request.getParameter("name") != null) {
        name = request.getParameter("name");
        email = request.getParameter("email");
        passwort = request.getParameter("passwort");
        passwort1 = request.getParameter("passwort1");
        if(checkPasswords(passwort, passwort1)){
          createNewKunde(name,email,passwort);
        }else{

        }
      }
    %>
  </FORM>

  <h2></h2>





</body>
</html>
