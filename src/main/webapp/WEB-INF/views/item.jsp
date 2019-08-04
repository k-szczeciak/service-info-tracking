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

<%@include file="header.jspf" %>

<div class = "container">
    <%--<img src="http://lorempixel.com/256/256/transport" class = "rounded float-right" alt="...">--%>
        <img alt="image"  src="<c:url value="/files/${item.itemImage}" />"
             class = "rounded float-right" alt="..." style="height: 256px; width:360px">
    <div class="container" id="qrcode1"></div><br>
</div>

<div class="container">
    links:
    <div class="container">
        <a href="https://www.baeldung.com/spring-mvc-static-resources"> Help for attachments of static resources</a>
    </div>

    <div class="container">
        <a href="/items/uploadFiles/${item.id}">Add photo</a>
    </div>
</div>
<br>

<!-- Todo: czy jest done azeby tam zamieszczac komentarze jak cos zostalo zrobione np liniki zewnetrzne -->

<!-- Item field -->
<div class="container">
    <form:form method="post" modelAttribute="item">
        <label for="id">Item Id:</label>
        <form:input path="id" class="form-control" value="${item.id}" id="id" disabled="true"/><br>
        Name:
        <form:input path="name" class="form-control" value="${item.name}" /><br>
        MNR:
        <form:input path="mnr" class="form-control" value="${item.mnr}" /><br>
        sn:
        <form:input path="sn" class="form-control" value="${item.sn}" /><br>
        customer:
        <form:input path="customer" class="form-control" value="${item.customer}" /><br>
        photo:
        <form:input path="itemImage" class="form-control" value="${item.itemImage}"/><br>
        <div class="form-group">
            <label for="station_id">Stations:</label>
            <form:select path="station.id" items="${stations}" itemLabel="name" itemValue="id"
                         class="form-control" id="station_id"/>
        </div>
        <input type="submit" value="Save" />
    </form:form>
</div>


<br>
<!-- operations-->
<div class = "container">

    <div style="width: 80%" class="container">
        <table class="table table-hover">Operacje:
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

<!-- comments -->
<div class = "container">

    <div style="width: 80%" class="container">
        <table class="table table-hover">komentarze:
            <tr>
                <th scope="col">created</th>
                <th scope="col">text</th>
                <th scope="col">...</th>
            </tr>

            <c:forEach items="${comments}" var="comment" varStatus="theCount">
                <tr>
                    <td scope="row">${comment.created}</td>
                    <td scope="row" style="text-align: left">${comment.description}</td>
                    <td scope="row"><a href="/comments/edit/${comment.id}" >edit</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<br><br>



<!-- docs -->
<!-- documents -->
<div class = "container">

    <div style="width: 80%" class="container">
        <table class="table table-hover">Dokumenty:
            <tr>
                <th scope="col">opis dokumentu:</th>
                <th scope="col">nazwa dokumentu</th>
                <%--<th scope="col">...</th>--%>
                <th scope="col">data utworzenia:</th>
            </tr>

            <c:forEach items="${docs}" var="doc" varStatus="theCount">
                <tr>
                    <td scope="row">${doc.description}</td>
                    <%--<td scope="row" style="text-align: left">${doc.docType}</td>--%>
                <%--<td scope="row"><a href="<c:url value="/files/${doc.path}" />"> download </a></td>--%>
                    <td scope="row"><a href="<c:url value="/files/${doc.path}" />">${doc.path}</a></td>
                    <td scope="row">${doc.created}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <a href="/docs/add/${item.id}">add document</a>
</div>
<br><br>


<%--<div class="container"> Docs:
    <c:forEach items="${docs}" var="doc" varStatus="theCount">
        ${doc.description}, ${doc.path}, <a href="<c:url value="/files/${doc.path}" />"> download </a> <br>
    </c:forEach>
    <a href="/docs/add/${item.id}">add document</a>
</div>--%>



<div class="container">
    <a href="/comments/add/${item.id}" >Add comment</a>
</div>

<div class="container">
    <a href="/files/${item.itemImage}">download image</a><br>
</div>

<%--<div class="container">
    <form:form method="post" modelAttribute="comment">
        <div class="form-group">
            New Comment:
            <textarea class="form-control" path="description" rows="3"></textarea>
        </div>
        <input type="submit" value="do not press" />
    </form:form>
</div>--%>




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
        text: "localhost:8080/items/show/${item.id}",
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
