<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 04/11/2019
  Time: 08:30
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
    <title>Start</title>
</head>
<body>


<div class="jumbotron jumbotron-fluid">
    <div class="container">
        <h1 class="display-4">Szukaj...</h1>
        <%--<p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>--%>

        <!-- Search form -->
        <form class="form-inline">
            <i class="fas fa-search" aria-hidden="true"></i>
            <input class="form-control form-control-sm ml-3 w-75" name="query" type="text" placeholder="Numer materiałowy lub numer seryjny"
                   aria-label="Search">
        </form>
    </div>
    querry: ${query}

</div>




<%--<nav class="navbar navbar-light bg-light">
    <form class="form-inline" method="post">
        <input class="form-control mr-sm-2" type="search" name="query" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
</nav>--%>



</body>
</html>
