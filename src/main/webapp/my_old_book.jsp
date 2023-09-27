<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Lokendra Kushwah
  Date: 7/28/2023
  Time: 3:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>My Old Books</title>
    <%@include file="components/allCss.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<c:if test="${empty userobj}">
    <c:redirect url="Login.jsp"></c:redirect>
</c:if>
<c:if test="${not empty Msg}">
    <div class="text-center text-success" role="alert">${Msg}</div>
    <c:remove var="Msg" scope="session"></c:remove>
</c:if>
<c:if test="${not empty Failed}">
    <div class="text-center text-danger" role="alert">${Failed}</div>
    <c:remove var="Failed" scope="session"></c:remove>
</c:if>
<h4 class="text-center text-success mt-3"><strong>My Uploaded Old Books</strong></h4>
<div class="container p-4">
    <table class="table table-striped">
        <thead class="bg-primary text-white">
        <tr>
            <th scope="col">Book Name</th>
            <th scope="col">Author</th>
            <th scope="col">Price</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            User u = (User) session.getAttribute("userobj");
            String email = u.getEmail();
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> list = dao.getBookByOld(email, "Old");

            for (BookDtls b : list) {%>
        <tr>
            <td><%=b.getBookName()%>
            </td>
            <td><%=b.getBookAuthor()%>
            </td>
            <td><%=b.getPrice()%>
            </td>
            <td><a href="delete_old_book?em=<%=u.getEmail()%>&&bid=<%=b.getBookId()%>" class="btn btn-danger btn-sm">Remove</a>
            </td>
        </tr>
        <%
            }
        %>


        </tbody>
    </table>
</div>

</body>
</html>
