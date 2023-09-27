<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <title>Ebook:Registration</title>


</head>

<body style="background-color: gainsboro">

<%@include file="components/allCss.jsp" %>
<%@include file="components/navbar.jsp" %>
<div class="container p-2">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <form autocomplete="off" class="row g-3" action="register" method="post">
                            <h4 class="text-center">Registration Form</h4>
                             <c:if test="${not empty succMsg}">
                                 <p class="text-success text-center"> ${succMsg} </p>
                                 <c:remove var="succMsg" scope="session"></c:remove>
                             </c:if>
                            <c:if test="${not empty failedMsg}">
                                <p class="text-danger text-center">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"></c:remove>
                            </c:if>

                            <div class="col-12">
                                <label class="form-label">Full Name</label>
                                <input type="text" class="form-control" id="inputName" required="required" name="fname">
                            </div>
                            <div class="col-12">
                                <label  class="form-label">Email</label>
                                <input autocomplete="false" type="email" class="form-control" required="required"
                                       name="email" >
                            </div>
                            <div class="col-md-12">
                                <label class="form-label">Password</label>
                                <input type="password" autocomplete="false"  class="form-control"  required="required"
                                       name="password">
                            </div>
                            <div class="col-md-12">
                                <label for="mobile" class="form-label">Phone Number</label>
                                <input type="text" class="form-control" id="mobile" required="required" name="phno">
                            </div>


                            <div class="col-12">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="gridCheck" name="check">
                                    <label class="form-check-label" for="gridCheck">
                                        Agree Term & Conditions
                                    </label>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <button type="submit" class="btn btn-primary">Register</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>

        </div>

    </div>
</div>
<%@include file="components/footer.jsp" %>
</body>
</html>
