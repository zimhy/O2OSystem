<%@page import="cn.itcast.ssm.po.TeacherCustom"%>
<%@page import="cn.itcast.ssm.view.TeacherCoursesView"%>
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
    <div class="container">
      <div class="row main">
        <div class="col-md-3 sidebar">
          <div class="info">
            <img class="avatar" src="../img/ph.png" alt="touxiang">
            <p class="usrname">
            <% TeacherCustom tc=(TeacherCustom)session.getAttribute("teacherCustom");%>
            <%=tc.getTeacherName() %>
            </p>
          </div>
          <div class="side-nav">
            <a href="tm-profile.jsp">编辑账户信息</a>
            <a href="tm-identity.jsp">编辑认证信息</a>
            <a href="tm-postCourse.jsp">发布课程</a>
            <a href="#" class="active">我的课程</a>
            <a href="tm-historyCourse.jsp">历史课程</a>
          </div>
        </div>
        <div class="col-md-7 col-md-offset-1">
          <table id="hcTable" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
              <th>课程名称</th>
              <th>开始时间</th>
              <th>结束时间</th>
              <th>每节课时间</th>
              <th>地点</th>
              <th>状态</th>
              <th>操作</th>
            </tr>
           <%--  <% for(TeacherCoursesView tcv:session.getAttribute("teacherCoursesViews")){ %>
              <tr>
                <th><%=tcv.getCourseName() %></th>
                <th><%=tcv.getStartTime() %></th>
                <th><%=tcv.getEndTime() %></th>
                <th><%=tcv.getClassTime() %></th>
                <th><%=tcv.getTeachAddress() %></th>
                <th><%=tcv.getStartTime() %></th>
                <th><a href="">修改</a></th>
              </tr>
           <% }%> --%>
           <!-- 匪夷所思啊，下面必须使用单引号 -->
           <c:forEach items='<%= session.getAttribute("teacherCoursesViews")%>' var="item">
             <tr>
                <th>${item.courseName }</th>
                <th>${item.startTime }</th>
                <th>${item.endTime }</th>
                <th>${item.classTime }</th>
                <th>${item.teachAddress }</th>
                <th>${item.courseStatus }</th>
                <th><a href="tm-postCourse.html?teacherId=${item.teacherId }">修改</a></th>
              </tr>
           </c:forEach>
           
            </thead>
            <tbody></tbody>
          </table>
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
    <script src="../js/tmApp.js"></script>
  </body>
</html>