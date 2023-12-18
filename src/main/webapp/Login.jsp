<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Ebook: Login </title>
    <%@include file="components/allCss.jsp" %>
</head>
<body style="background-color: azure">
<%@include file="components/navbar.jsp" %>
<div class="container p-2">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <form class="row g-3" action="Login" method="post">
                        <h4 class="text-center">Login</h4>

                        <c:if test="${not empty Msg}">
                            <div class="text-center">
                                <p style="color: forestgreen">${Msg}</p>
                            </div>

                            <c:remove var="Msg" scope="session"></c:remove>
                        </c:if>


                        <c:if test="${not empty FailedMsg}">
                            <p style="color: red">${FailedMsg}</p>
                            <c:remove var="FailedMsg" scope="session"></c:remove>
                        </c:if>
                        <div class="col-12">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" id="" required="required" name="email">
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" required="required" name="password">
                        </div>

                        <div class="col-12 text-center">
                            <button type="submit" class="btn btn-primary">Log in</button>

                        </div>
                        <div class="text-center">
                            <a href="Register.jsp">Create Account</a>
                        </div>
                    </form>

                </div>

            </div>
        </div>

    </div>

</div>

</body>

</html>
