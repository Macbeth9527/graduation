<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/4/29
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="../include/fore/foreHeader.jsp" %>
<title>个人中心</title>
<body class="animsition">
<div class="login" id="page">
    <%@include file="../include/fore/foreNav.jsp" %>
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="${pageContext.request.contextPath}/images/sub-header/011.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">个人中心</h3>
    </section>
    <br/>

    <div>
        <div class="container">
            <table class="table">
                <tr>
                    <td >宝贝</td>
                    <td width="100px">单价</td>
                    <td width="100px">数量</td>
                    <td width="100px">实付款</td>
                    <td width="100px">交易操作</td>
                </tr>
            </table>

        </div>

        <div class="container">
            <c:forEach items="${os}" var="o">
                <table class="table">
                    <tr>
                        <td colspan="2">
                            <b><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></b>
                            <span>订单号: ${o.orderCode}
					</span>
                        </td>
                    </tr>
                    <c:forEach items="${o.orderItems}" var="oi" varStatus="st">
                        <tr>
                            <td><img width="80" height="80"
                                     src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg"></td>
                            <td>
                                <div>
                                    <a href="foreProductDetail?pid=${oi.product.id}">${oi.product.name}</a>
                                </div>
                            </td>
                            <td width="100px">
                                <div>￥<fmt:formatNumber type="number" value="${oi.product.price}"
                                                        minFractionDigits="2"/></div>
                            </td>
                            <c:if test="${st.count==1}">

                                <td  width="100px">
                                    <span class="orderListItemNumber">${o.totalNumber}</span>
                                </td>
                                <td   width="100px">
                                    <div>￥<fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" type="number"
                                                            value="${o.total}"/></div>
                                </td>
                                <td width="100px">
                                    <c:if test="${o.status=='waitConfirm' }">
                                        <a href="foreConfirmPay?oid=${o.id}">
                                            <button class="btn btn-primary btn-sm">确认收货</button>
                                        </a>
                                    </c:if>
                                    <c:if test="${o.status=='waitPay' }">
                                        <a href="foreAliPay?oid=${o.id}&total=${o.total}">
                                            <button class="btn btn-primary btn-sm">支付货款</button>
                                        </a>
                                    </c:if>

                                    <c:if test="${o.status=='waitDelivery' }">
                                        <button class="btn btn-default btn-sm">等待发货</button>

                                    </c:if>

                                    <c:if test="${o.status=='waitReview' }">
                                        <a href="foreReview?oid=${o.id}">
                                            <button class="btn btn-default btn-sm">等待评价</button>
                                        </a>
                                    </c:if>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>

                </table>
            </c:forEach>

        </div>

    </div>
</div>
<%@include file="../include/fore/foreFooter.jsp" %>


