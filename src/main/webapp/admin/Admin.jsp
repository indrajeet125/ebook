 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin:page</title>
    <%@include file="allCss.jsp"%>
    <style type="text/css">
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp"%>

<c:if test="${empty userobj}">
    <c:redirect url="../Login.jsp"></c:redirect>
</c:if>

<div class="container">
    <div class="row p-5">
        <div class="col-md-3">
            <a href="Add_Books.jsp">
            <div class="card">
                <div class="card-body text-center">
                    <i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
                    <h4>Add Books</h4>
                    ----------
                </div>
            </div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="all_books.jsp">
            <div class="card">
                <div class="card-body text-center">
                    <i class="fa-solid fa-book-open fa-3x text-success"></i><br>
                    <h4>All Books</h4>
                    ----------
                </div>
            </div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="Orders.jsp">
            <div class="card">
                <div class="card-body text-center">
                    <i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
                    <h4>Orders</h4>
                    ----------
                </div>
            </div>
            </a>
        </div>

        <div class="col-md-3">
             <a href="delivered.jsp">
                 <div class="card">
                     <div class="card-body text-center">
                         <i class="fa-solid fa-list-check fa-3x text-info"></i>
                         <h4>Delivered</h4>
                         ----------
                     </div>
                 </div>
             </a>

        </div>

    </div>

</div>
</body>
</html>
