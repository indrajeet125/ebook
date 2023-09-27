<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<div class="container-fluid" style="height:10px; background-color: indigo; "></div>

<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-3">
            <h3><i class="fas fa-book"></i> Book Store </h3>
        </div>
        <div class="col-md-4">
            <form class="d-flex" action="search.jsp" method="post">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="ch">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
        <c:if test="${not empty userobj}">

            <div class="col-md-3 ">
                <a href="checkout.jsp"><i class="fa-solid fa-cart-plus fa-2x"></i></a>
                <a class="btn btn-success"><i class="fa-solid fa-user"></i>${userobj.name}</a>
                <a href="logout" class="btn btn-primary"><i class="fa-solid fa-arrow-right-from-bracket"></i>Logout</a>
            </div>

        </c:if>
        <c:if test="${empty userobj}">
            <div class="col-md-3">
                <a href="Login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i>Login</a>
                <a href="Register.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i>Register</a>
            </div>
        </c:if>


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
                    <a class="nav-link " href="index.jsp"><i class="fas fa-home"></i>Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="all_recentBooks.jsp"><i class="fas fa-book-open"></i>Recent Book</a>

                </li>
                <li class="nav-item">
                    <a class="nav-link" href="all_newBooks.jsp"><i class="fas fa-book-open"></i>new Book</a>

                </li>

                <li class="nav-item">
                    <a class="nav-link" href="all_oldBooks.jsp" tabindex="-1" ><i class="fas fa-book-open"></i>Old Book</a>
                </li>
            </ul>
            <form class="col-md-3">
                <a href="setting.jsp" class="btn btn-light " type="submit"><i class="fas fa-user-cog"></i>Setting</a>
                <button class="btn btn-light " type="submit"><i class="fas fa-id-badge"></i>Contact Us </button>
            </form>
        </div>
    </div>
</nav>