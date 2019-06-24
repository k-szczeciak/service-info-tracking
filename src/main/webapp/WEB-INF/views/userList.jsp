<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 25/05/2019
  Time: 15:11
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
    <title>User List</title>
</head>
<body>

<%@include file="header.jspf" %>

<div style="width: 80%" class="container">
    <table class="table table-hover">
        <tr>
            <th scope="col">id</th>
            <th scope="col">imię</th>
            <th scope="col">nazwisko</th>
            <th scope="col">...</th>
        </tr>

        <c:forEach items="${users}" var="user" varStatus="theCount">
            <tr>
                <td scope="row">${user.id}</td>
                <td scope="row">${user.firstName}</td>
                <td scope="row">${user.lastName}</td>
                <td scope="row"><a href = # > View </a> <a href = # > edit </a></td>
            </tr>
        </c:forEach>
    </table>
</div>



</body>
</html>
