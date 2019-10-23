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

<%@include file="header.jspf" %>

<div class = "container">
    <%--<img src="http://lorempixel.com/256/256/transport" class = "rounded float-right" alt="...">--%>
    <img alt="image"  src="<c:url value="/files/${item.id}/${item.itemImage}" />"
         class = "rounded float-right" alt="..." style="height: 256px; width:360px">
    <div class="container" id="qrcode1"></div><br>
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
</script>
</body>
</html>
