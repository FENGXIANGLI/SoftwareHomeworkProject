<%--
  Created by IntelliJ IDEA.
  User: fengxiangli
  Date: 16/5/23
  Time: 下午4:52
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
  <title>SpringMVC 添加书籍</title>

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
  <h1>添加书籍</h1>
  <hr/>
  <c:if test="${empty root}"><a href="/admin/users" type="button" class="btn btn-primary btn-sm">返回</a></h3></c:if>
  <c:if test="${!empty root}"><a href="/admin/adminUsers/users" type="button" class="btn btn-primary btn-sm">返回</a></h3></c:if>
  <form:form action="/admin/books/addP" method="post" commandName="book" role="form" enctype="multipart/form-data">
    <div class="form-group">
      <label for="bookName">书名:</label>
      <input type="text" class="form-control" id="bookName" name="bookName" placeholder="输入书名:"/>
    </div>
    <div class="form-group">
      <label for="isbn">isbn号:</label>
      <input type="text" class="form-control" id="isbn" name="isbn" placeholder="输入isbn号:"/>
    </div>
    <div class="form-group">
      <label for="author">作者:</label>
      <input type="text" class="form-control" id="author" name="author" placeholder="输入作者号:"/>
    </div>
    <div class="form-group">
      <label for="press">出版社:</label>
      <input type="text" class="form-control" id="press" name="press" placeholder="输入出版社:"/>
    </div>
    <div class="form-group">
      <label for="summary">概要:</label>
      <input type="text" class="form-control" id="summary" name="summary" placeholder="输入概要:"/>
    </div>
    <div class="form-group">
      <label for="location">馆藏位置:</label>
      <input type="text" class="form-control" id="location" name="location" placeholder="输入馆藏位置:"/>
    </div>
    <div class="form-group">
      <label for="price">价格:</label>
      <input type="text" class="form-control" id="price" name="price" placeholder="输入价格:"/>
    </div>
    <div class="form-group">
      <label for="idBorrowed">借阅人学号:</label>
      <input type="text" class="form-control" id="idBorrowed" name="idBorrowed" placeholder="输入借阅人学号:"/>
    </div>
    <div class="form-group">
      <label for="atLibOrNot">书籍数目:</label>
      <input type="text" class="form-control" id="atLibOrNot" name="atLibOrNot" placeholder="输入添加的数目总数:"/>
    </div>
    <div class="form-group">
      <label for="bookNumber">书籍页数:</label>
      <input type="text" class="form-control" id="bookNumber" name="bookNumber" placeholder="输入书籍页数"/>
    </div>
    <div class="form-group">
        <input id="avatar_input" name="picture" type="file" class="file" accept="image/*" />
    </div>

    <div class="form-group">
      <button type="submit" class="btn btn-sm btn-success">提交</button>
    </div>

  </form:form>


</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>

