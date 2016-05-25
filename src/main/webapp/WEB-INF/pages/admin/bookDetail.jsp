<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fengxiangli
  Date: 16/5/23
  Time: 下午3:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <title>书籍详情</title>

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
  <h1>书籍详情</h1>
  <hr/>
  <a href="/admin/users" type="button" class="btn btn-primary btn-sm">返回</a></h3>
  <table class="table table-bordered table-striped">
    <tr>
      <th>索书号</th>
      <td>${book.id}</td>
    </tr>
    <tr>
      <th>书名</th>
      <td>${book.bookName}</td>
    </tr>
    <tr>
      <th>作者</th>
      <td>${book.author}</td>
    </tr>
    <tr>
      <th>出版社</th>
      <td>${book.press}</td>
    </tr>
    <tr>
      <th>摘要</th>
      <td>${book.summary}</td>
    </tr>
    <tr>
      <th>馆藏位置</th>
      <td>${book.location}</td>
    </tr>
    <tr>
      <th>定价</th>
      <td>${book.price} </td>
    </tr>
    <tr>
      <th>馆藏情况</th>
      <c:if test = "${book.atLibOrNot == 1}"><td>在馆:${book.bookNumber}</td></c:if>
      <c:if test="${book.atLibOrNot == 0}"><td>不在馆</td></c:if>
      <c:if test="${empty book.atLibOrNot}"><td>不在馆</td></c:if>
    </tr>
  </table>
</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>