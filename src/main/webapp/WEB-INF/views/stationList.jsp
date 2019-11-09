<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 31/05/2019
  Time: 15:37
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Station list</title>
</head>
<body>
<%--${stations[0]}--%>

<%@include file="header.jspf" %>

<div style="width: 80%" class="container">
    <h3>Lista stacji:</h3>
    <input class="form-control" id="myInput" type="text" placeholder="Wyszukaj...">
    <br>
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">id</th>
                <th scope="col">name</th>
                <th scope="col">localization</th>
                <th scope="col">capacity</th>
            </tr>
        </thead>

        <tbody id="myTable">
            <c:forEach items="${stations}" var="station" varStatus="theCount">
                <a  href="/stations/show/${station.id}">
                    <tr>
                        <td scope="row">${station.id}</td>
                        <td scope="row">${station.name}</td>
                        <td scope="row">${station.localization}</td>
                        <td scope="row">${station.capacity}</td>
                    </tr>
                </a>
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
