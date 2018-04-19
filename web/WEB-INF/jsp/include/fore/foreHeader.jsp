<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/2/6
  Time: 下午4:00
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
          rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>


    <script src="${pageContext.request.contextPath}/js/library/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/library/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/function-check-viewport.js"></script>
    <script src="${pageContext.request.contextPath}/js/library/slick.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/library/select2.full.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/library/imagesloaded.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/library/jquery.mmenu.all.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/library/rellax.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/library/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/library/bootstrap-notify.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/library/bootstrap-slider.js"></script>
    <script src="${pageContext.request.contextPath}/js/library/in-view.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/library/countUp.js"></script>
    <script src="${pageContext.request.contextPath}/js/library/animsition.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/revolution/css/settings.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/revolution/css/layers.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/revolution/css/navigation.css"/>
    <script src="${pageContext.request.contextPath}/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script src="${pageContext.request.contextPath}/revolution/js/jquery.themepunch.revolution.min.js"></script>
    <script src="${pageContext.request.contextPath}/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script src="${pageContext.request.contextPath}/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script src="${pageContext.request.contextPath}/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script src="${pageContext.request.contextPath}/revolution/js/extensions/revolution.extension.migration.min.js"></script>
    <script src="${pageContext.request.contextPath}/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script src="${pageContext.request.contextPath}/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
    <script src="${pageContext.request.contextPath}/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script src="${pageContext.request.contextPath}/revolution/js/extensions/revolution.extension.video.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/global.js"></script>
    <script src="${pageContext.request.contextPath}/js/config-banner-home-1.js">


    </script>
    <script src="${pageContext.request.contextPath}/js/config-mm-menu.js"></script>
    <script src="${pageContext.request.contextPath}/js/config-set-bg-blog-thumb.js"></script>
    <script src="${pageContext.request.contextPath}/js/config-isotope-product-home-1.js">


    </script>
    <script src="${pageContext.request.contextPath}/js/config-carousel-thumbnail.js"></script>
    <script src="${pageContext.request.contextPath}/js/config-carousel-product-quickview.js"></script>

    <script>
        $(function () {
            var url = window.location.pathname;
            /*给首页添加样式*/
            if (url !== "/shop/foreHome") {
                $("header").addClass("static");
            }
        });

        $(document).ready(function () {
            $("#shopCart").click(function () {
                /*未登录下打开购物车*/
                var url = "${pageContext.request.contextPath}/foreCheckLogin";
                $.get(
                    url,
                    function (result) {
                        if (result === "success") {
                            /*什么都不做*/
                        } else {
                            alert("您目前处于未登陆状态，自动跳转至登陆页面");
                        }
                    }
                );
            });
        });


    </script>

</head>
