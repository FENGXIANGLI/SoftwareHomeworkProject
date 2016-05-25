<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fengxiangli
  Date: 16/5/23
  Time: 下午3:39
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
  <h1>${userBorrowedName}用户借书详情</h1>
  <hr/>
  <!-- 如果用户列表为空 -->
  <c:if test="${empty bookList}">
    <div class="alert alert-warning" role="alert">
      <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>用户没有任何借书
    </div>
  </c:if>

  <!-- 如果用户列表非空 -->
  <c:if test="${!empty bookList}">
    <table class="table table-bordered table-striped">
      <tr>
        <th>书名</th>
        <th>索书号</th>
        <th>作者</th>
        <th>出版社</th>
        <th>ISBN号</th>
        <th>操作</th>
      </tr>

      <c:forEach items="${bookList}" var="book">
        <tr>
          <td>${book.bookName}</td>
          <td>${book.id}</td>
          <td>${book.author}</td>
          <td>${book.press}</td>
          <td>${book.isbn}</td>
          <td>
            <a href="/admin/books/show/${book.id}" type="button" class="btn btn-sm btn-success">详情</a>
            <a href="/admin/books/update/${book.id}" type="button" class="btn btn-sm btn-warning">修改</a>
            <a href="/admin/books/delete/${book.id}" type="button" class="btn btn-sm btn-danger">删除</a>
          </td>
        </tr>
      </c:forEach>
    </table>
  </c:if>
  <a href="/admin/users/show/${userPId}" type="button" class="btn btn-primary btn-sm">返回</a></h3>
</div>

</body>
</html>
