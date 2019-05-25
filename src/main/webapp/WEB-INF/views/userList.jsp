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
    <title>User List</title>
</head>
<body>

<h1>all users</h1>

<c:forEach items="${users}" var="user" varStatus="theCount">
    Imie: ${user.firstName}  , Nazwisko: ${user.lastName} , <br>
</c:forEach>

</body>
</html>
