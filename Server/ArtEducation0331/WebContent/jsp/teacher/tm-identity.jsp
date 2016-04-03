<%@page import="cn.itcast.ssm.po.TeacherCustom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta charset="UTF-8">
    <title>教师管理</title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/jqueryui/1.11.4/jquery-ui.css" rel="stylesheet">
    <link href="../css/sidenav.css" rel="stylesheet">
    <link href="../css/header.css" rel="stylesheet">
    <link href="../css/course.css" rel="stylesheet">
</head>
<body ng-app="tmApp">
<header class="container-fluid">
    <div class="row">
        <div class="col-md-6"><a href="index.html"><img class="logo" src="" alt="website logo"></a>
            <p class="slogan">艺宝,您身边的艺术教师!</p>
        </div>
        <div class="col-md-6">
            <!--<div class="login">
              <a href="signup/signup.html">教师入驻</a>
              <a href="#" class="ssin">教师登录</a>
              <a href="#" class="ssin">机构登录</a>
            </div>-->
            <div class="login">
                <a href="">登出</a>
            </div>
            <div class="buttons">
                <a href="../index.html#main" class="btn" data-toggle="tab">首页</a>
                <a href="../index.html#activities" class="btn" data-toggle="tab">活动</a>
                <a href="../index.html#help" class="btn" data-toggle="tab">帮助</a>
                <a href="../index.html#contactus" class="btn" data-toggle="tab">联系我们</a>
            </div>
        </div>
    </div>
</header>
 <%TeacherCustom tc=(TeacherCustom)session.getAttribute("teacherCustom"); %>
<div class="container">
    <div class="row main">
        <div class="col-md-3 sidebar">
            <div class="info">
                <img class="avatar" src="../img/main.jpg" alt="touxiang">
                <p class="usrname"><%=tc.getTeacherName() %></p>
            </div>
            <div class="side-nav">
                <a href="tm-profile.jsp">编辑账户信息</a>
                <a href="#" class="active">编辑认证信息</a>
                <a href="tm-postCourse.html">发布课程</a>
                <a href="tm.jsp">我的课程</a>
                <a href="tm-historyCourse.html">历史课程</a>
            </div>
        </div>
        <div class="col-md-7 col-md-offset-1">
            <h2 style="margin-bottom:30px;">请提交您的身份证及学历证书清晰照片</h2>
            <div class="col-md-6">
              
                <form action="/ArtEducation/teacher/editTeacherDipPic.action" class="form-group" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="teacherId" value='<%=tc.getTeacherId()%>'/>
                    <div class="form-group">
                        <label for="idPic">身份证照片(要带身份证号的一面)</label>
                        <img class="pic" src='/ArtEducation/pic/<%=tc.getIdPic() %>' alt="">
                        <input type="file" id="idPic" name="idPic" required>
                    </div>
                    <div class="form-group">
                        <label for="diplomaPic">本科/专科毕业证照片</label>
                        <img class="pic" src='/ArtEducation/pic/<%=tc.getDiplomaPic() %>' alt="">
                        <input type="file" id="diplomaPic" name="diplomaPic">
                    </div>
                    <div class="form-group">
                        <label for="masterDiplomaPic">硕士毕业证照片</label>
                        <img class="pic" src='/ArtEducation/pic/<%=tc.getMasterDiplomaPic() %>' alt="">
                        <input type="file" id="masterDiplomaPic" name="masterDiplomaPic">
                    </div>
                    <button type="submit" class="btn btn-danger">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>
<footer class="container-fluid" style="height: 100px;background-color: #4d99f5;text-align: center;">
    <div class="row" style="color:#fff;">
        &copy底部信息
    </div>
</footer>
<!--<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>-->
<!--<script src="http://cdn.bootcss.com/jqueryui/1.11.4/jquery-ui.js"></script>-->
<!--<script src="http://cdn.bootcss.com/angular.js/1.5.0/angular.min.js"></script>-->
<!--<script src="http://cdn.bootcss.com/angular.js/1.5.0/angular-animate.min.js"></script>-->
<!--<script src="http://cdn.bootcss.com/angular-ui-router/1.0.0-alpha0/angular-ui-router.min.js"></script>-->
<!--<script src="http://cdn.bootcss.com/angular.js/1.5.0/angular-resource.min.js"></script>-->
<!--<script src="http://cdn.bootcss.com/angular-ui-date/1.0.0-beta.3/date.min.js"></script>-->
<!--<script src="../js/tmApp.js"></script>-->
</body>
</html>