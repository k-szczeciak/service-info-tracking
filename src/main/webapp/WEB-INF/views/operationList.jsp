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

<div style="width: 50%">
    <table class="table table-hover">
        <tr>
            <th scope="col">id</th>
            <th scope="col">created</th>
            <th scope="col">item_id</th>
            <th scope="col">user_id</th>
            <th scope="col">station_id</th>
        </tr>

        <c:forEach items="${operations}" var="operation" varStatus="theCount">
            <tr>
                <td scope="row">${operation.id}</td>
                <td scope="row">${operation.created}</td>
                <td scope="row">${operation.item_id}</td>
                <td scope="row">${operation.user_id}</td>
                <td scope="row">${operation.station_id}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
