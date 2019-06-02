<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 26/05/2019
  Time: 21:29
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
    <title>Item list</title>
</head>
<body>
<h3>Item list:</h3>

<div style="width: 50%">
    <table class="table table-hover">
        <tr>
            <th scope="col">id</th>
            <th scope="col">name</th>
            <th scope="col">mnr</th>
            <th scope="col">fd</th>
        </tr>

        <c:forEach items="${items}" var="item" varStatus="theCount">
            <tr>
                <td scope="row">${item.id}</td>
                <td scope="row">${item.name}</td>
                <td scope="row">${item.mnr}</td>
                <td scope="row">${item.fd}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
