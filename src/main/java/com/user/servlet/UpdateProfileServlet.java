package com.user.servlet;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int uid=Integer.parseInt(req.getParameter("uid"));
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password");
            String npass=req.getParameter("npass");
            User us=new User();
            us.setUserId(uid);
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);
            UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
            boolean f=dao.checkPassword(uid,password);
            HttpSession session=req.getSession();
            if(f){
               boolean f2 = dao.updateProfile(us,npass);
               if(f2){
                   session.setAttribute("Msg", "Profile Update Successfully");

                   resp.sendRedirect("edit_profile.jsp");


               }else{
                   session.setAttribute("Failed", "Something wrong on server !");

                   resp.sendRedirect("edit_profile.jsp");

               }
            }else{

                session.setAttribute("Failed", "Password Incorrect");

                resp.sendRedirect("edit_profile.jsp");

            }

        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
