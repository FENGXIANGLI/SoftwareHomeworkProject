<%--
  Created by IntelliJ IDEA.
  User: fengxiangli
  Date: 16/4/19
  Time: 上午3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC 添加用户</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="/styles/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <h1>添加用户</h1>
    <c:if test="${!empty error}">
        <div class="alert alert-danger" role="alert">
            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
            <span class="sr-only">错误:</span>
                ${error}
        </div>
    </c:if>
    <hr/>
    <c:if test="${empty root}"><a href="/admin/users" type="button" class="btn btn-primary btn-sm">返回</a></h3></c:if>
    <c:if test="${!empty root}"><a href="/admin/adminUsers/users" type="button" class="btn btn-primary btn-sm">返回</a></h3></c:if>
    <form:form action="/admin/users/addP" method="post" commandName="user" role="form">
        <div class="form-group">
            <label for="firstName">账号:</label>
            <input type="text" class="form-control" id="account" name="account" placeholder="输入账号:"/>
        </div>
        <div class="form-group">
            <label for="firstName">昵称:</label>
            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="输入昵称:"/>
        </div>
        <div class="form-group">
            <label for="firstName">名:</label>
            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="输入名:"/>
        </div>
        <div class="form-group">
            <label for="lastName">姓:</label>
            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="输入姓:"/>
        </div>
        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="输入密码:"/>
        </div>
        <div class="form-group">
            <label for="confirmPassword">验证密码:</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="再次输入密码:"/>
        </div>
        <div class="form-group">
            <label for="studentId">学号:</label>
            <input type="text" class="form-control" id="studentId" name="studentId" placeholder="输入学号:"/>
        </div>
        <div class="form-group">
            <label for="department">院系:</label>
            <input type="text" class="form-control" id="department" name="department" placeholder="输入院系:"/>
        </div>
        <div class="form-group">
            <dt>性别</dt>
            <div class="radio">
                <label class="radio-inline">
                    <input type="radio" name="userGender" id="userGender" value=0 >
                    男性                        </label>
                <label class="radio-inline">
                    <input type="radio" name="userGender" id="userGender" value=1 checked>
                    女性                        </label>
            </div>
        </div>

        <input type="hidden" id="allowAmountBookNum" name="allowAmountBookNum" value="3"/>
        <input type="hidden" id="borrowBookNum" name="borrowBookNum" value="0"/>
        <input type="hidden" id="defaultTimes" name="defaultTimes" value="0"/>
        <input type="hidden" id="defaultTotalDay" name="defaultTotalDay" value="0"/>

        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
        <div class="form-group">

        </div>
    </form:form>

</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/dateTimePickerJs/dateTimePicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="/dateTimePickerJs/dateTimePicker/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });
    $('.form_date').datetimepicker({
        language:  'en',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });
</script>
</body>
