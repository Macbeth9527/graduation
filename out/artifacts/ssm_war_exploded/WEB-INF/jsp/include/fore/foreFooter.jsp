<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/2/6
  Time: 下午4:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<footer class="footer-style-1">
    <div class="container">
        <div class="row">
            <div class="footer-style-1-inner">
                <div class="widget-footer widget-text col-first col-small">
                    <a href="#">
                        <img class="logo-footer" src="images/logo.png" alt="Logo Organic"/>
                    </a>
                    <div class="widget-link">
                        <ul>
                            <li>
                                <span class="lnr lnr-map-marker icon"></span>
                                <span>江苏省淮安市涟水县胡新村村委会</span>
                            </li>
                            <li>
                                <span class="lnr lnr-phone-handset icon"></span>
                                <a href="tel:15252301948">(+86) 152-5230-1948</a>
                            </li>
                            <li>
                                <span class="lnr lnr-envelope icon"></span>
                                <a href="mailto: 834107879@qq.com">834107879@qq.com </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="widget-footer widget-link col-second col-medium">
                    <div class="list-link">
                        <h4 class="h4 heading">商店</h4>
                        <ul>
                            <li>
                                <a href="#nowhere">有机食品</a>
                            </li>
                            <li>
                                <a href="#nowhere">大棚农业</a>
                            </li>
                            <li>
                                <a href="#nowhere">绿色健康</a>
                            </li>
                            <li>
                                <a href="#nowhere">营养丰富</a>
                            </li>
                        </ul>
                    </div>
                    <div class="list-link">
                        <h4 class="h4 heading">帮助</h4>
                        <ul>
                            <li>
                                <a>联系我们</a>
                            </li>
                            <li>
                                <a href="foreFAQ">FAQ</a>
                            </li>
                            <li>
                                <a href="#shortDescription">简介</a>
                            </li>
                        </ul>
                    </div>
                    <div class="list-link">
                        <h4 class="h4 heading">我的账号</h4>
                        <ul>
                            <c:if test="${!empty user}">
                                <li>
                                    <a href="#nowhere">${user.name}</a>
                                </li>
                            </c:if>
                            <c:if test="${empty user}">
                                <li>
                                    <a href="foreRegister">免费注册</a>
                                </li>
                            </c:if>
                            <li>
                                <a href="foreShopCart">我的购物车</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="widget-footer widget-newsletter-footer col-last col-small">
                    <h4 class="h4 heading">时事通讯</h4>
                    <p>输入您的邮箱现在订阅并获得最新优惠活动</p>
                    <form class="organic-form form-inline btn-add-on circle border">
                        <div class="form-group">
                            <input class="form-control pill transparent" placeholder="Your Email..." type="email"/>
                            <button class="btn btn-brand circle" type="submit">
                                <i class="fa fa-envelope-o"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="copy-right style-1">
        <div class="container">
            <div class="row">
                <div class="copy-right-inner">
                    <p>Copyright © 2017 Designed by Macbeth. All rights reserved.</p>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>