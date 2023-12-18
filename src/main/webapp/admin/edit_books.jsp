<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>edit_Books</title>
    <%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
<%@include file="navbar.jsp"%>

<c:if test="${empty userobj}">
    <c:redirect url="../Login.jsp"></c:redirect>
</c:if>
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Edit Book </h4>
                    <%
                        int id=Integer.parseInt(request.getParameter("id"));
                        BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
                        BookDtls b = dao.getBookById(id);
                    %>
                    <form action="../edit_books" method="post">
                         <input type="hidden" name="id" value="<%= b.getBookId()%>">
                        <div class="form-group p-2">
                            <label for="exampleInputEmail1">Book Name </label>
                            <input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= b.getBookName()%>">
                        </div>

                        <div class="form-group p-2">
                            <label for="exampleInputEmail1"> Author Name</label>
                            <input name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= b.getBookAuthor()%>">
                        </div>

                        <div class="form-group p-2">
                            <label for="exampleInputPassword1">Price</label>
                            <input name="price" type="number" class="form-control" id="exampleInputPassword1"value="<%= b.getPrice()%>">
                        </div>


                        <div class="form-group p-2">
                            <label for="inputState">Book Status</label>
                            <select id="inputState" name="status" class="form-control" value="<%= b.getStatus()%>">

                                <%if("Active".equals(b.getStatus())){
                                    %>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                               <% }else{%>
                                <option value="Inactive">Inactive</option>
                                <option value="Active">Active</option>
                              <%
                                }
                              %>


                            </select>
                        </div>

                        <div class="form-group p-2">
                            <label for="exampleFormControlFile1"> Upload Photo</label>
                            <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
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
