<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 08/07/2019
  Time: 18:04
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
    <title>Add user</title>
</head>
<body>

<%@include file="header.jspf" %>

<div class="container">
    <form:form method="post" modelAttribute="user">
        <form:input type="text" path="firstName" placeholder="first name"/><br>
        <form:input type="text" path="lastName" placeholder="last name"/><br>
        <form:input type="text" path="username" placeholder="username"/><br>
        <form:input type="text" path="email" placeholder="email"/><br>
        <form:input type="password" path="password" placeholder="password"/><br>
        <form:input type="number" path="station_id"/><br>
        <input type="submit" value="Save">
    </form:form>
</div>

</body>
</html>
