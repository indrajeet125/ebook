package com.user.servlet;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            int bid=Integer.parseInt(req.getParameter("bid"));
            int uid=Integer.parseInt(req.getParameter("uid"));
            BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
            BookDtls b = dao.getBookById(bid);
            Cart c=new Cart();
            c.setBid(bid);
            c.setUserId(uid);
            c.setBookName(b.getBookName());
            c.setAuthor(b.getBookAuthor());
            c.setPrice(b.getPrice());
            c.setTotalPrice(b.getPrice());
            CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConn());
            boolean f=dao2.addCart(c);
            HttpSession session= req.getSession();
            if(f){
                session.setAttribute("addCart","Book Added To Cart");
                resp.sendRedirect("all_newBooks.jsp");

            }else{
                session.setAttribute("addCart","Something on server");
                resp.sendRedirect("all_newBooks.jsp");

            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
