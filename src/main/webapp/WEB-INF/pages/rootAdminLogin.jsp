<%--
  Created by IntelliJ IDEA.
  User: fengxiangli
  Date: 16/5/11
  Time: 下午5:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <title>北京大学图书管理系统Root管理员中心</title>

  <!-- 新 Bootstrap 核心 CSS 文件 -->
  <%--<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">--%>
  <link rel="stylesheet" href="/styles/css/reset.css">
  <link rel="stylesheet" href="/styles/css/supersized.css">
  <link rel="stylesheet" href="/styles/css/style.css">

</head>
<body>

<div class="page-container">
  <h1>北京大学图书管理系统管理员中心</h1>
  <c:if test="${not empty error}">
    <br/>
    <h2><font color="red">${error}</font></h2>
  </c:if>
  <c:if test="${not empty userName}">
    <br/>
    <h2><font color="red">${userName}</font></h2>
  </c:if>
  <form:form action="/serverLogin" method="post" commandName="registerUser" role = "form">
    <div class="form-group">
      <input type="text" name="username" class="form-control" placeholder="用户名" >
    </div>
    <div class="form-group">
      <input type="password" name="password" class="form-control" placeholder="密码">
    </div>
    <div class="form-group">
      <button type="submit">登陆</button>
    </div>
  </form:form>
</div>

<script>
  function register(){
    window.location.href="/user/register";
  }
</script>
<script src="/javascript/js/jquery-1.8.2.min.js"></script>
<script src="/javascript/js/supersized.3.2.7.min.js"></script>
<script src="/javascript/js/supersized-init.js"></script>
<script src="/javascript/js/scripts.js"></script>



</body>
</html>
