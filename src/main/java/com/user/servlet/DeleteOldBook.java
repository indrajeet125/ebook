package com.user.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
        String em=req.getParameter("em");
        int bid=Integer.parseInt(req.getParameter("bid"));
        BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
      boolean f= dao.oldBookDelete(em,"Old",bid);
        HttpSession session= req.getSession();

        if(f){
            session.setAttribute("Msg","Book Removed Successfully");
            resp.sendRedirect("my_old_book.jsp");
        }else{
            session.setAttribute("Failed","Something wrong on server");
            resp.sendRedirect("my_old_book.jsp");
        }

    }catch (Exception e){
        e.printStackTrace();
    }

    }
}
