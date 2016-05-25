<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta property="qc:admins" content="2151727555767501176375" />
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>北京大学图书管理用户个人中心</title>
    <link rel="stylesheet" href="http://static.show.wepiao.com/pc/css/bootstrap.min.css?v=94dc0e9">
    <link rel="stylesheet" href="http://static.show.wepiao.com/pc/css/flexslider.css?v=94dc0e9">
    <link rel="stylesheet" href="http://static.show.wepiao.com/pc/css/common.css?v=94dc0e9">
    <link rel="stylesheet" href="http://static.show.wepiao.com/pc/css/uploadfile.css?v=94dc0e9" >
    <link rel="stylesheet" href="http://static.show.wepiao.com/pc/css/style.css?v=94dc0e9">
    <link rel="stylesheet" href="http://static.show.wepiao.com/pc/css/media.css?v=94dc0e9">
    <script src="http://static.show.wepiao.com/pc/js/libs/jquery.min.js?v=94dc0e9"></script>
    <script src="http://static.show.wepiao.com/pc/js/libs/bootstrap.min1.js?v=94dc0e9"></script>
    <script src="http://static.show.wepiao.com/pc/js/libs/uploadify/jquery.uploadify.js?v=94dc0e9"></script>

    <!--[if lt IE 9]><script src="http://img1.imgtn.bdimg.com/it/u=244269498,1791948139&fm=21&gp=0.jpg"></script><![endif]-->
    <!--<script src="http://static.show.wepiao.com/pc/js/ie-emulation-modes-warning.js?v=94dc0e9"></script>-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="http://static.show.wepiao.com/pc/js/libs/html5shiv.min.js?v=94dc0e9"></script>
    <script src="http://static.show.wepiao.com/pc/js/libs/respond.min.js?v=94dc0e9"></script>
    <link href="http://static.show.wepiao.com/pc/html/respond-proxy.html?v=94dc0e9" id="respond-proxy" rel="respond-proxy" />
    <link href="http://wepiao.com/pc/html/respond.proxy.gif" id="respond-redirect" rel="respond-redirect" />
    <script src="http://wepiao.com/pc/html/respond.proxy.js"></script>
    <![endif]-->

    <script type="text/javascript" src="http://static.show.wepiao.com/pc/js/libs/sea.js?v=94dc0e9"></script>
    <script>var staticUri='http://static.show.wepiao.com', staticVersion='94dc0e9', token='9dccb02d10743fc0abaafecf97948cc9',customApp=[], apiUrl='http://www.wepiao.com/api', userId='2d5fc12dcc52dba05aad69e07f49a625', thumbUri = "", curCity=null, isStatic=0,uploadUrl= "http://static.show.wepiao.com/uploading";</script>
    <script>customApp = ['C/user/order','Main',''];</script>
    <script src="http://static.show.wepiao.com/pc/js/init.js?v=94dc0e9"></script>

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
        <script type="text/javascript" src="http://static.show.wepiao.com/pc/js/libs/ieTip.js?v=94dc0e9"></script>
        <!--<script type="text/javascript">
            var ele = document.getElementById('iknow');
            var ieTipCover = document.getElementById('kie-bar');
            ele.onclick = function(){
                ieTipCover.style.display="none";
            }
        </script>-->
    <![endif]-->
</head>
<body id="user-order">
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
                        <a href="/" class="navbar-brand weipiao-title">
                        </a>
                    </div>
                </div>
                <!-- 城市筛选 start -->
                <div class="region">
                    <div class="showRegion">
                        <span class="region_city">在馆图书</span>
                        <span class="region_point"></span>
                    </div>
                    <div class="regionChooseWindow">
                        <div class="regionTop hotCity">
                            <p>当前<a href="/index.php?r=item/search">现在馆</a>共有<span class="count"></span>${bookNumber}本</p>
                            <div class="closeWin"></div>
                            <div class="arrow"></div>
                        </div>
                        <div class="regionCont active clearfix">
                        </div>
                    </div>
                </div>
                <!-- 城市筛选 end -->
                <div class="" id="wepiao-navbar-collapse-1">
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
                                <a href="/index.php?r=user/order" class="first">借书单</a>
                                <a href="/index.php?r=user/profile#profile-top">个人设置</a>
                                <a href="/logout">退出</a>
                            </div>
                        </div>
                        <div class="searchCon clearfix">
                            <input type="text" value="搜索书籍" id="keyword">
                            <a href="/serverLogin" class="newseach_click"></a>
                            <%--<div class="searchPan">--%>
                                <%--<a href="javascript:void(0);" value="show" class="show">演出</a>--%>
                                <%--<a href="javascript:void(0);" value="vanue" class="vanue">场馆</a>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Brand and toggle get grouped for better mobile display -->
        </div>
    </nav>
