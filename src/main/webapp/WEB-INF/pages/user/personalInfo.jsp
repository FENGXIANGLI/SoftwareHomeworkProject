<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
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

    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

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

    <script type="text/javascript">
        function checkpwd(){
            var p1=document.modalForm.modifyPassword.value;//获取密码框的值
            var p2=document.modalForm.confirmModifyPassword.value;//获取重新输入的密码值
            if(p1==""){
                document.getElementById("msg").innerHTML="密码为空请输入密码！";
                return false;//退出检测函数
            }//如果允许空密码，可取消这个条件

            if(p1!=p2){//判断两次输入的值是否一致，不一致则显示错误信息
                document.getElementById("msg").innerHTML="两次输入密码不一致，请重新输入";//在div显示错误信息
                return false;
            }else{
                //密码一致，可以继续下一步操作
            }
        }

    </script>

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
<body id="user-profile">
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

                    <c:if test="${userGender == 0||userGender == null}">
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
                        <a href="/user/personalInfo" class="btn btn-default btn-lg" role="button">修改个人资料</a>
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
                        <li ><a href="/user/showAllTransaction">借书订单</a></li>
                        <li class="active"><a href="/user/personalInfo">个人信息</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-10" id="ucenterbox">

                <div class="infobox">
                    <div class="row info_header">
                        <div class="col-md-12">
                            <h5 class="tit">个人信息</h5>
                        </div>
                    </div>
                    <div class="row binfo">
                        <div class="col-md-12">
                            <dl>
                                <dt>登陆密码：</dt>
                                <dd>
                                    <span class="c">**************</span>


                                    <button class="btn btn-primary btn-sm" data-toggle="modal"
                                            data-target="#myModal">
                                        修改密码
                                    </button>

                                    <c:if test="${!empty succeedModify}"><dt style="color: mediumaquamarine">修改成功!</dt></c:if>


                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                         aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close"
                                                            data-dismiss="modal" aria-hidden="true">
                                                        &times;
                                                    </button>
                                                    <h4 class="modal-title" id="myModalLabel">
                                                        修改密码
                                                    </h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form:form action="/user/modifyPassword/${consumer.id}" method="post" commandName="registerUser" role="form" name="modalForm">
                                                        <div id="msg" style="color:red;"></div>
                                                        <div class="form-group">
                                                            <div class="left-container"><label for="modifyPassword">输入修改密码:</label></div>
                                                            <input type="text" class="form-control" id="modifyPassword" name="modifyPassword" placeholder="输入修改密码"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="left-container"><label for="confirmModifyPassword">输入确认密码:</label></div>
                                                            <input type="text" class="form-control" id="confirmModifyPassword" name="confirmModifyPassword" placeholder="输入确认密码:" onchange="checkpwd()"/>
                                                        </div>
                                                        <button type="submit" class="btn btn-primary" >
                                                            提交更改
                                                        </button>

                                                        <button type="button" class="btn btn-default"
                                                                data-dismiss="modal">关闭
                                                        </button>

                                                    </form:form>
                                                </div>
                                                <div class="modal-footer">
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal -->
                                    </div>
                                </dd>
                            </dl>
                        </div>
                    </div>

                    <form id="profileForm" action="/user/updateProfile/${consumer.id}", method="post" commandName="updatePersonalUser" role="form">

                        <div class="row minfo">
                            <div class="col-md-12">
                                <dl>
                                    <dt>昵称：</dt>
                                    <dd>
                                        <input type="text" name="nickname" id="nickname" class="form-control" maxlength="10" value="${consumer.nickname}" ></dd>
                                </dl>
                                <dl>
                                    <dt>姓:</dt>
                                    <dd>
                                        <input type="text" name="lastName" id="lastName" class="form-control" value="${consumer.lastName}" ></dd>
                                </dl>
                                <dl>
                                    <dt>名:</dt>
                                    <dd>
                                        <input type="text" name="firstName" id="firstName" value="${consumer.firstName}" ></dd>
                                </dl>
                                <dl>
                                    <dt>院系:</dt>
                                    <dd>
                                        <input type="text" name="department" id="department" class="form-control" value="${consumer.department}" ></dd>
                                </dl>
                                <dl>
                                    <dt>性别</dt>
                                    <dd>
                                        <c:if test="${consumer.userGender == 0 || consumer.userGender == null}">
                                            <div class="radio">
                                                <label class="radio-inline">
                                                    <input type="radio" name="userGender" id="userGender" value="0" checked>男性</label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="userGender" id="userGender" value="1" >女性</label>
                                            </div>
                                        </c:if>
                                        <c:if test="${consumer.userGender == 1}">
                                            <div class="radio">
                                                <label class="radio-inline">
                                                    <input type="radio" name="userGender" id="userGender" value="0" >男性</label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="userGender" id="userGender" value="1" checked>女性</label>
                                            </div>
                                        </c:if>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>已借阅数:</dt>
                                    <dd>
                                        <span class="c">${consumer.borrowBookNum}</span>
                                        本
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>允许借阅数:</dt>
                                    <dd>
                                        <span class="c">${consumer.allowAmountBookNum}</span>
                                        本
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>违约次数:</dt>
                                    <dd>
                                        <span class="c">${consumer.defaultTimes}</span>
                                        次
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>违约总天数:</dt>
                                    <dd>
                                        <span class="c">${consumer.defaultTotalDay}</span>
                                        天
                                    </dd>
                                </dl>
                            </div>
                        </div>

                        <div class="row minfo">
                            <div class="col-md-12">
                                <dl class="add_adr_btn">
                                    <dt>&nbsp;</dt>
                                    <dd>
                                        <button type="submit" class="btn btn-default">确认</button>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </form>
                </div>
                <script src="http://static.show.wepiao.com/pc/js/controllers/sign/Login.js"></script>
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