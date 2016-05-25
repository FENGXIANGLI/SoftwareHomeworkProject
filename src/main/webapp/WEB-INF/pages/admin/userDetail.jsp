<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC 用户详情</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <h1>用户详情</h1>
    <hr/>
    <a href="/admin/users" type="button" class="btn btn-primary btn-sm">返回</a></h3>
    <table class="table table-bordered table-striped">
        <tr>
            <th>账号</th>
            <td>${user.account}</td>
        </tr>
        <tr>
            <th>学号</th>
            <td>${user.studentId}</td>
        </tr>
        <tr>
            <th>First Name</th>
            <td>${user.firstName}</td>
        </tr>
        <tr>
            <th>Last Name</th>
            <td>${user.lastName}</td>
        </tr>
        <tr>
            <th>院系</th>
            <td>${user.department}</td>
        </tr>
        <tr>
            <th>欠费总额</th>
            <td>${user.debt}</td>
        </tr>
        <tr>
            <th>允许借的最多图书数目</th>
            <td>${user.allowAmountBookNum}</td>
        </tr>
        <tr>
            <th>已借书籍</th>
            <td>${user.borrowBookNum} <a href="/admin/user/bookBorrow/${user.studentId}/${user.account}/${user.id}">详情</a></td>

        </tr>
        <tr>
            <th>生日</th>
            <td>${user.birthday}</td>
        </tr>
        <tr>
            <th>违约次数</th>
            <td>${user.defaultTimes}</td>
        </tr>
        <tr>
            <th>违约天数</th>
            <td>${user.defaultTotalDay}</td>
        </tr>
    </table>
</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>