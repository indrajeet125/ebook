package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/order_action")
public class OrderAction extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String did=null;
            String cid=null;
            did=req.getParameter("did");
            cid=req.getParameter("cid");
//            System.out.println("did="+did+"cid="+cid);
            BookDAOImpl dao =new BookDAOImpl(DBConnect.getConn());

            if(did!=null){

                boolean f= dao.deliveredOrder(did);
                HttpSession session=req.getSession();

                if(f){
                    session.setAttribute("Msg","Order Delivered Successfully..");
                    resp.sendRedirect("admin/Orders.jsp");
                }else{
                    session.setAttribute("Failed","Something went wrong !");
                    resp.sendRedirect("admin/Orders.jsp");
                }
            }
            if(cid!=null){

                boolean f = dao.canceledOrder(cid);
                HttpSession session=req.getSession();
                System.out.println(f);
                if(f){
                    session.setAttribute("Msg2","Order Removed Successfully..");
                    resp.sendRedirect("admin/Orders.jsp");
                }else{
                    session.setAttribute("Failed","Something went wrong !");
                    resp.sendRedirect("admin/Orders.jsp");
                }
            }


        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
