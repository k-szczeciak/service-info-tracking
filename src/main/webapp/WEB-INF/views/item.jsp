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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Item Show</title>
</head>
<body>

<%@include file="header.jspf" %>
<div class="container">
    <div class="form-row">
        <div class = "form-group col-md-4">
            <a href="/items/uploadFiles/${item.id}">
                <img alt="image" src="<c:url value="/files/${item.id}/${item.itemImage}"/>"
                 class = "rounded" alt="..." style="height: 16em; width:20em">
            </a>
        </div>
        <div class="form-group col-md-4">
            aktualnie w: ${stations[item.station.id - 1].name}
        </div>

    </div>
</div>
<!-- Todo: czy jest done azeby tam zamieszczac komentarze jak cos zostalo zrobione np liniki zewnetrzne -->

<!-- Item field -->

<div class="container">
    <form>
        <fieldset disabled>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="id">numer materialowy</label>
                <input type="text" class="form-control" id="id" value="${item.mnr}">
            </div>
            <div class="form-group col-md-6">
                <label for="mnr">numer seryjny</label>
                <input type="text" class="form-control" id="mnr" value="${item.sn}">
            </div>
        </div>
        <div class="form-group">
            <label for="name">nazwa</label>
            <input type="text" class="form-control" id="name" value="${item.name}">
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="customer">Klient</label>
                <input type="text" class="form-control" id="customer" value="${item.customer}">
            </div>
            <div class="form-group col-md-4">
                <label for="customerNo">Numer Klienta</label>
                <input type="text" class="form-control" id="customerNo" value="${item.customer}">
            </div>
            <div class="form-group col-md-2">
                <label for="customerCity">Miasto</label>
                <input type="text" class="form-control" id="customerCity" value="${item.id}">
            </div>
        </div>
        </fieldset>
    </form>

<%--    <form:form method="post" modelAttribute="item">
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
    </form:form>--%>


    <form:form method="post" modelAttribute="item" style="display:inline">
        <form:input type = "hidden" path="id" value="${item.id}"/>
        <form:input type = "hidden" path="name" value="${item.name}" />
        <form:input type = "hidden" path="mnr" value="${item.mnr}" />
        <form:input type = "hidden" path="sn" value="${item.sn}" />
        <form:input type = "hidden" path="customer" value="${item.customer}" />
        <form:input type = "hidden" path="itemImage" value="${item.itemImage}"/>
        <form:input type = "hidden" path="station.id"  value="${item.station.id}"/>
        <c:if test="${item.active eq true}">
            <form:input type = "hidden" path="active"  value="0" />
            <input class="btn btn-warning"  type="submit" value="zakończ: ${stations[item.station.id - 1].name}"/>
        </c:if>
        <c:if test="${item.active eq false}">
            <form:input type = "hidden" path="active"  value="1" />
            <input class="btn btn-success"  type="submit" value="aktywuj: ${stations[item.station.id - 1].name}"/>
        </c:if>


        <form:form method="post" modelAttribute="item" style="display:inline">
            <form:input type = "hidden" path="id" value="${item.id}"/>
            <form:input type = "hidden" path="name" value="${item.name}" />
            <form:input type = "hidden" path="mnr" value="${item.mnr}" />
            <form:input type = "hidden" path="sn" value="${item.sn}" />
            <form:input type = "hidden" path="customer" value="${item.customer}" />
            <form:input type = "hidden" path="itemImage" value="${item.itemImage}"/>
            <form:input type = "hidden" path="station.id"  value="${item.station.id + 1}"/>
            <input class="btn btn-primary"  type="submit" value="przeslij do: ${stations[item.station.id].name}" aria-disabled="false"/>
        </form:form>
        <br>
    <p>
        dodac tu jeszcze modala przy przechodzneiu
        oraz zabezpieczenie przy ostatnim - po impolementacji archiwum
    </p>

    </form:form>
</div>

<%--<div class="container" id = "stationList">
    <form:form method="post" modelAttribute="item">
        <form:input type = "hidden" path="id" class="form-control" value="${item.id}"/><br>
        <form:input type = "hidden" path="name" class="form-control" value="${item.name}" /><br>
        <form:input type = "hidden" path="mnr" class="form-control" value="${item.mnr}" /><br>
        <form:input type = "hidden" path="sn" class="form-control" value="${item.sn}" /><br>
        <form:input type = "hidden" path="customer" class="form-control" value="${item.customer}" /><br>
        <form:input type = "hidden" path="itemImage" class="form-control" value="${item.itemImage}"/><br>
        <form:input type = "hidden" path="station.id" class="form-control" value="${item.station.id + 1}"/><br>
        <input class="btn btn-primary"  type="submit" value="Next" />
    </form:form>
    <p>
        dodac tu jeszcze modala przy przechodzneiu
    </p>
</div>--%>




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
        <table class="table table-hover table-nonfluid">komentarze:
            <tr>
                <th scope="col">created/modyfied</th>
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

<div class="container">
    <a href="/comments/add/${item.id}" >Add comment</a>
</div>



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
                    <td scope="row"><a href="<c:url value="/files/${item.id}/${doc.path}" />">${doc.path}</a></td>
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


<%--
<div class="container">
    <a href="/files/${item.itemImage}">download image</a><br>
</div>
-->

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

<div class="container" id="qrcode1" style="width: 20em"></div><br>
    links:
    <div class="container">
        <a href="https://www.baeldung.com/spring-mvc-static-resources"> Help for attachments of static resources</a>
    </div>



<script>
    //var qrcode = new QRCode("qrcode1");
    var qrcode = new QRCode("qrcode1", {
        text: "www.serviceinfotracking.com/items/show/${item.id}",
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
