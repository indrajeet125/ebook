
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit address</title>
  <%@include file="components/allCss.jsp"%>

</head>
<body>
<%@include file="components/navbar.jsp"%>

<div class="container">
  <div class="row">
    <div class="col-md-6 offset-md-3">
      <div class="card">
        <div class="card-body">
          <form action="">
            <h4 class="text-center text-success">Edit Your Address</h4>
            <div class="row mt-3">
              <div class="col-md-7">
                <label for="input" class="form-label">Address</label>
                <input type="text" class="form-control" id="input" value="">
              </div>
              <div class="col-md-4">
                <label for="inputE" class="form-label">Landmark</label>
                <input type="text" class="form-control" id="inputE" value="">
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-md-4">
                <label for="inputP" class="form-label">City</label>
                <input type="text" class="form-control" id="inputP" value="">
              </div>
              <div class="col-md-4">
                <label for="inputPa" class="form-label">State</label>
                <input type="text" class="form-control" id="inputPa" value="">
              </div>
              <div class="col-md-4">
                <label for="inputPas" class="form-label">Pin</label>
                <input type="text" class="form-control" id="inputPas" value="">
              </div>
            </div>
            <div class="text-center mt-4">
              <a href="" class="btn btn-warning">Update Address</a>
            </div>

          </form>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>
