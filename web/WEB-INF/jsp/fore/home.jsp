<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/2/6
  Time: 下午4:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@include file="../include/fore/foreHeader.jsp"%>
<title>主页</title>
<body class="animsition animsition">
<div class="home-1" id="page">
    <%@include file="../include/fore/foreNav.jsp"%>
    <div class="banner banner-image-fit-screen">
        <div class="rev_slider slider-home-1" id="slider_1">
            <ul>
                <li>
                    <img class="rev-slidebg" src="${pageContext.request.contextPath}/images/slider/1.jpg" alt="demo" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10">
                </li>
            </ul>
        </div>
    </div>
    <section class="boxed-sm">
        <div class="container">
            <div class="row">
                <div class="product-category-grid-style-1">
                    <div class="row">
                        <c:forEach items="${cs}" var="c">
                            <div class="col-sm-4">
                                <a href="foreShopCategoryList?cid=${c.id}">
                                    <figure class="product-category-item">
                                        <div class="thumbnail">
                                            <img src="${pageContext.request.contextPath}/img/category/${c.id}.jpg" alt="${c.name}" />
                                        </div>
                                        <figcaption>
                                            <h3 href="shopCategoryList?cid=${c.id}">${c.name}</h3>
                                        </figcaption>
                                    </figure>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="boxed-sm">
        <div class="container">
            <div class="heading-wrapper text-center">
                <h3 class="heading">最新上架</h3>
            </div>
            <div class="row">
                <div class="row js-product-masonry-layout-1 product-masonry-layout-1">
                    <div class="grid-sizer"></div>
                    <c:forEach items="${ps}" var="p">
                        <figure class="item">
                            <div class="product product-style-2">
                                <div class="img-wrapper">
                                    <a href="foreProductDetail?pid=${p.id}">
                                        <img src="${pageContext.request.contextPath}/img/productSingle/${p.firstProductImage.id}.jpg" alt="${p.name}" />
                                    </a>
                                </div>
                            </div>
                        </figure>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
    <div class="call-to-action-style-1">
        <img class="rellax bg-overlay" src="${pageContext.request.contextPath}/images/call-to-action/1.jpg" alt="" />
        <div class="overlay-call-to-action"></div>
        <div class="container">
            <div class="row">
                <p class="h3">Organic Food</p>
                <h2>健康 - 新鲜 - 美味</h2>
                <a class="btn btn-brand pill" href="foreShopList">查看更多</a>
            </div>
        </div>
    </div>

    <section class="boxed-sm">
        <div class="container">
            <div class="heading-wrapper text-center">
                <span id="shortDescription"></span>
                <h3 class="heading">简介</h3>
            </div>
            <div class="row">
                <div class="row blog-h reverse flex one-row multi-row-sm">
                    <div class="col-md-4">
                        <div class="post">
                            <div class="img-wrapper js-set-bg-blog-thumb">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/images/blog/01.jpg" alt="Image" />
                                </a>
                            </div>
                            <div class="desc">
                                <h4>
                                    <a>关于我们</a>
                                </h4>
                                <p class="meta">
                                    <span class="time">2018年4月08日</span>
                                    <span class="comment"></span>
                                </p>
                                <p>立松水果店是中国发展最快的水果B2B供应链电商平台。通过利用互联网技术，公司致力于打通水果从种植，
                                    生产加工到消费的链条，助力农业产业优化，让认真勤劳的种植者收益更有保障，让消费者有更方便平价的选择。
                                    公司产品覆盖全品类水果，已在全国主要水果产区建立了产地直采体系。并提供仓储、物流、加工等配套服务。
                                    </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="post">
                            <div class="img-wrapper js-set-bg-blog-thumb">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/images/blog/02.jpg" alt="Image" />
                                </a>
                            </div>
                            <div class="desc">
                                <h4>
                                    <a href="#">我们的宗旨</a>
                                </h4>
                                <p class="meta">
                                    <span class="time">January 30, 2017</span>
                                    <span class="comment"></span>
                                </p>
                                <p>四个字：货真价实 ！
                                    立松水果店会对根据成熟度，外观，质量，规格，口感等多方面对果品质量把关。在保证质量的同时，做到价格的价格的绝对实惠。</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="post">
                            <div class="img-wrapper js-set-bg-blog-thumb">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/images/blog/03.jpg" alt="Image" />
                                </a>
                            </div>
                            <div class="desc">
                                <h4>
                                    <a href="#">我们的目标</a>
                                </h4>
                                <p class="meta">
                                    <span class="time">2018年4月08日</span>
                                    <span class="comment"></span>
                                </p>
                                <p>立松水果店创立三年来，借助互联网信息技术提升水果行业流通效率，逐步实现上游惠农、下游惠商、终端惠民的发展愿景。
                                    但是我们的脚步绝不止步于此，期望在未来的三年内成为中国水果行业领先的采购配送、品牌运营电商平台！ </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</div>
<div class="call-to-action-style-2">
    <div class="wrapper-carousel-background">
        <img src="${pageContext.request.contextPath}/images/call-to-action/1-1.jpg" alt="" />
        <img src="${pageContext.request.contextPath}/images/call-to-action/1-2.jpg" alt="" />
        <img src="${pageContext.request.contextPath}/images/call-to-action/1-3.jpg" alt="" />
        <img src="${pageContext.request.contextPath}/images/call-to-action/1-4.jpg" alt="" />
    </div>
    <div class="overlay-call-to-action"></div>
    <a class="btn btn-brand pill icon-left" href="#">
        <i class="fa fa-instagram"></i>FOWLLOW US</a>
</div>
<%@include file="../include/fore/foreFooter.jsp"%>