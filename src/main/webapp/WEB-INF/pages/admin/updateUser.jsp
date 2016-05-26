<%--
  Created by IntelliJ IDEA.
  User: fengxiangli
  Date: 16/4/19
  Time: 上午4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC Demo 更新用户</title>

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
    <h1>SpringMVC 更新用户信息</h1>
    <hr/>
    <form:form action="/admin/users/updateP" method="post" commandName="userP" role="form">
        <div class="form-group">
            <label for="account">账号名:</label>
            <input type="text" class="form-control" id="account" name="account" placeholder="输入账号名:"
                   value="${user.account}"/>
        </div>
        <div class="form-group">
            <label for="firstName">昵称:</label>
            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="输入昵称:"
                   value="${user.nickname}"/>
        </div>
        <div class="form-group">
            <label for="firstName">姓:</label>
            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="输入姓:"
                   value="${user.firstName}"/>
        </div>
        <div class="form-group">
            <label for="lastName">名:</label>
            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="输入名:"
                   value="${user.lastName}"/>
        </div>
        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="输入密码:"
                   value="${user.password}"/>
        </div>

        <div class="form-group">
            <label for="studentId">学号:</label>
            <input type="text" class="form-control" id="studentId" name="studentId" placeholder="输入学号:"
                   value="${user.studentId}"/>
        </div>

        <div class="form-group">
            <label for="department">院系:</label>
            <input type="text" class="form-control" id="department" name="department" placeholder="输入院系:"
                   value="${user.department}"/>
        </div>
        <div class="form-group">
            <label for="borrowBookNum">已借阅数:</label>
            <input type="text" class="form-control" id="borrowBookNum" name="borrowBookNum" placeholder="输入已借阅数:"
                   value="${user.borrowBookNum}"/>
        </div>
        <div class="form-group">
            <label for="allowAmountBookNum">最大允许借阅数:</label>
            <input type="text" class="form-control" id="allowAmountBookNum" name="allowAmountBookNum" placeholder="输入最大允许借阅数:"
                   value="${user.allowAmountBookNum}"/>
        </div>
        <div class="form-group">
            <label for="defaultTimes">违约次数:</label>
            <input type="text" class="form-control" id="defaultTimes" name="defaultTimes" placeholder="输入违约次数:"
                   value="${user.defaultTimes}"/>
        </div>
        <div class="form-group">
            <label for="defaultTotalDay">违约天数:</label>
            <input type="text" class="form-control" id="defaultTotalDay" name="defaultTotalDay" placeholder="输入违约天数:"
                   value="${user.defaultTotalDay}"/>
        </div>
        <div class="form-group">
            <label for="userGender">性别:</label>
            <c:if test="${user.userGender == 0 || user.userGender.equals(null)}">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="userGender" id="userGender" value="0" checked>男性</label>
                    <label class="radio-inline">
                        <input type="radio" name="userGender" id="userGender" value="1" >女性</label>
                </div>
            </c:if>
            <c:if test="${user.userGender == 1}">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="userGender" id="userGender" value="0" >男性</label>
                    <label class="radio-inline">
                        <input type="radio" name="userGender" id="userGender" value="1" checked>女性</label>
                </div>
            </c:if>
            <div class="control-group">
                <label class="control-label">生日</label>
                <div class="controls input-append date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" >
                    <input size="16" type="text" value="${user.birthday}" readonly id = "birthday" name="birthday">
                    <span class="add-on"><i class="icon-remove"></i></span>
                    <span class="add-on"><i class="icon-th"></i></span>
                </div>
                <input type="hidden" id="dtp_input2" value=""/><br/>
            </div>



        </div>
        <!-- 把 id 一并写入 userP 中 -->
        <input type="hidden" id="id" name="id" value="${user.id}"/>

        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
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
</html>