<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 25/05/2019
  Time: 14:29
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
    <title>Home</title>
</head>
<body>

<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Tracking System</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Items
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="/items/all">All Items</a>
                        <a class="dropdown-item" href="#">My Items</a>
                        <a class="dropdown-item" href="/items/add">New Item</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Stations
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">All Stations</a>
                        <a class="dropdown-item" href="/stations/add">Add Station</a>
                        <c:forEach items="${stations}" var="station" varStatus="theCount">
                            <a class="dropdown-item" href="#">${station.name}</a>
                        </c:forEach>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Operations*
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="/operations/all">All Operations</a>
                        <a class="dropdown-item" href="#">My Operations</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Documents*
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="/docs/all">All Documents</a>
                        <a class="dropdown-item" href="#">My Documents</a>
                        <a class="dropdown-item" href="#">New Document</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Comments*
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="/comments/all">All Comments</a>
                        <a class="dropdown-item" href="#">My Comments</a>
                        <a class="dropdown-item" href="/comments/add">New Comment</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Users*
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="/users/all">All Users</a>
                        <a class="dropdown-item" href="#">New User</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        My Account
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">View</a>
                        <a class="dropdown-item" href="#">Log out</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</div>
<br>
<br>

<%--<div style="width: 80%" class="container">
    Stations:
    <table class="table table-hover">
        <tr>
            <th scope="col">id</th>
            <th scope="col">name</th>
            <th scope="col">localization</th>
            <th scope="col">capacity</th>
            <th scope="col">...</th>
        </tr>

        <c:forEach items="${stations}" var="station" varStatus="theCount">
            <tr>
                <td scope="row">${station.id}</td>
                <td scope="row">${station.name}</td>
                <td scope="row">${station.localization}</td>
                <td scope="row">${station.capacity}</td>
                <td scope="row"><a href = "#">View</a></td>
            </tr>
        </c:forEach>
    </table>
</div>--%>


<%--<c:forEach items="${stations}" var="station"  varStatus="varStatus" >
    <div class="container">
            ${station.name}, ${varStatus.index},
        &lt;%&ndash;<c:forEach items="${itemArray[${varStatus.index}]}" var="item" varStatus="theCount">
            <li class="list-group-item">${item.name}</li>
        </c:forEach>&ndash;%&gt;
    </div>
</c:forEach>--%>
<div class="container">
    <c:forEach items="${itemArray}" var = "items" varStatus="varStatus">
        <div class = "container" style = "width: 22em; display: inline-block; vertical-align: top;">
            <li class="list-group-item active">${stations[varStatus.index].name}</li>
            <c:forEach items="${items}" var = "item">
                <li class="list-group-item">${item.id}, ${item.mnr}, ${item.name}, <a href = "/items/show/${item.id}"> View </a></li>
            </c:forEach><br>
        </div>
    </c:forEach>
    <br>
    <br>
    <%--other solution:
    <c:forEach items="${stations}" var="station">

        <c:forEach items="${station.items}" var="item">
            <li class="list-group-item">${item.id}, ${item.mnr}, ${item.name}, <a href = "/items/show/${item.id}"> View </a></li>
        </c:forEach><br>

    </c:forEach>--%>
</div>

</body>
</html>
