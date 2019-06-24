<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 19/06/2019
  Time: 07:14
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
    <title>Comment</title>
</head>
<body>

<%@include file="header.jspf" %>


<div class="container">
    <form:form method="post" modelAttribute="comment">
        id:
        <form:input path="id" class="form-control" value="${id}" /><br>
        item id:
        <form:input path="item.id" class="form-control" value="${item.id}" /><br>
        Comment:
        <form:textarea class="form-control" path="description" rows="3" value = "${description}"></form:textarea>
        <%--<form:input class="form-control" path="description" value = "${description}"></form:input>--%>
        <input type="submit" value="Update" />
    </form:form>
</div>

</body>
</html>
