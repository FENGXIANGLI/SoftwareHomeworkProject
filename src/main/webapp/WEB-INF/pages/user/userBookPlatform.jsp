<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: fengxiangli
  Date: 16/5/27
  Time: 下午1:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="zh-cn">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta property="qc:admins" content="2151727555767501176375" />
  <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <title>北京大学图书馆</title>
  <link rel="stylesheet" href="http://static.show.wepiao.com/pc/css/bootstrap.min.css?v=dc52da8">
  <link rel="stylesheet" href="http://static.show.wepiao.com/pc/css/flexslider.css?v=dc52da8">
  <link rel="stylesheet" href="http://static.show.wepiao.com/pc/css/common.css?v=dc52da8">
  <link rel="stylesheet" href="http://static.show.wepiao.com/pc/css/uploadfile.css?v=dc52da8" >
  <link rel="stylesheet" href="http://static.show.wepiao.com/pc/css/style1.css?v=dc52da8">
  <link rel="stylesheet" href="http://static.show.wepiao.com/pc/css/seats.css?v=dc52da8">
  <link rel="stylesheet" href="http://static.show.wepiao.com/pc/css/media.css?v=dc52da8">
  <script src="http://static.show.wepiao.com/pc/js/libs/jquery.min.js?v=dc52da8"></script>
  <script src="http://static.show.wepiao.com/pc/js/libs/bootstrap.min.js?v=dc52da8"></script>
  <script src="http://static.show.wepiao.com/pc/js/libs/uploadify/jquery.uploadify.js?v=dc52da8"></script>

  <!--[if lt IE 9]><script src="http://static.show.wepiao.com/pc/js/ie8-responsive-file-warning.js?v=dc52da8"></script><![endif]-->
  <!--<script src="http://static.show.wepiao.com/pc/js/ie-emulation-modes-warning.js?v=dc52da8"></script>-->

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="http://static.show.wepiao.com/pc/js/libs/html5shiv.min.js?v=dc52da8"></script>
  <script src="http://static.show.wepiao.com/pc/js/libs/respond.min.js?v=dc52da8"></script>
  <link href="http://static.show.wepiao.com/pc/html/respond-proxy.html?v=dc52da8" id="respond-proxy" rel="respond-proxy" />
  <link href="http://www.wepiao.com/pc/html/respond.proxy.gif" id="respond-redirect" rel="respond-redirect" />
  <script src="http://www.wepiao.com/pc/html/respond.proxy.js"></script>
  <![endif]-->

  <script type="text/javascript" src="http://static.show.wepiao.com/pc/js/libs/sea.js?v=dc52da8"></script>
  <script>var staticUri='http://static.show.wepiao.com', staticVersion='dc52da8', token='1484a8e174f9b9c3ab88e898cad2cf67',customApp=[], apiUrl='http://www.wepiao.com/api', userId='2d5fc12dcc52dba05aad69e07f49a625', thumbUri = "", curCity=null, isStatic=0,uploadUrl= "http://static.show.wepiao.com/uploading";</script>
  <script>customApp = ['C/item/search','Main',''];</script>
  <script src="http://static.show.wepiao.com/pc/js/init.js?v=dc52da8"></script>

  <!-- ie9及以下浏览器升级提示 -->
  <!--[if lte IE 9]>
      <style>
          #kie-bar .ieTipBg {
              position: fixed;
              top: 0;
              left: 0;
              width: 100%;
              height: 100%;
              background: #000;
              opacity: 0.7;
              filter: alpha(opacity=50);
              z-index: 9998;
          }
          #kie-bar .tipBox {
              position: fixed;
              top: 40%;
              left: 30%;
              height: 200px;
              background: #fff;
              z-index: 9999;
              border: 1px solid #fff;
              border-radius: 10px;
              padding: 50px 90px;
              font-size: 16px;
              color: #999;
              line-height: 28px;
          }
          #kie-bar .tipBox p {
              width: 360px;
              text-align: center;
          }
          #kie-bar #iknow {
              display: block;
              width: 100px;
              height: 30px;
              line-height: 30px;
              background: #2ed2c1;
              text-align: center;
              color: #fff;
              border-radius: 3px;
              margin-top: 18px;
              margin-left: 110px;
              cursor: pointer;
          }
      </style>
      <div id="kie-bar" class="kie-bar" style="display:none">
          <div class="ieTipBg"></div>
          <div class="tipBox">
              <p class="">您的浏览器版本较低，请使用IE9及以上版本或chrome、Firefox等浏览器访问本站~</p>
              <a id="iknow">我知道了</a>
          </div>
      </div>
      <script type="text/javascript" src="http://static.show.wepiao.com/pc/js/libs/ieTip.js?v=dc52da8"></script>
      <!--<script type="text/javascript">
          var ele = document.getElementById('iknow');
          var ieTipCover = document.getElementById('kie-bar');
          ele.onclick = function(){
              ieTipCover.style.display="none";
          }
      </script>-->
  <![endif]-->
