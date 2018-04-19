<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/2/14
  Time: 下午10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="../include/fore/foreHeader.jsp"%>
<title>登陆</title>
<body class="animsition">
<div class="login" id="page">
    <%@include file="../include/fore/foreNav.jsp"%>
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="${pageContext.request.contextPath}/images/sub-header/011.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">我的账号</h3>
    </section>
    <section class="boxed-sm">
        <div class="container">
            <div class="login-wrapper">
                <div class="row">
                    <h3>登陆</h3>
                    <form method="post" action="foreLogin">
                        <div class="form-group organic-form-2">
                            <label>昵称 *</label>
                            <input class="form-control" type="text" name="name" value="${name}">
                        </div>
                        <div class="form-group organic-form-2">
                            <label>密码 *</label>
                            <input class="form-control" type="Password" name="password">
                        </div>
                        <div class="form-group footer-form">
                            <button class="btn btn-brand pill" type="submit">登陆</button>
                        </div>
                    </form>
                    <span class="errorMessage">${msg}</span>
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="../include/fore/foreFooter.jsp"%>


