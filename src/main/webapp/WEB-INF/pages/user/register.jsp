<%--
  Created by IntelliJ IDEA.
  User: fengxiangli
  Date: 16/4/19
  Time: 上午3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <h1>用户注册</h1>
    <%
        Object errorValues=session.getAttribute("error");
        Object rightValue = session.getAttribute("rightValue");
    %>
    <% if (errorValues != null) { %>
    <div class="alert alert-danger" role="alert">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span class="sr-only">错误:</span>
        <%=errorValues %>
    </div>
    <% }  %>
    <% if (rightValue != null) { %>
    <div class="alert alert-success" role="alert">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span class="sr-only">成功:</span>
        <%=rightValue %>
    </div>
    <% }  %>

    <form:form action="/user/register" method="post" commandName="registerUser" role="form">
        <div class="form-group">
            <label for="firstName">账号:</label>
            <input type="text" class="form-control" id="account" name="account" placeholder="Enter Account:"/>
        </div>
        <div class="form-group">
            <label for="firstName">昵称:</label>
            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="Enter Nickname:"/>
        </div>
        <div class="form-group">
            <label for="firstName">名:</label>
            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter FirstName:"/>
        </div>
        <div class="form-group">
            <label for="lastName">姓:</label>
            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter LastName:"/>
        </div>
        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password:"/>
        </div>
        <div class="form-group">
            <label for="password">学号:</label>
            <input type="password" class="form-control" id="studentId" name="studentId" placeholder="Enter Password:"/>
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

        <div class="control-group">
            <label class="control-label">生日</label>
            <div class="controls input-append date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" >
                <input size="16" type="text" value="" readonly id = "birthday" name="birthday">
                <span class="add-on"><i class="icon-remove"></i></span>
                <span class="add-on"><i class="icon-th"></i></span>
            </div>
            <input type="hidden" id="dtp_input2" value="" /><br/>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
            <input type="button" class="btn btn-sm btn-success" onclick="back()" name = "返回" value="返回"></input>
        </div>
        <div class="form-group">

        </div>
    </form:form>
</div>
<script>
    function back(){
        window.location.href="/login";
    }
</script>

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