</head>
<body id="item-search">
<!-- template start -->
<!-- template end -->


<div id="top" class="header clearfix">
  <nav class="navbar navbar-weipiao navbar-default navbar-fixed-top">
    <div class="container">
      <div class="row">
        <div class="">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#wepiao-navbar-collapse-1">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
        </div>
        <!-- 城市筛选 start -->
        <div class="region">
          <div class="showRegion">
            <span class="region_city">在馆</span>
            <span class="region_point"></span>
          </div>
          <div class="regionChooseWindow">
            <div class="regionTop hotCity">
              <%
                Object bookNumbers=session.getAttribute("bookNumbers");
              %>

              <p>当前<a href="/index.php?r=item/search">现在馆</a>共有<span class="count"></span><%=bookNumbers%>本</p>
              <div class="closeWin"></div>
              <div class="arrow"></div>
            </div>
            <div class="regionCont active clearfix">

            </div>
          </div>
        </div>
        <!-- 城市筛选 end -->
        <div class="" id="wepiao-navbar-collapse-1">
          <div class="menuCon clearfix">
            <div class='navdrop'>
              <a class="my-ticket menu_item" href="/user/bookPlatform/AllBook"><span>北大图书馆</span></a>
            </div>
          </div>
        </div>
        <div class="">
          <div class="" id="login-in">

            <div id="user-state-container" class="logoOrSign">
              <div style="" class="userPhoto">
                <img alt="" src="http://static.show.wepiao.com/thumb/auto/80/107//pc/img/defaultpic.gif"></div>
              <div class="userMsg">
                <a href="javascript:void(0)">${userName}</a>
                <span class="user_point"></span>
              </div>
              <div class="userMsglist">
                <a href="/user/showAllTransaction" class="first">借书单</a>
                <a href="/user/personalInfo">个人设置</a>
                <a href="/logout">退出</a>
              </div>
            </div>

            <div class="searchCon clearfix">
              <input type="text" value="搜索书籍" id="keyword">
              <a href="/serverLogin" class="newseach_click"></a>
            </div>
          </div>
        </div>
      </div>
      <!-- Brand and toggle get grouped for better mobile display -->
    </div>
  </nav>
</div>