</div>



<div class="banner_warp my_warp_container">
    <div class="container user-top">
        <div class="row">
            <div class="thumbnail">
                <form id="avatar_form" action="/SpringMVC006/springUpload" enctype="multipart/form-data" style="display:none;" method="POST" target="avatar_iframe">
                    <input id="avatar_input" name="picture" type="file" class="file" accept="image/*" />
                </form>
                <c:if test="${empty imgAddress}">
                <img id = "avatar_img" width="100" height="100" src="http://static.show.wepiao.com/thumb/auto/80/107//pc/img/defaultpic.gif" class="circle">
                </c:if>
                <c:if test="${!empty imgAddress}">
                    <img id = "avatar_img" width="100" height="100" src="/portraitImg/images/${imgAddress}" >
                </c:if>
                <%--<form name="Form2" action="/SpringMVC006/springUpload" method="post"  enctype="multipart/form-data">--%>
                <%--<input type="file" name="file">--%>
                    <%--<input type="submit" value="upload"/>--%>
                <%--</form>--%>
                <div class="caption text-center">

                    <c:if test="${userGender == 0}">
                    <h3 class="un">
                        <span class=""><img src="http://static.show.wepiao.com/pc/img/man.png"></span>
                        <%--http://static.show.wepiao.com/pc/img/women.png--%>
                    </h3>
                    </c:if>
                    <c:if test="${userGender == 1}">
                        <h3 class="un">
                            <span class=""><img src="http://static.show.wepiao.com/pc/img/women.png"></span>
                                <%--http://static.show.wepiao.com/pc/img/women.png--%>
                        </h3>
                    </c:if>
                    <p>
                        <a href="http://wepiao.com/index.php?r=user/profile#profile-top" class="btn btn-default btn-lg" role="button">修改个人资料</a>
                    </p>
                </div>
                <br>
            </div>
        </div>
    </div>
