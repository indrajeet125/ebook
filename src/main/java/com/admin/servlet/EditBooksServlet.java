package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/edit_books")
public class EditBooksServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

         try {
             int id=Integer.parseInt((req.getParameter("id")));
             String bookName=req.getParameter("bname");
             String author=req.getParameter("author");
             double price=Double.parseDouble(req.getParameter("price"));
             String status=req.getParameter("status");
             BookDtls b=new BookDtls();
             b.setBookId(id);
             b.setBookName(bookName);
             b.setBookAuthor(author);
             b.setPrice(price);
             b.setStatus(status);

             BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());

             boolean f= dao.updateEditBooks(b);
             HttpSession session=req.getSession();

             if(f){
                 session.setAttribute("Msg","Book Update Successfully..");
                 resp.sendRedirect("admin/all_books.jsp");
             }else{
                 session.setAttribute("Failed","Something went wrong !");
                 resp.sendRedirect("admin/all_books.jsp");
             }

         }catch (Exception e){
             e.printStackTrace();
         }
    }
}
