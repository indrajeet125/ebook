package com.admin.servlet;

import com.DAO.BookDAO;
import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
@WebServlet("/Add_Books")
@MultipartConfig
public class BooksAdd extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         try {
             String bookName=req.getParameter("bname");
             String author=req.getParameter("author");
             double price=Double.parseDouble(req.getParameter("price"));
             String categories=req.getParameter("categories");
             String status=req.getParameter("status");
             Part part=req.getPart("bimg");
             String fileName=part.getSubmittedFileName();

             BookDtls b=new BookDtls(bookName,author,price,categories,status,fileName,"admin");

             BookDAOImpl dao =new BookDAOImpl(DBConnect.getConn());

             String path= getServletContext().getRealPath("")+"book";
             File file=new File(path);
             part.write(path+File.separator+fileName);

             boolean f=dao.addBooks(b);
             HttpSession session=req.getSession();

             if(f){
                 session.setAttribute("Msg","Book Add Successfully");
                 resp.sendRedirect("admin/Add_Books.jsp");
                 System.out.println(b);

             }else{
                 session.setAttribute("FailedMsg","Something went wrong");
                 resp.sendRedirect("admin/Add_Books.jsp");
             }
             System.out.println(f);

         }catch (Exception e){
             e.printStackTrace();
         }
    }
}
