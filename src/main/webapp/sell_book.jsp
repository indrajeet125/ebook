<%--
  Created by IntelliJ IDEA.
  User: Lokendra Kushwah
  Date: 7/28/2023
  Time: 3:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Sell Book</title>
  <%@include file="components/allCss.jsp"%>
</head>
<body style="background-color: azure">
<c:if test="${empty userobj}">
  <c:redirect url="Login.jsp"></c:redirect>
</c:if>

<%@include file="components/navbar.jsp"%>
<div class="container">
  <div class="row">
    <div class="col-md-4 offset-md-4">
      <div class="card">
        <div class="card-body">
          <h4 class="text-center text-success p-1">Sell Old Book</h4>

          <c:if test="${not empty Msg}">
            <p style="color: forestgreen"> ${Msg} </p>
            <c:remove var="Msg" scope="session"></c:remove>
          </c:if>
          <c:if test="${not empty FailedMsg}">
            <p style="color: red">${FailedMsg}</p>
            <c:remove var="FailedMsg" scope="session"></c:remove>
          </c:if>

          <form action="add_old_book" method="post" enctype="multipart/form-data">

            <input type="hidden" value="${userobj.email}" name="user">
            <div class="form-group p-2">
              <label for="exampleInputEmail1">Book Name </label>
              <input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            </div>

            <div class="form-group p-2">
              <label for="exampleInputEmail1"> Author Name</label>
              <input name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            </div>

            <div class="form-group p-2">
              <label for="exampleInputPassword1">Price</label>
              <input name="price" type="number" class="form-control" id="exampleInputPassword1">
            </div>

            <div class="form-group p-2">
              <label for="exampleFormControlFile1"> Upload Photo</label>
              <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
            </div>

            <button type="submit" class="btn btn-primary">Add</button>

          </form>

        </div>
      </div>

    </div>

  </div>

</div>


</body>
</html>
