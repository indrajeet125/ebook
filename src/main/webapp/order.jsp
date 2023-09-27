<%@ page import="com.entity.User" %>
<%@ page import="com.DAO.BookOrderDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.Book_Order" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Lokendra Kushwah
  Date: 7/28/2023
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Orders</title>
  <%@include file="components/allCss.jsp"%>
</head>
<body>
<%@include file="components/navbar.jsp"%>
<c:if test="${empty userobj}">
  <c:redirect url="Login.jsp"></c:redirect>
</c:if>
<div class="container">
  <h4 class="text-center text-success mt-3"><strong>Your Orders</strong></h4>
  <div>
    <table class="table mt-4">
      <thead>
      <tr class="table-danger">
        <th scope="col">Order Id</th>
        <th scope="col">Name</th>
        <th scope="col">Book Name</th>
        <th scope="col">Author</th>
        <th scope="col">Price</th>
        <th scope="col">Payment Type</th>
      </tr>
      </thead>
      <tbody>

      <%
      User u=(User) session.getAttribute("userobj");
        BookOrderDAOImpl dao =new BookOrderDAOImpl(DBConnect.getConn());
        List<Book_Order> blist=dao.getBook(u.getEmail());

        for(Book_Order b:blist){
          %>
           <tr class="table-info">
               <th scope="row"><%=b.getOrderId()%></th>
               <td><%=b.getUsername()%></td>
               <td><%=b.getBookName()%></td>
               <td><%=b.getAuthor()%></td>
               <td><%=b.getPrice()%></td>
               <td><%=b.getPaymentType()%></td>
           </tr>
        <%
           }
            %>
      </tbody>
    </table>

  </div>

</div>
</body>
</html>
