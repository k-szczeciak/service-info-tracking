<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 02/06/2019
  Time: 11:44
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
    <title>Comment List</title>
</head>
<body>

<%@include file="header.jspf" %>



<div style="width: 80%" class = "container">
    <table class="table table-hover">
        <tr>
            <th scope="col">id</th>
            <th scope="col">created</th>
            <th scope="col">description</th>
            <th scope="col">item id</th>
            <th scope="col">...</th>
        </tr>

        <c:forEach items="${comments}" var="comment" varStatus="theCount">
            <tr>
                <td scope="row">${comment.id}</td>
                <td scope="row">${comment.created}</td>
                <td scope="row">${comment.description}</td>
                <td scope="row">${comment.item.id}</td>
                <td scope="row">  <a href="/comments/edit/${comment.id}"> edit </a> </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
