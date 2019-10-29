<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 29/10/2019
  Time: 09:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
    <script type="text/javascript" src="/resources/js/qrcode.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Station</title>
</head>
<body>
<%@include file="header.jspf" %>
<div class="container">
    <form>
        <fieldset disabled>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="id">id stacji</label>
                    <input type="text" class="form-control" id="id" value="${station.id}">
                </div>
                <div class="form-group col-md-6">
                    <label for="mnr">nazwa stacji</label>
                    <input type="text" class="form-control" id="mnr" value="${station.name}">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="customer">lokalizacja</label>
                    <input type="text" class="form-control" id="customer" value="${station.localization}">
                </div>
                <div class="form-group col-md-4">
                    <label for="customerNo">użytkownik</label>
                    <input type="text" class="form-control" id="customerNo" value="${station.user_id}">
                </div>
                <div class="form-group col-md-2">
                    <label for="customerCity">capacity</label>
                    <input type="text" class="form-control" id="customerCity" value="${station.capacity}">
                </div>
            </div>
        </fieldset>
    </form>
</div>

<div style="width: 80%" class="container">
    <h3>Lista urządzeń:</h3>
    <input class="form-control" id="myInput" type="text" placeholder="Wyszukaj...">
    <br>
    <table class="table table-responsive table-hover">
        <thead>
        <tr>
            <th scope="col">id urzadzenia:</th>
            <%--<th scope="col">urzadzenie:</th>--%>
            <th scope="col">mnr</th>
            <th scope="col">nazwa</th>
            <%--<th scope="col">typ dokumentu</th>--%>
            <th scope="col">aktywny</th>
        </tr>
        </thead>

        <tbody id="myTable">
        <c:forEach items="${items}" var="item" varStatus="theCount">
            <tr>
                <td scope="row">${item.id}</td>
                    <%--<td scope="row">${doc.item.name}</td>--%>
                <td scope="row">${item.mnr}</td>
                <td scope="row">${item.name}</td>
                <%--<td scope="row"><a href="<c:url value="/items/${item.id}" />">${doc.path}</a></td>--%>
                    <%--<td scope="row">${doc.docType}</td>--%>
                <td scope="row">${item.active}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>
    $(document).ready(function(){
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>

</body>
</html>
