
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<html>
<head>

    <%@include file="components/allCss.jsp" %>
    <title>Ebook-Home</title>
    <style type="text/css">
        .back-img {
            height: 50vh;
            width: 100%;
            background: url("img/back.jpg") no-repeat;
            background-size: cover;
        }
    </style>


</head>
<body style="background-color: thistle">
<%Connection conn= DBConnect.getConn();
    System.out.println(conn);

%>
<%@include file="components/navbar.jsp" %>

<div class="container-fluid back-img">
    <h1 class="text-center text-danger">Online Book Store</h1>
</div>
<%--Start Old Book--%>
<div class="container">
    <h3 class="text-center">All Old Books</h3>
    <div class="row">

        <%
            BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> list= dao.getAllOldBook();
            for(BookDtls b : list){
        %>
        <div class="col-md-3">
            <div class="card">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px; height: 200px;" class="img-thumbnail">
                    <p><%=b.getBookName()%> </p>
                    <p><%=b.getBookAuthor()%> </p>
                    <p>Category:<%=b.getBookCategory()%></p>
                    <div>
                        <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm">Details</a>
                        <a href="" class="btn btn-primary btn-sm"><%=b.getPrice()%></a>
                    </div>
                </div>

            </div>
        </div>

        <%
            }
        %>

    </div>

</div>
<%--End Old Book--%>
<%@include file="components/footer.jsp"%>
</body>
</html>
