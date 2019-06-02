<%--
  Created by IntelliJ IDEA.
  User: krzysztofszczeciak
  Date: 02/06/2019
  Time: 11:58
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
    <title>All Docs</title>
</head>
<body>

<div style="width: 50%">
    <table class="table table-hover">
        <tr>
            <th scope="col">id</th>
            <th scope="col">descriprion</th>
            <th scope="col">path</th>
            <th scope="col">type</th>
            <th scope="col">created</th>
        </tr>

        <c:forEach items="${docs}" var="doc" varStatus="theCount">
            <tr>
                <td scope="row">${doc.id}</td>
                <td scope="row">${doc.description}</td>
                <td scope="row">${doc.path}</td>
                <td scope="row">${doc.docType}</td>
                <td scope="row">${doc.created}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
