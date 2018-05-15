<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/3/31
  Time: 下午3:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%@include file="../include/fore/foreHeader.jsp" %>
<body class="animsition">
<div class="login" id="page">
    <%@include file="../include/fore/foreNav.jsp" %>
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="${pageContext.request.contextPath}/images/sub-header/011.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">支付页面</h3>
    </section>
    <section class="boxed-sm">
        <div class="container">
            <img class="img-rounded" src="${pageContext.request.contextPath}/images/icons/itsme.png" alt="pay"
                 width="650px" height="625px">
            <div style="display:inline">


                <a href="forePayed?oid=${oid}&total=${total}">
                    <button type="button" class="btn btn-primary">确认支付</button>
                </a>
                <div style="display:inline" class="alert alert-info" role="alert">扫了这个俏皮的二维码，我就是你的人了</div>


            </div>
        </div>
    </section>
</div>
<%@include file="../include/fore/foreFooter.jsp" %>
