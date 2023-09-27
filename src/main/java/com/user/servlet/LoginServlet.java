package com.user.servlet;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
        HttpSession session = req.getSession();
        try {
              String email=req.getParameter("email");
            String password=req.getParameter("password");

            if("lk.kushwah303@gmail.com".equals(email) && "admin".equals(password)){
                User us=new User();
                us.setName("Admin");
                session.setAttribute("userobj",us);
                resp.sendRedirect("admin/Admin.jsp");
            }else{
                User us=dao.login(email,password);
                if(us!=null){
                    session.setAttribute("userobj",us);
                    resp.sendRedirect("index.jsp");
                }else {
                    session.setAttribute("FailedMsg","Invalid Email or Password !");
                    resp.sendRedirect("Login.jsp");

                }
                }

        }
        catch (Exception e){
            e.printStackTrace();

        }
    }
}
