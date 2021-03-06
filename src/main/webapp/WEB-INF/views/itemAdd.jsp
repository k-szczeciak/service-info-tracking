<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 07/06/2019
  Time: 17:22
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
    <title>Add Item</title>
</head>
<body>

<%@include file="header.jspf" %>

<div class="container">
    <form:form method="post" modelAttribute="item" action="${pageContext.request.contextPath}/items/add" enctype="multipart/form-data">
        <form:input path="name" class="form-control" placeholder = "Name"/><br>
        <form:input path="mnr" class="form-control" placeholder="MNR"/><br>
        <form:input path="sn" class="form-control" placeholder="serial number"/><br>
        <form:input path="customer" class="form-control" placeholder = "customer"/><br>
        <input type="file" name="file" /><br/>
        <input type="submit" value="Save" />
    </form:form>
</div>

</body>
</html>
