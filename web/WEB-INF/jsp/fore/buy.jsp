<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/2/22
  Time: 下午4:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="../include/fore/foreHeader.jsp" %>
<title>订单确认</title>
<body class="animsition">
<div class="checkout" id="page">
    <%@include file="../include/fore/foreNav.jsp" %>
    <section class="sub-header shop-detail-1">
        <img class="rellax bg-overlay" src="${pageContext.request.contextPath}/images/sub-header/015.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">订单确认</h3>
    </section>
    <section class="boxed-sm">
        <div class="container">
            <div class="woocommerce">
                <!--
                <div class="woocommerce-info-wrapper">
                    <div class="row">
                        <div class="woocommerce-info">
                            <i class="fa fa-check"></i>Returning customer?
                            <a href="login.html">Click here to login</a>
                        </div>
                        <div class="woocommerce-info">
                            <i class="fa fa-check"></i>Have a coupon?
                            <a href="shop-cart.html">Click here to enter your code</a>
                        </div>
                    </div>
                </div>
                -->

                <div class="row">
                    <form class="woocommerce-checkout" action="foreCreateOrder" method="post">
                        <h4>收货详情（打*为必填）</h4>
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group organic-form no-radius">
                                    <label>收货人 *</label>
                                    <input class="form-control" type="text" name="receiver">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group organic-form no-radius">
                                    <label>手机号码 *</label>
                                    （+86）<input class="form-control" type="number" name="mobile">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group organic-form no-radius">
                                    <label>邮政编码</label>
                                    <input class="form-control" type="number" name="post">
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group organic-form no-radius">
                                    <label>备注信息 </label>
                                    <input class="form-control" type="text" name="userMessage">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group organic-form no-radius">
                                    <label>详细地址 *</label>
                                    <input class="form-control" type="text" name="address">
                                </div>
                            </div>
                        </div>
                        <div class="woocommerce-checkout-review-order">
                            <h4>您的订单详情</h4>
                            <table class="woocommerce-checkout-review-order-table">
                                <thead>
                                <tr>
                                    <th class="product-name">产品</th>
                                    <th class="product-total">小计</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${orderItems}" var="oi">
                                    <tr class="cart_item">
                                        <td class="product-name">${oi.product.name}
                                            <span class="product-quantity">× ${oi.number}</span>
                                        </td>
                                        <td class="product-total">
                          <span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol">¥</span><fmt:formatNumber type="number" value="${oi.product.price * oi.number}" minFractionDigits="2"/></span>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                                <tfoot>
                                <tr class="cart-subtotal">
                                    <th>商品总计</th>
                                    <td>
                                        <strong>
                            <span class="woocommerce-Price-amount amount">
                              <span class="woocommerce-Price-currencySymbol">¥</span><fmt:formatNumber type="number" value="${total}" minFractionDigits="2"/></span>
                                        </strong>
                                    </td>
                                </tr>
                                <tr class="cart-shipping">
                                    <th>邮费</th>
                                    <td>
                                        <strong>
                            <span class="woocommerce-Price-amount amount">
                              <span class="woocommerce-Price-currencySymbol"></span>包邮</span>
                                        </strong>
                                    </td>
                                </tr>
                                <tr class="order-total">
                                    <th>总计</th>
                                    <td>
                                        <strong>
                            <span class="woocommerce-Price-amount amount">
                              <span class="woocommerce-Price-currencySymbol">¥</span><fmt:formatNumber type="number" value="${total}" minFractionDigits="2"/></span>
                                        </strong>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>

                        <div class="woocommerce-checkout-payment">
                            <!--
                            <div class="payment_method_cheque">
                                <div class="radio">
                                    <label>
                                        <input class="input-radio" id="payment_method_cheque" name="payment_method" value="cheque" checked="checked" type="radio">Check Payments
                                        <div class="payment_box payment_method_cheque">
                                            <p>Please send a c
                                    </label>heck to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p>
                                        </div>
                                </div>
                            </div>
                            <div class="payment_method_paypal">
                                <div class="radio">
                                    <label>
                                        <input class="input-radio" id="payment_method_paypal" name="payment_method" value="paypal" type="radio"> PayPal
                                        <img src="images/icons/paypal-group-icon.png" alt="paypal">
                                        <a href="#">What is Paypal? </a>
                                        <div class="payment_box payment_method_cheque">
                                            <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account.</p>
                                        </div>
                                    </label>
                                </div>
                            </div>
                            -->
                            <div class="form-place-order">
                                <input class="place_order btn btn-brand pill" name="woocommerce_checkout_place_order"
                                       value="支付" type="submit">
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="../include/fore/foreFooter.jsp" %>


