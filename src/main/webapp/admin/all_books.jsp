<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>AllBooks</title>
    <%@include file="allCss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty userobj}">
    <c:redirect url="../Login.jsp"></c:redirect>
</c:if>

<h2 class="text-center">All Books Page</h2>
<div class="text-center">
    <c:if test="${not empty Msg}">
        <p style="color: forestgreen"> ${Msg} </p>
        <c:remove var="Msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${not empty Failed}">
        <p style="color: red">${Failed}</p>
        <c:remove var="Failed" scope="session"></c:remove>
    </c:if>
</div>


<table class="table table-striped">
    <thead class="bg-primary text-white">
    <tr>
        <th scope="col">BookId</th>
        <th scope="col">Image</th>
        <th scope="col">Book Name</th>
        <th scope="col">Author</th>
        <th scope="col">Price</th>
        <th scope="col">Book Category</th>
        <th scope="col">Status</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> list = dao.getAllBooks();
        for (BookDtls b : list) {
    %>
    <tr>
        <td><%= b.getBookId() %>
        </td>
        <td><img src="../book/<%= b.getPhotoName() %>" style="width: 60px; height: 70px;"></td>
        <td><%= b.getBookName() %>
        </td>
        <td><%= b.getBookAuthor() %>
        </td>
        <td><%= b.getPrice() %>
        </td>
        <td><%= b.getBookCategory() %>
        </td>
        <td><%= b.getStatus() %>
        </td>
        <td>
            <a href="edit_books.jsp?id=<%=b.getBookId()%>" class="btn btn-small btn-primary">Edit</a>
            <a href="../delete?id=<%=b.getBookId()%>" class="btn btn-small btn-danger">Delete</a>
        </td>

    </tr>


    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
