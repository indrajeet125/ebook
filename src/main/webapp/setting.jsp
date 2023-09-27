<%--
  Created by IntelliJ IDEA.
  User: Lokendra Kushwah
  Date: 7/28/2023
  Time: 2:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Setting</title>
  <%@include file="components/allCss.jsp"%>
  <style class="text/css">
    a{
  text-decoration: none;
      color: black;
    }
    a:hover{
      text-decoration: none;
    }
  </style>
</head>
<body style="background-color: antiquewhite">
<c:if test="${empty userobj}">
  <c:redirect url="Login.jsp"></c:redirect>
</c:if>

<%@include file="components/navbar.jsp"%>
 <div class="container">
   <h3 class="text-center mt-3 text-primary"><strong>Hello ${userobj.name}</strong></h3>

   <div class="row p-5">
     <div class="col-md-3">
       <a href="sell_book.jsp">
         <div class="card">
           <div class="card-body text-center">
             <div class="text-primary">
               <i class="fa-solid fa-book fa-3x"></i>
             </div>
             <h4>Sell Old Books</h4>
             <p>Sell Old Books</p>
           </div>
         </div>
       </a>
     </div>
     <div class="col-md-3">
       <a href="edit_profile.jsp">
         <div class="card">
           <div class="card-body text-center">
             <div class="text-warning">
               <i class="fa-solid fa-id-card fa-3x"></i>
             </div>
             <h4>Login & Security</h4>
             <p>Edit Profile</p>
           </div>
         </div>
       </a>
     </div>
     <div class="col-md-3">
       <a href="user_address.jsp">
         <div class="card">
           <div class="card-body text-center">
             <div class="text-success">
               <i class="fa-solid fa-map-location fa-3x"></i>
             </div>
             <h3>Your Address</h3>
             <p>Edit Address</p>
           </div>
         </div>
       </a>
     </div>
     <div class="col-md-3">
       <a href="order.jsp">
         <div class="card">
           <div class="card-body text-center">
             <div class="text-info">
               <i class="fa-solid fa-box-open fa-3x"></i>
             </div>
             <h3>My Order</h3>
             <p>Track Your Order</p>
           </div>
         </div>
       </a>
     </div>

   </div>
   <div class="col-md-3 offset-md-4">
     <div class="card mb-1">
       <div class="card-body">
         <a href="my_old_book.jsp" class="text-center">
           <div class="text-danger text-center">
             <i class="fa-solid fa-download fa-3x"></i>
           </div>
           <h4>My Old Books</h4>
           <p>Books for Sell</p>
         </a>
       </div>
     </div>
   </div>

 </div>

<div style="text-decoration: none; color: blue;">
  <%@include file="components/footer.jsp"%>
</div>

</body>
</html>
