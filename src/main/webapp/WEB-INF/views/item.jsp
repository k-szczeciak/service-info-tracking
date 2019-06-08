<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 04/06/2019
  Time: 18:30
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
    <script type="text/javascript" src="/resources/js/qrcode.js"></script>
    <title>Item Show</title>
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
                        <a class="dropdown-item" href="#">New Item</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Stations
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">All Stations</a>
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
                        <a class="dropdown-item" href="#">New Comment</a>
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

<div class = "container">
    <img src="http://lorempixel.com/256/256/transport" class = "rounded float-right" alt="...">


    <div class="container" id="qrcode1"></div><br>


</div>


<div class="container">
    <form:form method="post" modelAttribute="item">
        id:
        <form:input path="id" class="form-control" value="${items[0].id}" /><br>
        Name:
        <form:input path="name" class="form-control" value="${items[0].name}" /><br>
        MNR:
        <form:input path="mnr" class="form-control" value="${items[0].mnr}"/><br>
        sn:
        <form:input path="sn" class="form-control" value="${items[0].sn}"/><br>
        customer:
        <form:input path="customer" class="form-control" value="${items[0].customer}"/><br>
        <div class="form-group">
            <label for="station_id">Stations:</label>
            <form:select path="station.id" items="${stations}" itemLabel="name" itemValue="id"
                         class="form-control" id="station_id"/>
        </div>
        <input type="submit" value="Save" />
    </form:form>
</div>


<br>
<div class = "container">

    <div style="width: 80%" class="container">
        <table class="table table-hover">Operations:
            <tr>
                <th scope="col">created</th>
                <th scope="col">item</th>
                <th scope="col">user</th>
                <th scope="col">station</th>
            </tr>

            <c:forEach items="${operations}" var="operation" varStatus="theCount">
                <tr>
                    <td scope="row">${operation.created}</td>
                    <td scope="row">${operation.item.id}</td>
                    <td scope="row">${operation.user.firstName}, ${operation.user.lastName}</td>
                    <td scope="row">${operation.station.name}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div><br>

<br>
<div class = "container">

    <div style="width: 80%" class="container">
        <table class="table table-hover">Comments:
            <tr>
                <th scope="col">created</th>
                <th scope="col">text</th>
            </tr>

            <c:forEach items="${comments}" var="comment" varStatus="theCount">
                <tr>
                    <td scope="row">${comment.created}</td>
                    <td scope="row">${comment.description}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<br><br>


<div class="container">
    <form:form method="post" modelAttribute="comment">
        <div class="form-group">
            New Comment:
            <textarea class="form-control" path="description" rows="3"></textarea>
        </div>
        <input type="submit" value="do not press" />
    </form:form>
</div>




<%-- todo docs and comments
<div class = "container">
    Docs:

</div>

<div class = "container">
    Comments:

</div>--%>





<script>
    //var qrcode = new QRCode("qrcode1");
    var qrcode = new QRCode("qrcode1", {
        text: "localhost:8080/items/show/${items[0].id}",
        width: 256,
        height: 256,
        colorDark : "#000000",
        colorLight : "#ffffff",
        correctLevel : QRCode.CorrectLevel.H
    });
    //qrcode.makeCode("www.prezentacje.szczeciak.com.pl");
</script>
</body>
</html>
