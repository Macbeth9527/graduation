<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/2/9
  Time: 上午12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%@include file="../include/fore/foreHeader.jsp" %>
<title>商品详情</title>
<script>
    /*控制num商品数量加减*/
    $(document).ready(function () {
        var num = $("#productNumber");

        $(".minus").click(function () {
            num.val(parseInt(num.val()) - 1);
        });
        $(".plus").click(function () {
            num.val(parseInt(num.val()) + 1);
        });

    });
</script>
<body class="animsition">
<div class="shop-detail-1 woocommerce" id="page">
    <%@include file="../include/fore/foreNav.jsp" %>
    <section class="sub-header shop-detail-1">
        <img class="rellax bg-overlay" src="${pageContext.request.contextPath}/images/sub-header/01.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">商品详情</h3>
    </section>
    <section class="boxed-sm">
        <div class="container">
            <div class="row product-detail">
                <div class="row main">
                    <div class="col-md-6">
                        <div class="woocommerce-product-gallery">
                            <div class="main-carousel">

                                <div class="item">
                                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/productSingle/${p.firstProductImage.id}.jpg"
                                         alt="product thumbnail">
                                </div>
                            </div>
                            <div class="thumbnail-carousel">

                                <div class="item">
                                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/productSingle/${p.firstProductImage.id}.jpg"
                                         alt="product thumbnail">
                                </div>


                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="summary">
                            <div class="desc">
                                <div class="header-desc">
                                    <h2 class="product-title">${p.name}</h2>
                                    <p class="price">¥ ${p.price}</p>
                                </div>
                                <div class="body-desc">
                                    <div class="woocommerce-product-details-short-description">
                                        <p>${p.shortDescription} </p>
                                    </div>
                                </div>
                                <div class="footer-desc">
                                    <form class="cart" action="foreBuyOne" method="post">
                                        <div class="quantity buttons-added">
                                            <input class="minus" value="-" type="button">
                                            <input id="productNumber" class="input-text qty text" step="1" min="1"
                                                   max="" name="num" value="1" size="4" pattern="[0-9]*" type="number">
                                            <input class="plus" value="+" type="button">
                                        </div>
                                        <input type="hidden" name="pid" value="${p.id}"/>
                                        <button class="btn btn-brand no-radius">添加购物车</button>
                                        <button class="btn btn-wishlist btn-brand-ghost no-radius" type="submit">
                                            立即购买
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <div class="product-meta">
                                <p class="posted-in">分类:
                                    <a href="#" rel="tag">${p.category.name}</a>
                                </p>
                                <p class="tagged-as">库存:
                                    <a href="#" rel="tag">${p.stock}个</a>
                                </p>
                                <p class="id">货号:
                                    <a href="#">${p.id}</a>
                                </p>
                                <p class="id">销量:
                                    <a href="#">${p.saleCount}</a>
                                </p>
                                <p class="tagged-as">服务承诺:
                                    <a href="#nowhere" rel="tag">正品保证</a>,
                                    <a href="#nowhere" rel="tag">极速退款</a>,
                                    <a href="#nowhere" rel="tag">赠运费险</a>,
                                    <a href="#nowhere" rel="tag">七天无理由退换</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="woocommerce-tabs">
                <div class="row">
                    <div class="col-md-6">
                        <div class="tab-content tab-content-style-1">
                            <div class="tab-pane fade in active" id="Description" role="tabpanel">
                                <h3 class="title-tab">特色</h3>
                                <ul class="arrow">
                                    <li>纯天然，无添加</li>
                                    <li>绿色健康无污染</li>
                                    <li>最优良的提供商，最好的品质</li>
                                    <li>厚道的价格，极高的性价比</li>
                                    <li>自产自销，售后放心</li>
                                    <li>营养价值高，健体养生</li>
                                    <li>全国配送，包邮直达</li>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="Additional-Information" role="tabpanel">
                                <h3 class="title-tab">更多信息</h3>
                                <table class="shop_attributes table table-striped table-bordered">
                                    <tbody>
                                    <c:forEach items="${propertyValues}" var="pv">
                                        <tr>
                                            <th>${pv.property.name}</th>
                                            <td>
                                                <p>${pv.value}</p>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="Review" role="tabpanel">
                                <h3 class="title-tab">${p.reviewCount}条评论</h3>
                                <ol class="comment-list">
                                    <c:forEach items="${reviews}" var="re">
                                        <li>
                                            <div class="the-comment">
                                                <div class="avatar">
                                                    <img class="avatar" alt="avatar" src="${pageContext.request.contextPath}/images/comment/01.png">
                                                </div>
                                                <div class="comment-box">
                                                    <div class="comment-author meta">
                                                        <p class="author">${re.user.anonymousName}</p>
                                                        <p class="time">${re.createDate}</p>
                                                    </div>
                                                    <div class="comment-text">
                                                        <p>${re.content}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <ul class="tabs tab-style-1" role="tablist">
                            <li class="active" role="presentation">
                                <a href="#Description" aria-controls="Description" role="tab" data-toggle="tab">描述
                                    <i class="more-less fa fa-angle-down"></i>
                                </a>
                            </li>
                            <li role="presentation">
                                <a href="#Additional-Information" aria-controls="Additional-Information" role="tab"
                                   data-toggle="tab">更多信息
                                    <i class="more-less fa fa-angle-down"></i>
                                </a>
                            </li>
                            <li role="presentation">
                                <a href="#Review" aria-controls="Review" role="tab"
                                   data-toggle="tab">评论(${p.reviewCount})
                                    <i class="more-less fa fa-angle-down"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="../include/fore/foreFooter.jsp" %>


