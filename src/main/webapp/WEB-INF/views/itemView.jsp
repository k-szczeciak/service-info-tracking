<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 19/10/2019
  Time: 11:12
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

    <title>Item view</title>
</head>
<body>

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
    </div>
    <br><br>

</body>
</html>
