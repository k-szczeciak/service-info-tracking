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
    <title>Station list</title>
</head>
<body>
<%--${stations[0]}--%>

<div style="width: 50%">
    <table class="table table-hover">
        <tr>
            <th scope="col">id</th>
            <th scope="col">name</th>
            <th scope="col">localization</th>
            <th scope="col">capacity</th>
        </tr>

        <c:forEach items="${stations}" var="station" varStatus="theCount">
            <tr>
                <td scope="row">${station.id}</td>
                <td scope="row">${station.name}</td>
                <td scope="row">${station.localization}</td>
                <td scope="row">${station.capacity}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
