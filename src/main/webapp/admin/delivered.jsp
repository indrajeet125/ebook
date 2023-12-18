<%@ page import="com.DAO.BookOrderDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.Book_Order" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delivered_item</title>
    <%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>

<c:if test="${empty userobj}">
    <c:redirect url="../Login.jsp"></c:redirect>
</c:if>
<h2 class="text-center text-success">Delivered Items</h2>

<table class="table table-striped">
    <thead class="bg-primary text-white">
    <tr>
        <th scope="col">Order Id</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Address</th>
        <th scope="col">Phone No </th>
        <th scope="col">Book Name</th>
        <th scope="col">Author</th>
        <th scope="col">Price</th>
        <th scope="col">Payment Type</th>

    </tr>
    </thead>
    <tbody>
    <%

        BookOrderDAOImpl dao =new BookOrderDAOImpl(DBConnect.getConn());
        List<Book_Order> blist=dao.getAllDelivered();

        for(Book_Order b:blist){
    %>
    <tr class="table-info">
        <th scope="row"><%=b.getOrderId()%></th>
        <td><%=b.getUsername()%></td>
        <td><%=b.getEmail()%></td>
        <td><%=b.getFullAdd()%></td>
        <td><%=b.getPhno()%></td>
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
<%--<div style="margin-top: 240px">--%>
<%--    <%@include file="footer.jsp"%>--%>
<%--</div>--%>
</body>
</html>
