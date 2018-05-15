<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/3/31
  Time: 下午3:52
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
    <br />


    <div class="container">
        <div class="alert alert-success" role="alert">支付成功！您已成功购买商品！请耐心等待发货。</div>
        <a href="foreHome">
            <button type="button" class="btn btn-info">回到主页</button>
        </a>
        <a href="#">
            <button type="button" class="btn btn-info">返回个人中心</button>
        </a>
        <a href="foreShopCart">
            <button type="button" class="btn btn-info">返回购物车</button>
        </a>
    </div>

</div>
<%@include file="../include/fore/foreFooter.jsp" %>