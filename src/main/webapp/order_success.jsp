
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>order_success</title>
     <%@include file="components/allCss.jsp"%>
</head>
<body style="background-color: pink">
<%@include file="components/navbar.jsp"%>
<div class="container text-center mt-3">
    <i class="fas fa-check-circle fa-5x text-success"></i>
    <h1>Thank You</h1>
    <h2>Your Order Successfully</h2>
    <h5>with in 7 Days Your Order will be Delivered On Your Address</h5>
    <a href="index.jsp" class="btn btn-primary mt-3">Home Page</a>
    <a href="order.jsp" class="btn btn-warning mt-3">View Orders</a>

</div>
</body>
</html>
