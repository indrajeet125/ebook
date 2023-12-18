
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Edit Profile</title>
    <%@include file="components/allCss.jsp"%>
</head>
<body style="background-color: azure">
<%@include file="components/navbar.jsp"%>
<c:if test="${empty userobj}">
    <c:redirect url="Login.jsp"></c:redirect>
</c:if>
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center text-success p-1">Edit Profile</h4>

                    <c:if test="${not empty Msg}">
                        <div class="text-center">
                            <p style="color: forestgreen">${Msg}</p>
                        </div>

                        <c:remove var="Msg" scope="session"></c:remove>
                    </c:if>

                    <c:if test="${not empty Failed}">
                        <div class="text-center">
                            <p style="color: red">${Failed}</p>
                        </div>

                        <c:remove var="Failed" scope="session"></c:remove>
                    </c:if>


                    <form action="update_profile" method="get" enctype="multipart/form-data">
                         <input type="hidden" value="${userobj.userId}" name="uid">
                        <div class="form-group p-2">
                            <label for="exampleInputEmail1">Full Name</label>
                            <input name="fname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" value="${userobj.name}">
                        </div>

                        <div class="form-group p-2">
                            <label for="exampleInputEmail1">Email</label>
                            <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" value="${userobj.email}">
                        </div>

                        <div class="form-group p-2">
                            <label for="exampleInputPassword1">Phone Number</label>
                            <input name="phno" type="number" class="form-control" id="exampleInputPassword1" required="required" value="${userobj.phno}">
                        </div>


                        <div class="form-group p-2">
                            <label for="exampleInputEmail1">Old Password</label>
                            <input name="password" type="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                        </div>

                        <div class="form-group p-2">
                            <label for="exampleInputEmail1">New Password</label>
                            <input name="npass" type="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
                        </div>

                        <button type="submit" class="btn btn-primary">Update</button>

                    </form>

                </div>
            </div>

        </div>

    </div>

</div>


</body>
</html>
