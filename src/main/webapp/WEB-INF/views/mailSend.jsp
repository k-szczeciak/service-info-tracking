<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 09/06/2019
  Time: 21:57
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
    <title>Send e-mail</title>
</head>
<body>

<%@include file="header.jspf" %>

<!-- FORM -->

<div class="container">
    <form:form method="post" modelAttribute="email">
        email:
        <form:input path="to" class="form-control" placeholder="someone@someone.com"/><br>
        Subject:
        <form:input path="subject" class="form-control" /><br>
        text:
        <form:textarea path="text" class="form-control" /><br>

        <input type="submit" value="Save" />
    </form:form>
</div>

</body>
</html>
