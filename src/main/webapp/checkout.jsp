<%@ page import="com.DAO.CartDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.entity.Cart" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>MyCart</title>
    <%@include file="components/allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="components/navbar.jsp" %>
<c:if test="${empty userobj}">
    <c:redirect url="Login.jsp"></c:redirect>
</c:if>

<c:if test="${not empty Msg}">
    <div class="text-primary text-center" role="alert">${Msg}</div>
    <c:remove var="Msg" scope="session"></c:remove>
</c:if>
<c:if test="${not empty Failed}">
    <div class="text-center text-danger" role="alert">${Failed}</div>
    <c:remove var="Failed" scope="session"></c:remove>
</c:if>


<div class="container">
    <div class="row p-2">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center text-success">Your Selected Item</h3>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Book Name</th>
                            <th scope="col">Author</th>
                            <th scope="col">Price</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            User u = (User) session.getAttribute("userobj");
                            CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
                            List<Cart> cart = dao.getBookByUser(u.getUserId());
                            Double totalPrice = 0.0;
                            for (Cart c : cart) {
                                totalPrice = c.getTotalPrice();
                        %>
                        <tr>
                            <th scope="row"><%=c.getBookName()%>
                            </th>
                            <td colspan="2"><%=c.getAuthor()%>
                            </td>
                            <td><%=c.getPrice()%>
                            </td>
                            <td><a href="remove_book?uid=<%=c.getUserId()%>&&bid=<%=c.getBid()%>&&cid=<%=c.getCid()%>"
                                   class="btn btn-danger btn-sm">Remove</a></td>

                        </tr>

                        <%
                            }
                        %>
                        <tr class="table-success">
                            <td>Total Price</td>
                            <td></td>
                            <td></td>
                            <td><%=totalPrice%>
                            </td>
                            <td></td>
                        </tr>


                        </tbody>
                    </table>
                </div>

            </div>

        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center text-success">Your Details For Order</h3>
                    <form action="order" method="post">
                        <input type="hidden" name="uid" value="${userobj.userId}">
                        <div class="row">
                            <div class="col-md-6 ">
                                <label for="inputEmail4" class="form-label">Name</label>
                                <input type="text" name="username" class="form-control" id="inputEmail4"
                                       value="<%=u.getName()%>" readonly="readonly" required="required">
                            </div>
                            <div class="col-md-6">
                                <label for="inputEmail4" class="form-label">Email</label>
                                <input required="required" type="email" name="email" class="form-control"
                                       id="inputEmail4" value="<%=u.getEmail()%>" readonly="readonly">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 ">
                                <label for="inputEmail4" class="form-label">Phone Number</label>
                                <input required="required" type="number" name="phno" class="form-control"
                                       id="inputEmail4" value="<%=u.getPhno()%>">
                            </div>
                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">Address</label>
                                <input required="required" type="text" name="address" class="form-control"
                                       id="inputPassword4">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 ">
                                <label for="inputEmail4" class="form-label">Landmark</label>
                                <input required="required" name="landmark" type="text" class="form-control"
                                       id="inputEmail4">
                            </div>
                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">City</label>
                                <input required="required" name="city" type="text" class="form-control"
                                       id="inputPassword4">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 ">
                                <label for="inputEmail4" class="form-label">State</label>
                                <input required="required" name="state" type="text" class="form-control"
                                       id="inputEmail4">
                            </div>
                            <div class="col-md-6">
                                <label for="inputPassword4" class="form-label">Pin Code</label>
                                <input required="required" name="pincode" type="text" class="form-control"
                                       id="inputPassword4">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Payment Mode</label>
                            <select class="form-control" name="paymentType">
                                <option value="noselect">--Select--</option>
                                <option value="COD">Cash On Delivery</option>
                            </select>
                        </div>

                        <div class="text-center mt-4">
                            <button class="btn btn-warning"> Order Now</button>
                            <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                        </div>

                    </form>
                </div>

            </div>

        </div>
    </div>

</div>


</body>
</html>
