<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/2/9
  Time: 上午12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@include file="../include/fore/foreHeader.jsp"%>
<title>搜索结果</title>
<body class="animsition">
<div class="shop-layout-1" id="page">
    <%@include file="../include/fore/foreNav.jsp"%>
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="${pageContext.request.contextPath}/images/sub-header/01.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">搜索结果</h3>
    </section>
    <div class="woocommerce-top-control wrapper">
        <section class="boxed-sm">
            <div class="container">
                <div class="row">
                    <div class="woocommerce-top-control">
                        <p class="woocommerce-result-count">关键字 ${keyword} ,共 ${page.total} 条记录</p>
                        <form class="woocommerce-ordering select-custom-wrapper" method="get" action="shopList" id="sortForm">
                            <select class="orderby select-custom-wrapper" name="sort">
                                <option value="priceDesc">价格降序</option>
                                <option value="date">最新上架</option>
                                <option value="popularity">最受欢迎</option>
                                <option value="rating">综合排序</option>
                                <option value="price">价格升序</option>
                            </select>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <section class="box-sm">
        <div class="container">
            <div class="row main">
                <div class="row product-grid-equal-height-wrapper product-equal-height-4-columns flex multi-row">
                    <c:if test="${empty ps}">
                        <h4>
                            商店里暂时没有 ${keyword} ，尝试换一种名称搜索或<a href="#nowhere">联系一下我们</a>？
                        </h4>
                    </c:if>
                    <c:forEach items="${ps}" var="p">
                        <figure class="item">
                            <div class="product product-style-1">
                                <div class="img-wrapper">
                                    <a href="productDetail?pid=${p.id}">
                                        <c:if test="${!empty p.firstProductImage}">
                                            <img class="img-responsive" src="img/productSingle/${p.firstProductImage.id}.jpg" alt="${p.name}" />
                                        </c:if>
                                    </a>
                                    <div class="product-control-wrapper bottom-right">
                                        <div class="wrapper-control-item">
                                            <a class="js-quick-view" href="#" type="button" data-toggle="modal" data-target="#quick-view-product">
                                                <span class="lnr lnr-eye"></span>
                                            </a>
                                        </div>
                                        <div class="wrapper-control-item item-wish-list">
                                            <a class="js-wish-list js-notify-add-wish-list" href="#">
                                                <span class="lnr lnr-heart"></span>
                                            </a>
                                        </div>
                                        <div class="wrapper-control-item item-add-cart js-action-add-cart">
                                            <a class="animate-icon-cart" href="#">
                                                <span class="lnr lnr-cart"></span>
                                            </a>
                                            <svg x="0px" y="0px" width="36px" height="32px" viewbox="0 0 36 32">
                                                <path stroke-dasharray="19.79 19.79" fill="none" ,="," stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"></path>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                                <figcaption class="desc text-center">
                                    <h3>
                                        <a class="product-name" href="productDetail?pid=${p.id}">${p.name}</a>
                                    </h3>
                                    <span class="price">¥${p.price}</span>
                                </figcaption>
                            </div>
                        </figure>
                    </c:forEach>

                </div>
                <div class="row">
                    <div class="col-md-12 text-right">
                        <%@include file="../include/common/page.jsp"%>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="../include/fore/foreFooter.jsp"%>
