<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<div class="container-fluid" style="height:10px; background-color: indigo; "></div>

<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-3">
            <h3><i class="fas fa-book"></i> Book Store </h3>
        </div>
<%--        <div class="col-md-6">--%>
<%--            <form class="d-flex">--%>
<%--                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--                <button class="btn btn-outline-success" type="submit">Search</button>--%>
<%--            </form>--%>
<%--        </div>--%>
        <div class="col-md-3 offset-md-6">

            <c:if test="${not empty userobj}">
                <a class="btn btn-success mr-2">${userobj.name}</a>
                <a href="../logout" class="btn btn-primary">Logout</a>
            </c:if>
           <c:if test="${empty userobj}">
               <a href="../Login.jsp" class="btn btn-success mr-2">Login</a>
               <a href="../Register.jsp" class="btn btn-primary">Register</a>
           </c:if>


        </div>

    </div>
</div>


<nav class="navbar navbar-expand-lg navbar-light bg-custom">
    <div class="container-fluid ">
<%--        <a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>--%>
         <h3></h3>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link " href="Admin.jsp"><i class="fas fa-home"></i>Home</a>
                </li>
            </ul>
        </div>
    </div>
</nav>