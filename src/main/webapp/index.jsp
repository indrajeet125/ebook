
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

<%
    User u=(User) session.getAttribute("userobj");

%>
<%@include file="components/navbar.jsp" %>

<div class="container-fluid back-img">
    <h1 class="text-center text-danger">Online Book Store</h1>
</div>
<%--Start Recent Book--%>
<div class="container">
    <h3 class="text-center">Recent Books</h3>
    <div class="row">

        <%
            BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> list= dao.getRecentBook();
            for(BookDtls b : list){
        %>
        <div class="col-md-3">
            <div class="card">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px; height: 200px;" class="img-thumbnail">
                    <p><%=b.getBookName()%> </p>
                    <p><%=b.getBookAuthor()%> </p>
                    <p>Category:<%=b.getBookCategory()%></p>
                    <%
                     if(b.getBookCategory().equals("Old")){%>
                    <div>
                        <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm">Details</a>
                        <a href="" class="btn btn-primary btn-sm"><%=b.getPrice()%></a>
                    </div>


                    <%
                       }else{%>

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

                       <%
                            }
                             %>
                </div>

            </div>
        </div>

        <%
            }
        %>

    </div>
    <div class="text-center mt-2">
        <a href="all_recentBooks.jsp" class="btn btn-danger">View All</a>
    </div>
</div>
<%--End Recent Book--%>
<hr>
<%--Start New Book--%>
<div class="container">
    <h3 class="text-center">New Books</h3>
    <div class="row">

            <%
                BookDAOImpl dao1=new BookDAOImpl(DBConnect.getConn());
               List<BookDtls> list1= dao1.getNewBook();
               for(BookDtls b : list1){
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
    <div class="text-center mt-2">
        <a href="all_newBooks.jsp" class="btn btn-danger">View All</a>
    </div>
</div>
<%--End New Book--%>
<hr>
<%--Start Old Book--%>
<div class="container">
    <h3 class="text-center">Old Books</h3>
    <div class="row">

        <%
            BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> list2= dao2.getOldBook();
            for(BookDtls b : list2){
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
    <div class="text-center mt-2">
        <a href="all_oldBooks.jsp" class="btn btn-danger">View All</a>
    </div>
</div>
<%--End Old Book--%>
<%@include file="components/footer.jsp"%>
</body>
</html>
