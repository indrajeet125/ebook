package com.user.servlet;

import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            HttpSession session=req.getSession();
            String name=req.getParameter("username");
            String email=req.getParameter("email");

            int uid=Integer.parseInt(req.getParameter("uid"));
            String phno=req.getParameter("phno");
            String address=req.getParameter("address");
            String landmark=req.getParameter("landmark");
            String city=req.getParameter("city");
            String state=req.getParameter("state");
            String pincode=req.getParameter("pincode");
            String paymentType=req.getParameter("paymentType");

            String fullAdd=address+" "+ landmark +" "+ city +" "+ state +" "+ pincode;

            CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
            List<Cart> blist=dao.getBookByUser(uid);
            if(blist.isEmpty()){
                session.setAttribute("Failed","Your Cart Is Empty !");
                resp.sendRedirect("checkout.jsp");
            }else{
                BookOrderDAOImpl dao2=new BookOrderDAOImpl(DBConnect.getConn());
                Book_Order o;

                Random random = new Random();
                int i = random.nextInt(1000);
                int j = random.nextInt(1000);

                ArrayList<Book_Order> orderList=new ArrayList<>();
                for(Cart c:blist){
                    i++;
                    o=new Book_Order();
                    o.setOrderId(j+"-ORD-0"+i);
                    o.setUsername(name);
                    o.setEmail(email);
                    o.setPhno(phno);
                    o.setFullAdd(fullAdd);
                    o.setBookName(c.getBookName());
                    o.setAuthor(c.getAuthor());
                    o.setPrice(c.getPrice());
                    o.setPaymentType(paymentType);
                    orderList.add(o);
                   j++;

                }
                if("noselect".equals(paymentType)){
                    session.setAttribute("Failed","Plz Choose Payment Method !");
                    resp.sendRedirect("checkout.jsp");
                }else{
                    boolean f = dao2.saveOrder(orderList);
                    if(f){
                        resp.sendRedirect("order_success.jsp");
                        System.out.println("Order Success");
                    }else {
                        session.setAttribute("Failed","Something went wrong !");
                        resp.sendRedirect("checkout.jsp");
                        System.out.println("order failed");
                    }
                }

            }

        }catch (Exception e){
            e.printStackTrace();

        }
    }
}
