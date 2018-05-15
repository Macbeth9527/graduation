<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/2/6
  Time: 下午4:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<nav id="menu">
    <ul>
        <li><a href="foreHome">主页</a></li>
        <li><a href="foreShopList">所有商品</a></li>
        <li><a href="foreMyHome">个人中心</a><li>
        <li><a href="foreShopCart">购物车</a></li>

    </ul>
</nav>
<header class="header-style-1">
    <div class="container">
        <div class="row">
            <div class="header-1-inner">
                <a class="brand-logo animsition-link" href="foreHome">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/images/logo.png"
                         alt="" />
                </a>
                <nav>
                    <ul class="menu hidden-xs">
                        <li><a href="foreHome">主页</a></li>
                        <li><a href="foreShopList">所有商品</a></li>
                        <li><a href="foreMyHome">个人中心</a><li>
                        <li><a href="foreShopCart">购物车</a></li>
                    </ul>
                </nav>
                <aside class="right">
                    <div class="widget widget-control-header">
                        <c:if test="${!empty user}">
                            <a>${user.name}</a>&nbsp;&nbsp;
                            <a href="foreLogout">退出</a>
                            </c:if>
                        <c:if test="${empty user}">
                            <a href="foreLogin">请登录</a>&nbsp;&nbsp;
                            <a href="foreRegister">免费注册</a>
                        </c:if>
                    </div>
                    <div class="widget widget-control-header widget-search-header">
                        <a class="control btn-open-search-form js-open-search-form-header" href="#">
                            <span class="lnr lnr-magnifier"></span>
                        </a>
                        <div class="form-outer">
                            <button class="btn-close-form-search-header js-close-search-form-header">
                                <span class="lnr lnr-cross"></span>
                            </button>
                            <form action="foreProductSearch">
                                <input placeholder="请输入商品名称进行搜索" name="keyword"/>
                                <button class="search" type="submit">
                                    <span class="lnr lnr-magnifier"></span>
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="widget widget-control-header widget-shop-cart js-widget-shop-cart">
                        <a id="shopCart" class="control" href="foreShopCart">
                            <p class="counter">0</p>
                            <span class="lnr lnr-cart"></span>
                        </a>
                    </div>
                    <div class="widget widget-control-header hidden-lg hidden-md hidden-sm">
                        <a class="navbar-toggle js-offcanvas-has-events" type="button" href="#menu">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </a>
                    </div>
                </aside>
            </div>
        </div>
    </div>
</header>


