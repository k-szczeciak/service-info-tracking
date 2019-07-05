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

<%@include file="header.jspf" %>


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
            <li class="list-group-item active">${stations[varStatus.index].name},
                    ilość elementów: ${qty[varStatus.index]}</li>
            <c:forEach items="${items}" var = "item">
                <li class="list-group-item"  <c:if test="${item.active eq 'true'}"> style="background: lightgreen" </c:if> >
                    <table style="width:100%">
                        <tr>
                            <td>
                                <div style="display: inline-block; vertical-align: top;">
                                    <a href = "/items/show/${item.id}">
                                        <img src="<c:url value="/files/${item.itemImage}" />" border=0 height=60 width=100 />
                                    </a>
                                </div>
                            </td>
                            <td>
                                <div style="display: inline-block">
                                    Id: ${item.id}, MNR: ${item.mnr}, Name: ${item.name}, Active: ${item.active}
                                </div>
                            </td>
                        </tr>
                    </table>
                </li>
            </c:forEach><br>
        </div>
    </c:forEach>
    <br>
    <br>
    <%--other solution : todo przerobic na rozwiazanie od Marcina
    <c:forEach items="${stations}" var="station">

        <c:forEach items="${station.items}" var="item">
            <li class="list-group-item">${item.id}, ${item.mnr}, ${item.name}, <a href = "/items/show/${item.id}"> View </a></li>
        </c:forEach><br>

    </c:forEach>--%>
</div>

</body>
</html>