</div>
<a id="profile-top" style="position:absolute;top:522px;"></a>
<div class="my_center" id="user_center_box">
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <nav class="my_center_sidenav">
                    <ul class="nav text-right">
                        <li class="active"><a href="http://wepiao.com/index.php?r=user/order#profile-top">借书订单</a></li>
                        <li><a href="http://wepiao.com/index.php?r=user/profile#profile-top">个人信息</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-10" id="ucenterbox">

                <div class="ucentertab row">
                    <ul>
                        <li class="on"><a href="http://wepiao.com/index.php?r=user/order#profile-top">全部</a> </li>
                        <li class=""><a href="http://wepiao.com/index.php?r=user/order/status/1#profile-top">待还借书单</a></li>
                        <li class=""><a href="http://wepiao.com/index.php?r=user/order/status/2#profile-top">完成借书单</a></li>
                    </ul>
                </div>

                <c:if test="${empty transactionList}">
                    <h2>暂无借书单</h2>
                </c:if>


                <c:if test="${empty transactionList}">

                    <c:forEach items="transactionList" var="transaction">
                        <div class="infobox order_list" data="861">
                            <div class="row info_header">
                                <div class="col-md-3">
                                    <p>
                                        订单编号：
                                        <span>${transaction.id}</span>
                                    </p>
                                </div>
                                <div class="col-md-3">
                                    <p>
                                        时间：
                                        <span>${transaction.borrowTime}</span>
                                    </p>
                                </div>
                                <div class="col-md-2">
                                    <p>
                                        <span></span>
                                    </p>
                                </div>
                                <div class="col-md-2 uploadCard"></div>
                                <div class="col-md-2 stu">
                                    <p>
                                        状态：
                                        <c:if test="${transaction.returnOrNot == 0} "><span>未归还</span></c:if>
                                        <c:if test="${transaction.returnOrNot == 1} "><span>归还</span></c:if>
                                    </p>
                                </div>
                            </div>
                            <div class="row order_info">
                                <div class="col-md-8 o_i_des">
                                    <dl>
                                        <dt>
                                            <img src="/portraitImg/images/${transaction.bookName}_book.jpg"></dt>
                                        <dd>
                                            <p class="t n">${transaction.bookName}</p>
                                            <p class="t p">在馆地址：${transaction.location}</p>
                                            <p class="t t"></p>
                                            <div class="t s clearfix">
                                                <p class="l">
                                                    <span>1</span>
                                                    张
                                                </p>
                                                <p class="r">
                                                    <label>待还最晚日期：</label>
                                                    <span>${transaction.shouldReturnTime}</span>

                                                </p>
                                            </div>
                                            <ul class="arealist clearfix"></ul>
                                        </dd>
                                    </dl>
                                </div>
                                <div class="col-md-4 o_i_piao">
                                    <ul>
                                        <li>
                                            <label>借书人学号:</label>
                                            ${transaction.userId}
                                        </li>
                                        <li>
                                            <label>借书人姓名:</label>
                                            ${transaction.borrowName}
                                        </li>

                                    </ul>
                                    <div class="op">
                                            <%--<a class="opbtn cancel" href="http://wepiao.com/index.php?r=user/cancelOrder/id/14641472614415#profile-top" onclick="prop_comfirm(arguments[0]);" >取消订单</a>--%>
                                        <a class="opbtn pay" href="http://wepiao.com/index.php?r=payment/index/orderId/14641472614415#profile-top">
                                            还书
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <div class="infobox order_list" data="861">
                        <div class="row info_header">
                            <div class="col-md-3">
                                <p>
                                    订单编号：
                                    <span>14641472614415</span>
                                </p>
                            </div>
                            <div class="col-md-3">
                                <p>
                                    时间：
                                    <span>2016-05-25 11:34:22</span>
                                </p>
                            </div>
                            <div class="col-md-2">
                                <p>

                                    <span></span>
                                </p>
                            </div>
                            <div class="col-md-2 uploadCard"></div>
                            <div class="col-md-2 stu">
                                <p>
                                    状态：
                                    <span>未归还</span>
                                </p>
                            </div>
                        </div>
                        <div class="row order_info">
                            <div class="col-md-8 o_i_des">
                                <dl>
                                    <dt>
                                        <img src="/portraitImg/images/${imgBookAddress}"></dt>
                                    <dd>
                                        <p class="t n">[北京]BJCC北京漫控潮流博览会</p>
                                        <p class="t p">在馆地址：中国国际展览中心(新馆)E1馆</p>
                                        <p class="t t">06月09日 周四</p>
                                        <div class="t s clearfix">
                                            <p class="l">
                                                <span>1</span>
                                                张
                                            </p>
                                            <p class="r">
                                                <label>待还最晚日期：</label>
                                                <span>180</span>
                                                元
                                            </p>
                                        </div>
                                        <ul class="arealist clearfix"></ul>
                                    </dd>
                                </dl>
                            </div>
                            <div class="col-md-4 o_i_piao">
                                <ul>
                                    <li>
                                        <label>借书人学号:</label>
                                        18811465446
                                    </li>
                                    <li>
                                        <label>借书人姓名:</label>
                                        展览当日7:00-16:00北京中国国际展览中心 (新馆)南入口兑票处换取实体票
                                    </li>

                                </ul>
                                <div class="op">
                                    <%--<a class="opbtn cancel" href="http://wepiao.com/index.php?r=user/cancelOrder/id/14641472614415#profile-top" onclick="prop_comfirm(arguments[0]);" >取消订单</a>--%>
                                    <a class="opbtn pay" href="http://wepiao.com/index.php?r=payment/index/orderId/14641472614415#profile-top">
                                        还书
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
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
<script src="http://static.show.wepiao.com/pc/js/libs/ie10-viewport-bug-workaround.js?v=94dc0e9"></script>

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
    jQuery('#avatar_img').click(function(click){
        jQuery('#avatar_input').click();
    });
    jQuery('#avatar_input').change(function(click){
        jQuery('#avatar_form').submit();
    });
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
