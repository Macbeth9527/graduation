<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/2/14
  Time: 下午4:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@include file="../include/fore/foreHeader.jsp"%>
<title>购物车</title>
<body class="animsition">
<div class="shop-cart" id="page">
    <%@include file="../include/fore/foreNav.jsp"%>
    <section class="sub-header shop-detail-1">
        <img class="rellax bg-overlay" src="${pageContext.request.contextPath}/images/sub-header/013.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">购物车</h3>
    </section>
    <section class="boxed-sm">
        <div class="container">
            <div class="woocommerce">
                <form class="woocommerce-cart-form">
                    <table class="woocommerce-cart-table">
                        <thead>
                        <tr>
                            <th class="product-thumbnail">商品</th>
                            <th class="product-name"></th>
                            <th class="product-weight">Weight</th>
                            <th class="product-quantity">数量</th>
                            <th class="product-price">价格</th>
                            <th class="product-subtotal">小计</th>
                            <th class="product-remove"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${orderItems}" var="ois">
                            <tr>
                                <td class="product-thumbnail ">
                                    <input type="checkbox">
                                    <img src="${pageContext.request.contextPath}/img/productSingle_small/${ois.product.firstProductImage.id}.jpg" alt="${ois.product.name}">
                                </td>
                                <td class="product-name" data-title="Product">
                                    <a class="product-name" href="foreProductDetail?pid=${ois.product.id}">${ois.product.name}</a>
                                </td>
                                <td class="product-weight" data-title="Weight">0.5 kg</td>
                                <td class="product-quantity" data-title="Quantity">
                                    <input class="qty" step="1" min="0" max="" name="num" value="${ois.number}" size="4" pattern="[0-9]*" type="number">
                                </td>
                                <td class="product-price" data-title="Price">¥${ois.product.price}</td>
                                <td class="product-subtotal" data-title="Total">¥<fmt:formatNumber type="number" value="${ois.product.price * ois.number}" minFractionDigits="2"/></td>
                                <td class="product-remove">
                                    <a class="remove" href="foreShopCartItemDelete?oid=${ois.id}" aria-label="Remove this item">×</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <%--<tfoot>
                        <tr>
                            <td colspan="7">
                                <div class="form-coupon organic-form">
                                    <div class="form-group">
                                        <input class="form-control pill" placeholder="Coupon Code">
                                    </div>
                                    <div class="form-group">
                                        <a class="btn btn-brand pill" href="#">APPLY COUPON</a>
                                    </div>
                                    <div class="form-group update-cart">
                                        <a class="btn btn-brand-ghost pill">UPDATE CART</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tfoot>--%>
                    </table>
                </form>
                <div class="cart_totals">
                    <h3 class="title">总计</h3>
                    <div class="row">
                        <div class="col-md-8">
                            <table class="woocommerce-cart-subtotal">
                                <tbody>
                                <tr>
                                    <th>Subtotal</th>
                                    <td data-title="Subtotal">$0</td>
                                </tr>
                                <tr>
                                    <th>Total</th>
                                    <td data-title="Total">$0</td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="proceed-to-checkout">
                                <a class="btn btn-brand pill" href="#">PROCEED TO CHECKOUT</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="../include/fore/foreFooter.jsp"%>



