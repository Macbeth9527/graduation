<%--
  Created by IntelliJ IDEA.
  User: macbeth
  Date: 2018/2/14
  Time: 下午10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="../include/fore/foreHeader.jsp" %>
<script>
    /*查看用户名是否注册*/
    $(document).ready(function () {
        $("#registerUserName").keyup(function () {
            var name = $(this).val();
            var url = "${pageContext.request.contextPath}/foreCheckRegisterAjax";
            $.get(
                url,
                {"name": name},
                function (result) {
                    if (result === "success") {
                        $("#registerMsg").html("该用户名可以使用");
                    } else {
                        $("#registerMsg").html("该用户名已存在");
                    }
                }
            );
        });
    });
    /*密码判断是否一致*/
    $(document).ready(function () {
        $("#registerForm").submit(function () {
            var password = $("#registerUserPsd").val();
            var passwordR = $("#registerUserPsdR").val();
            if (password !== passwordR) {
                event.preventDefault();

                $("#registerPasswordMsg").html("两次密码不一致");

                $(location).attr('href', '#registerUserPsdR');

            }
        });
    });


</script>
<title>注册</title>
<body class="animsition">
<div class="login" id="page">
    <%@include file="../include/fore/foreNav.jsp" %>
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="${pageContext.request.contextPath}/images/sub-header/011.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">用户注册</h3>
    </section>
    <section class="boxed-sm">
        <div class="container">
            <div class="login-wrapper">
                <div class="row">
                    <h3>注册</h3>
                    <form action="foreRegister" method="post" id="registerForm">
                        <div class="form-group organic-form-2">
                            <label>昵称 *</label>
                            <input id="registerUserName" class="form-control" type="text" name="name" required>
                            <span id="registerMsg"></span>
                        </div>
                        <div class="form-group organic-form-2">
                            <label>密码 *</label>
                            <input id="registerUserPsd" class="form-control" type="Password" name="password" required>
                        </div>
                        <div class="form-group organic-form-2">
                            <label>重复密码 *</label>
                            <input class="form-control" id="registerUserPsdR" type="Password" required>
                        </div>
                        <span id="registerPasswordMsg"></span>
                        <div class="form-group footer-form">
                            <button class="btn btn-brand pill" type="submit">注册</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="../include/fore/foreFooter.jsp" %>
