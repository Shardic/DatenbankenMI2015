package Servlet;

import DataAccessObjects.KundenDAO;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Fabian on 17.07.15.
 */


public class RegistrierenServlet extends HttpServlet {

    private String  name,
                    email,
                    passwort;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Preprocess request: we actually don't need to do any business stuff, so just display JSP.
        request.getRequestDispatcher("/webapp/WEB-INF/registrieren.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        if(request.getParameter("name")!= null &&
                request.getParameter("email")!= null &&
                    request.getParameter("passwort")!= null &&
                        request.getParameter("passwort1")!= null){
                if(checkPasswords(request.getParameter("passwort"),request.getParameter("passwort1") )){
                    this.name = request.getParameter("name");
                    this.email = request.getParameter("email");
                    this.passwort = request.getParameter("passwort");
                    createNewKunde(name,email,passwort);
                }else{
                    System.out.println("RegisterServlet: Passwörter stimmen nicht überein");
                }
        }else{
            System.out.println("RegisterServlet: nicht alle Input Fields ausgefüllt");
        }
    }

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
}
