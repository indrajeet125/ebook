package com.user.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bookName=req.getParameter("bname");
            String author=req.getParameter("author");
            double price=Double.parseDouble(req.getParameter("price"));
            String categories="Old";
            String status="Active";
            String userEmail=req.getParameter("user");
            Part part=req.getPart("bimg");
            String fileName=part.getSubmittedFileName();

            BookDtls b=new BookDtls(bookName,author,price,categories,status,fileName,userEmail);

            BookDAOImpl dao =new BookDAOImpl(DBConnect.getConn());

            String path= getServletContext().getRealPath("")+"book";
            File file=new File(path);
            part.write(path+File.separator+fileName);

            boolean f=dao.addBooks(b);
            HttpSession session=req.getSession();

            if(f){
                session.setAttribute("Msg","Book Add Successfully");
                resp.sendRedirect("sell_book.jsp");


            }else{
                session.setAttribute("FailedMsg","Something went wrong");
                resp.sendRedirect("sell_book.jsp");
            }


        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
