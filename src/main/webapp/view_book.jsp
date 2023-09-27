<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Lokendra Kushwah
  Date: 7/25/2023
  Time: 1:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Book_Details </title>
  <%@include file="components/allCss.jsp" %>
</head>
<body style="background-color: antiquewhite">
<%@include file="components/navbar.jsp"%>
 <%
     User u=(User) session.getAttribute("userobj");
    int bid=Integer.parseInt(request.getParameter("bid"));
   BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
   BookDtls b = dao.getBookById(bid);
 %>
<div class="container p-3">
  <div class="row" >
    <div class="col-md-6 p-5 text-center border bg-white">
      <img src="book/<%=b.getPhotoName()%>" style="" height="150px" width="100px">
      <h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookName()%></span></h4>
      <h4>Author: <span class="text-success"><%=b.getBookAuthor()%></span></h4>
      <h4>Category: <span class="text-success"><%=b.getBookCategory()%></span></h4>
    </div>

    <div class="col-md-6 p-5 text-center border">
      <h2><%=b.getBookName()%></h2>
      <%
         if(b.getBookCategory().equals("Old")){%>
         <h5 class="text-primary">Contact To Seller</h5>
        <h5 class="text-primary"><i class="fa-regular fa-envelope"></i> Email: <%=b.getEmail()%></h5>
       <%
         }
          %>
      <div class="row">
        <div class="col-md-4 text-danger text-center p-2">
          <i class="fa-solid fa-money-bill-transfer fa-2x"></i>
          <p> Cash On Delivery</p>
        </div>
        <div class="col-md-4 text-danger text-center p-2">
          <i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
          <p>Return Available</p>
        </div>
        <div class="col-md-4 text-danger text-center p-2">
          <i class="fa-solid fa-truck fa-2x"></i>
          <p>Free Shipping</p>
        </div>

      </div>
    <div>
      <%
        if(b.getBookCategory().equals("Old")){%>
      <a href="all_oldBooks.jsp" class="btn btn-primary "><i class="fa-brands fa-shopify"></i>Continue Shopping</a>
      <a href="" class="btn btn-primary  "><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
       <% }else{
          %>

        <%
            if(u==null){%>
        <a href="Login.jsp" class="btn btn-success btn-sm"><i class="fas fa-cart-plus"></i>Add Cart</a>
        <% }else {%>
        <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getUserId()%>" class="btn btn-success btn-sm"><i class="fas fa-cart-plus"></i>Add Cart</a>

        <%
            }
        %>

      <a href="" class="btn btn-primary  "><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
       <%}

          %>

    </div>
    </div>

  </div>

</div>

</body>
</html>
