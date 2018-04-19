<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@include file="/WEB-INF/jsp/include/fore/foreHeader.jsp"%>
<title>404</title>
<body class="animsition">
<div class="page-404" id="page">

    <%@include file="/WEB-INF/jsp/include/fore/foreNav.jsp"%>
    <section class="boxed-sm section-404-wrapper">
        <div class="container">
            <div class="page-404-wrapper">
                <h3>404</h3>
                <hr class="style-one">
                <p><b>404</b>. That’s an error.<br/>The requested URL was not found on this server. That’s all we know.
                </p>
                <a class="btn btn-brand pill" href="home">BACK TO HOMEPAGE</a>
            </div>
        </div>
    </section>
</div>
<%@include file="/WEB-INF/jsp/include/fore/foreFooter.jsp"%>

