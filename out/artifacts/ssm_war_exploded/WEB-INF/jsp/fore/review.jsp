<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/2/14
  Time: 下午10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="../include/fore/foreHeader.jsp" %>
<title>评论</title>
<body class="animsition">
<div class="login" id="page">
    <%@include file="../include/fore/foreNav.jsp" %>
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="${pageContext.request.contextPath}/images/sub-header/011.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">评论</h3>
    </section>
    <br/>
    <section class="boxed-sm">
        <div class="container">
            订单号：<p class="text-primary">${o.orderCode}</p>
            商品名：<p class="text-primary">${p.name}</p>
            <form action="foredoreview" method="post">
                <input type="hidden" name="oid" value="${o.id}">
                <input type="hidden" name="pid" value="${p.id}">
                <textarea class="form-control" rows="4" name="content" placeholder="在此处填写评论"></textarea>
                <button type="submit" class="btn btn-info">提交</button>
            </form>
        </div>
    </section>


</div>
<%@include file="../include/fore/foreFooter.jsp" %>