<div id="showTypebox" class="container">

  <div class="row">

    <div class="col-md-9 type_left">

      <div class="type_box clearfix">
        <div class="tl_item type clearfix">
          <h3>项目类别</h3>
          <ul class="i1 clearfix ul-1" >
            <li class="type-1 on" value="">全部</li>
            <li class="type-1 " value="ff8080814a7ad6f1014a7adb6b540002">已借出</li>
            <li class="type-1 " value="ff8080814aed3ba8014af14d441c0012">可借入</li>
          </ul>
        </div>
      </div>

      <c:if test="${empty bookList}">
        <h2>暂无借书单</h2>
      </c:if>

      <c:if test="${!empty resultBorrow}">
        <dt style="color: mediumaquamarine">${resultBorrow}</dt>
      </c:if>

      <div class="type_list clearfix">
        <div class="type_list_box">
      <c:if test="${!empty bookList}">

        <c:forEach items="${bookList}" var="book">

          <dl class="clearfix">
            <dt><img title="" alt="" src="/portraitImg/images/${book.bookName}_book.jpg">
            </dt>
            <dd>
              <div class="ddleft fll">
                <p class="mtit">

                  <a href="http://www.wepiao.com/index.php?r=item/detail/id/d746bb9e7da443c48d5360876ca9c26a" title="${book.bookName}">
                    ${book.bookName}                        </a>
                </p>
                <p class="ftit">图书简介:${book.summary}</p>
                <p class="ftit">作者:${book.author}</p>
                <p class="place">在馆位置:${book.location}</p>
                <c:if test="${book.atLibOrNot == 0}">
                  <p class="place">预期归还时间:${book.shouldreturnTime}</p>
                </c:if>
                <!-- <p class="op">
                        <span class="seat">选座</span>
                                                                    </p> -->
              </div>
              <div class="ddright flr">
                <c:if test="${book.atLibOrNot == 0}">
                  <span class="pre_sale wp-icon-all">已借出</span>
                </c:if>
                <c:if test="${book.atLibOrNot == 1||empty book.atLibOrNot}">
                  <span class="pre_sale wp-icon-all">可借阅</span>
                </c:if>

                <p class="price"><span>${book.price}</span>元起</p>
                <a class="buy_btn" href="/user/borrow/${book.id}/${userId}/">借入</a>
              </div>
            </dd>
          </dl>

        </c:forEach>


      </c:if>
        </div>
      </div>
      <%--</c:if>--%>




      <ul id="yw0" class="yiiPager"><li class="prev hidden"><a href="/index.php?r=item/search&amp;city=&amp;t1=&amp;t2=&amp;t3=1">首页</a></li>
        <li class="previous hidden"><a href="/index.php?r=item/search&amp;city=&amp;t1=&amp;t2=&amp;t3=1">上一页</a></li>
        <li class="page selected"><a href="/index.php?r=item/search&amp;city=&amp;t1=&amp;t2=&amp;t3=1">1</a></li>
        <li class="page"><a href="/index.php?r=item/search&amp;city=&amp;t1=&amp;t2=&amp;t3=1&amp;page=2">2</a></li>
        <li class="page"><a href="/index.php?r=item/search&amp;city=&amp;t1=&amp;t2=&amp;t3=1&amp;page=3">3</a></li>
        <li class="page"><a href="/index.php?r=item/search&amp;city=&amp;t1=&amp;t2=&amp;t3=1&amp;page=4">4</a></li>
        <li class="page"><a href="/index.php?r=item/search&amp;city=&amp;t1=&amp;t2=&amp;t3=1&amp;page=5">5</a></li>
        <li class="page"><a href="/index.php?r=item/search&amp;city=&amp;t1=&amp;t2=&amp;t3=1&amp;page=6">6</a></li>
        <li class="next"><a href="/index.php?r=item/search&amp;city=&amp;t1=&amp;t2=&amp;t3=1&amp;page=2">下一页</a></li>
        <li class="last"><a href="/index.php?r=item/search&amp;city=&amp;t1=&amp;t2=&amp;t3=1&amp;page=6">末页</a></li></ul>

    </div>

  </div>
</div>






<div class="footer">
  <div class="footerCon">
    <div class="logo footerItem">
      <%--<div class="icon" src ="http://img0.imgtn.bdimg.com/it/u=624368117,1396884415&fm=21&gp=0.jpg"></div>--%>

      <div class="instru">
        <span class="instru1">北京大学图书管理系统</span>
        <span class="instru2">Peking University Library</span>
      </div>
    </div>
    <div class="line"></div>
    <div class="phoneNumber footerItem">
      <div class="icon"></div>
      <div class="instru">
        <span class="instru1">62753907</span>
        <span class="instru2">9：00-23：00  |  全年无休</span>
      </div>
    </div>
    <div class="line"></div>
    <div class="weixin footerItem">
      <div class="icon">
        <div class="block">
          <span class="wx"></span>
          <a class="ecode e1"><img src="http://www.lib.pku.edu.cn/portal/sites/default/files/news/images/meiti-20130606-1.jpg" width="78" height="84"></a>
        </div>
        <div class="block">
          <span class="wpr"></span>
          <a class="ecode e2"><img src="http://www.lib.pku.edu.cn/portal/sites/default/files/zixunbu/images/qrcode_small.jpg" width="78" height="84"></a>
        </div>
      </div>
      <div class="instru">
        <span class="instru1">打开微信扫一扫</span>
        <!-- <span class="instru2">关注公众号购票</span> -->
      </div>
    </div>
  </div>
  <div class="companyIns row">
    <span>@北京大学2015-2016年度软工第七小组版权所有</span>
    <!-- <span>通讯地址： 北京市朝阳区姚家园南路1号恵通时代广场10号院</span> -->
  </div>
</div>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="http://static.show.wepiao.com/pc/js/libs/ie10-viewport-bug-workaround.js?v=dc52da8"></script>


<script >
  function needLogin() {
    if ('' == userId) {
      $("#sign_click").click();
      return false;
    }
    return true;
  }
</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-62400613-1', 'auto');
  ga('send', 'pageview');

  if (0 < $('#ADDGACODE').length) {
    eval($('#ADDGACODE').html());
  }
</script>
</body>
</html>
