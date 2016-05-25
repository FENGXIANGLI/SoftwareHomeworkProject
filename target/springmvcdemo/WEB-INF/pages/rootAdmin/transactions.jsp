<%--
  Created by IntelliJ IDEA.
  User: fengxiangli
  Date: 16/5/25
  Time: 下午12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <title>订单管理</title>

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
  <h1>北京大学图书管理系统-管理员管理</h1>
  <hr/>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand">北京大学管理员平台</a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li ><a href="/admin/adminUsers/managers">管理员管理</a></li>
          <li ><a href="/admin/adminUsers/users">用户管理<span class="sr-only">(current)</span></a></li>
          <li><a href="/admin/adminUsers/books">图书管理</a></li>
          <li><a href="/admin/adminUsers/transactions" class="active">订单管理</a></li>
        </ul>
        <form:form action="/admin/transaction/search" class="navbar-form navbar-left" role="search">
          <div class="form-group">
            <input type="text" class="form-control" placeholder="搜索订单" name="transactionSearchContent">
          </div>
          <button type="submit" class="btn btn-default">Submit</button>
        </form:form>

        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${adminUserName}<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#">个人资料</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="/admin/user/logout">注销</a></li>
            </ul>
          </li>
        </ul>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>

  <!-- 如果用户列表为空 -->
  <c:if test="${empty transactionList}">
    <div class="alert alert-warning" role="alert">
      <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>订单表为空
    </div>
  </c:if>

  <!-- 如果用户列表非空 -->
  <c:if test="${!empty transactionList}">
    <table class="table table-bordered table-striped">
      <tr>
        <th>借书订单号</th>
        <th>借书人学号</th>
        <th>借书人姓名</th>
        <th>借书名</th>
        <th>借书索书号</th>
        <th>应还时间</th>
        <th>续借次数</th>
        <th>是否归还</th>
        <th>还书时间</th>
        <th>操作</th>
      </tr>

      <c:forEach items="${transactionList}" var="transaction">
        <tr>
          <td>${transaction.id}</td>
          <td>${transaction.userId}</td>
          <td>${transaction.borrowName}</td>
          <td>${transaction.bookName}</td>
          <td>${transaction.bookId}</td>
          <td>${transaction.shouldReturnTime}</td>
          <td>${transaction.borrowTimes}</td>
          <td>${transaction.returnOrNot}</td>
          <td>${transaction.returnTime}</td>
          <td>
            <a href="/admin/transactions/delete/${transaction.id}" type="button" class="btn btn-sm btn-danger">删除</a>
          </td>
        </tr>
      </c:forEach>
    </table>
  </c:if>
</div>
<script >
  function azsq(){
    window.location.href="/";
  }
</script>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>

