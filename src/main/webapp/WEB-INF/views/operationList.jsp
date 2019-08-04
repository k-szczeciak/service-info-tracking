<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 02/06/2019
  Time: 13:49
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
    <title>All Operations</title>
</head>
<body>

<%@include file="header.jspf" %>

<div style="width: 80%" class="container">
    <h3>Lista operacji:</h3>
    <input class="form-control" id="myInput" type="text" placeholder="Wyszukaj...">
    <br>
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">numer operacji</th>
                <th scope="col">utworzono dnia</th>
                <th scope="col">id urzadzenia</th>
                <th scope="col">użytkownik</th>
                <th scope="col">nazwa stanowiska</th>
            </tr>
        </thead>

        <tbody id="myTable">
            <c:forEach items="${operations}" var="operation" varStatus="theCount">
                <tr>
                    <td scope="row">${operation.id}</td>
                    <td scope="row">${operation.created}</td>
                    <td scope="row">${operation.item.id}</td>
                    <td scope="row">${operation.user.firstName}, ${operation.user.lastName}</td>
                    <td scope="row">${operation.station.name}</td>
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
