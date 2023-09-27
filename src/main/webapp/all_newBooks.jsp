<%--
  Created by IntelliJ IDEA.
  User: Lokendra Kushwah
  Date: 11/2/2022
  Time: 11:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>

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
<c:if test="${not empty addCart}">
    <div id="toast">${addCart}</div>

    <script type="text/javascript">
        showToast();
        function showToast(content)
        {
            $('#toast').addClass("display");
            $('#toast').html(content);
            setTimeout(()=>{
                $("#toast").removeClass("display");
            },2000)
        }
    </script>

</c:if>
<%@include file="components/navbar.jsp" %>

<div class="container-fluid back-img">
    <h1 class="text-center text-danger">Online Book Store</h1>
</div>
<%--Start New Book--%>
<div class="container">
    <h3 class="text-center">All New Books</h3>
    <div class="row">

        <%
            User u=(User) session.getAttribute("userobj");

            BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> list= dao.getAllNewBook();
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
                        <%
                            if(u==null){%>
                        <a href="Login.jsp" class="btn btn-success btn-sm"><i class="fas fa-cart-plus"></i>Add Cart</a>
                        <% }else {%>
                        <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getUserId()%>" class="btn btn-success btn-sm"><i class="fas fa-cart-plus"></i>Add Cart</a>

                        <%
                            }
                        %>


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
<%--End New Book--%>
<%@include file="components/footer.jsp"%>
</body>
</html>
