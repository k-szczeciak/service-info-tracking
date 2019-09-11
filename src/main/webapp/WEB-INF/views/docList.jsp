<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 02/06/2019
  Time: 11:58
  To change this template use File | Settings | File Templates.

  ToDo:
  W docL:ist.jsp - link do urzadzenia, wyrzucic kolumne dodano, stworzyc linki do podgladu / edycji, dokoonczyc CRUD,
Doodac sortowanie


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
    <title>All Docs</title>
</head>
<body>

<%@include file="header.jspf" %>

<div style="width: 80%" class="container">
    <h3>Lista dokumentów:</h3>
    <input class="form-control" id="myInput" type="text" placeholder="Wyszukaj...">
    <br>
    <table class="table table-responsive table-hover">
        <thead>
            <tr>
                <th scope="col">id urzadzenia:</th>
                <%--<th scope="col">urzadzenie:</th>--%>
                <th scope="col">opis</th>
                <th scope="col">nazwa dokumentu</th>
                <%--<th scope="col">typ dokumentu</th>--%>
                <th scope="col">data utworzenia</th>
            </tr>
        </thead>

        <tbody id="myTable">
            <c:forEach items="${docs}" var="doc" varStatus="theCount">
                <tr>
                    <td scope="row">${doc.item.id}</td>
                    <%--<td scope="row">${doc.item.name}</td>--%>
                    <td scope="row">${doc.description}</td>
                    <td scope="row"><a href="<c:url value="/files/${doc.path}" />">${doc.path}</a></td>
                    <%--<td scope="row">${doc.docType}</td>--%>
                    <td scope="row">${doc.created}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script>
    $(document).ready(function(){
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>

</body>
</html>
