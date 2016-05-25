<%--
  Created by IntelliJ IDEA.
  User: fengxiangli
  Date: 16/5/23
  Time: 下午6:59
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
  <title>更新图书信息</title>

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
  <h1>更新图书信息</h1>
  <hr/>
  <form:form action="/admin/books/updateP" method="post" commandName="bookP" role="form">
    <div class="form-group">
      <label for="bookName">书名:</label>
      <input type="text" class="form-control" id="bookName" name="bookName" placeholder="输入 书名:"
             value="${book.bookName}"/>
    </div>
    <div class="form-group">
      <label for="isbn">ISBN:</label>
      <input type="text" class="form-control" id="isbn" name="isbn" placeholder="输入 ISBN:"
             value="${book.isbn}"/>
    </div>
    <div class="form-group">
      <label for="author">作者:</label>
      <input type="text" class="form-control" id="author" name="author" placeholder="输入 作者:"
             value="${book.author}"/>
    </div>
    <div class="form-group">
      <label for="press">出版社:</label>
      <input type="text" class="form-control" id="press" name="press" placeholder="输入 出版社:"
             value="${book.press}"/>
    </div>
    <div class="form-group">
      <label for="summary">概要:</label>
      <input type="text" class="form-control" id="summary" name="summary" placeholder="输入 概要:"
             value="${book.summary}"/>
    </div>
    <div class="form-group">
      <label for="location">馆藏地址:</label>
      <input type="text" class="form-control" id="location" name="location" placeholder="输入 馆藏地址:"
             value="${book.location}"/>
    </div>
    <div class="form-group">
      <label for="price">价格:</label>
      <input type="text" class="form-control" id="price" name="price" placeholder="输入 价格:"
             value="${book.price}"/>
    </div>
    <div class="form-group">
      <label for="atLibOrNot">是否在馆:</label>
      <c:if test="${book.atLibOrNot == 1}">
        <div class="radio">
        <label class="radio-inline">
          <input type="radio" name="userGender" id="atLibOrNot" value=0 >
          不在馆                        </label>
        <label class="radio-inline">
          <input type="radio" name="userGender" id="atLibOrNot" value=1 checked>
          在馆                        </label>
      </div></c:if>

      <c:if test="${book.atLibOrNot == 0}">
        <div class="radio">
        <label class="radio-inline">
          <input type="radio" name="userGender" id="atLibOrNot" value=0 checked>
          不在馆                        </label>
        <label class="radio-inline">
          <input type="radio" name="userGender" id="atLibOrNot" value=1 >
          在馆                        </label>
      </div></c:if>
      <c:if test="${empty book.atLibOrNot}">
        <div class="radio">
          <label class="radio-inline">
            <input type="radio" name="userGender" id="atLibOrNot" value=0 checked>
            不在馆                        </label>
          <label class="radio-inline">
            <input type="radio" name="userGender" id="atLibOrNot" value=1 >
            在馆                        </label>
        </div></c:if>

    </div>
    <div class="form-group">
      <label for="idBorrowed">借书人的学号:</label>
      <input type="text" class="form-control" id="idBorrowed" name="idBorrowed" placeholder="输入 借书人的学号:"
             value="${book.idBorrowed}"/>
    </div>
    <div class="form-group">
      <label for="bookNumber">书籍页数:</label>
      <input type="text" class="form-control" id="bookNumber" name="bookNumber" placeholder="输入 书籍页数:"
             value="${book.bookNumber}"/>
    </div>
    <!-- 把 id 一并写入 userP 中 -->
    <input type="hidden" id="id" name="id" value="${book.id}"/>

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
</html>
