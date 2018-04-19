<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/4/1
  Time: 下午9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="../include/fore/foreHeader.jsp" %>
<title>FAQ</title>
<body class="animsition">
<div class="faq" id="page">
    <%@include file="../include/fore/foreNav.jsp" %>
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="${pageContext.request.contextPath}/images/sub-header/010.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">FAQ</h3>
    </section>
    <section class="boxed-sm">
        <div class="container">
            <div class="faq-wrapper">
                <div class="row">
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingOne" role="tab">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                                       aria-expanded="true" aria-controls="collapseOne">
                                        <i class="more-less fa fa-angle-down"></i>支持哪些配送方式?</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseOne" role="tabpanel"
                                 aria-labelledby="headingOne">
                                <div class="panel-body">
                                    EMS快递
                                    顺丰快递
                                    韵达快递
                                    中通快递
                                    天天快递
                                    汇通快递
                                    宅急送快运
                                    鑫飞鸿速递
                                    德邦物流
                                    优速快递
                                    港中能达快递
                                    全峰快递
                                    信丰物流
                                    快捷速递
                                    联昊通快运
                                    全日通快运
                                    佳怡物流
                                    速尔快递
                                    天地华宇物流
                                    希伊艾斯速递
                                    佳吉快运
                                    星晨急便
                                    新邦物流
                                    安捷速递
                                    UPS中国
                                    龙邦快件
                                    FedEx联邦中国
                                    源伟丰速递
                                    DHL快递敦豪
                                    中外运全一
                                    TNT国际快运
                                    运通快件
                                    中邮物流
                                    安信达快件
                                    民航速递追踪华驿
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingTwo" role="tab">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        <i class="more-less fa fa-angle-down"></i>是否支持全国配送</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseTwo" role="tabpanel"
                                 aria-labelledby="headingTwo">
                                <div class="panel-body">支持全国范围内的配送，不同地区邮费可能有有所不同。
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingThree" role="tab">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <i class="more-less fa fa-angle-down"></i>如何改变我的收货地址</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseThree" role="tabpanel"
                                 aria-labelledby="headingThree">
                                <div class="panel-body">需要联系客服或者发送邮件到我们的官方邮箱
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingFour" role="tab">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                        <i class="more-less fa fa-angle-down"></i>商品都是现货吗?</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseFour" role="tabpanel"
                                 aria-labelledby="headingFour">
                                <div class="panel-body">大部分产品，都有现货，请仔细查看商品的介绍说明。

                                    部分商品是订单式生产，只有极少量现货。发货周期是2周左右（自支付之日起），最晚4周。

                                    此外，如果你购买的是预订的产品，则按照商品的说明为准。

                                    购买商品，都默认客户知悉商品的说明、相应的保修条款和发货方式。
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingFive" role="tab">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                        <i class="more-less fa fa-angle-down"></i>支付之后或者收到商品之后，想退款，可以吗？
                                    </a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseFive" role="tabpanel"
                                 aria-labelledby="headingFive">
                                <div class="panel-body">不可以，本网站不支持无条件退款。

                                    如果是预定商品，正常发货周期是2周，如果超过4周仍然没有发货，则可以申请退款。
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingSix" role="tab">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                        <i class="more-less fa fa-angle-down"></i>在线订购一定要注册用户吗？</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseSix" role="tabpanel"
                                 aria-labelledby="headingSix">
                                <div class="panel-body">是的。这样你可以查看和管理你的订单，并且知悉订单的状态。

                                    只需要有效Email即可注册。而我们的订购系统也是主要是通过Email和客户进行交流。
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingSeven" role="tab">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                                        <i class="more-less fa fa-angle-down"></i>发货的时候，保价或者买保险吗？</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseSeven" role="tabpanel"
                                 aria-labelledby="headingSeven">
                                <div class="panel-body">一般不保价，如果客户需要保价，则保价费用由客户和卓曜各自支付一半。

                                    顺丰物流确保外观无损。收货前，先查货；如果有损，请拒签，勿收货。
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingEight" role="tab">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
                                        <i class="more-less fa fa-angle-down"></i>收到快递，但是外观有损，能收货吗？</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseEight" role="tabpanel"
                                 aria-labelledby="headingEight">
                                <div class="panel-body">和平时在网上购物一样的流程。

                                    顺丰物流确保外观无损。收货前，先查货；如果有损，请拒签，勿收货。

                                    由卓曜发货的商品，皆有发货清单，请拆箱之后，第一时间确保发货清单与所发货物一致。如有不一致的地方，请及时联系我们。
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- panel-group-->
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="../include/fore/foreFooter.jsp" %>

