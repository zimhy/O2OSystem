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
  
        <!--获取teacherCustom对象  -->
        <% TeacherCustom tc=(TeacherCustom)session.getAttribute("teacherCustom");
            %>
        
<div class="container">
  <div class="row main">
    <div class="col-md-3 sidebar">
      <div class="info">
        <img class="avatar" src="../img/ph.png" alt="touxiang">
        <p class="usrname"><%=tc.getTeacherName() %></p>
      </div>
      <div class="side-nav">
        <a href="#" class="active">编辑账户信息</a>
        <a href="tm-identity.jsp">编辑认证信息</a>
        <a href="tm-postCourse.jsp">发布课程</a>
        <a href="tm.jsp">我的课程</a>
        <a href="tm-historyCourse.jsp">历史课程</a>
      </div>
    </div>
    <div class="col-md-7 col-md-offset-1">
      <div class="col-md-8">
        <form action="/ArtEducation/teacher/editTeacherInfo.action" method="post">
          <input type="text" style="display:none" name="teacherId" value='<%=tc.getTeacherId()%>'>
          <div class="form-group">
            <label for="email">邮箱</label>
            <input type="email" id="email" class="form-control" name="email" value='<%=tc.getEmail() %>' required >
          
          </div>
          <div class="form-group">
            <label for="teacherName">用户名</label>
            <input type="text" id="teacherName" class="form-control" name="teacherName" value='<%=tc.getTeacherName() %>' required>
            <% 
            if(session.getAttribute("editTeacherInfo")!=null){ String editTeacherInfo=(String)session.getAttribute("editTeacherInfo");%> 
	            <c:if test='<%=editTeacherInfo.equals("9001") %>'>
	                <p style="color:red;">邮箱已存在</p>
	            </c:if> 
	           
	            <c:if test='<%=editTeacherInfo.equals("9009") %>'>
	                <p style="color:red;">其他原因导致修改失败</p>
	            </c:if> 
	           
	            <c:if test='<%=editTeacherInfo.equals("9002") %>'>
	               <p style="color:red;">用户名已存在</p>
	            </c:if> 
            
            <%session.removeAttribute("editTeacherInfo");} %>
          </div>
          <div class="form-group">
            <a class="btn btn-info" href="editpwd.jsp" target="_blank">修改密码</a>
          </div>
          <div class="form-group">
            <label for="name">真实姓名</label>
            <input type="text" id="name" class="form-control" name="realName" value='<%=tc.getRealName() %>' required>
          </div>
          <div class="form-group">
            <span>性别</span>
              <span style="padding-left: 15px;">
              
              <c:if test='<%=tc.getGender().equals("男") %>'>
                  <input type="radio" name="gender" value="女" required ><label>女</label>
                  <input type="radio" name="gender" value="男" checked="checked" required><label>男</label>
              </c:if>
              
              <c:if test='<%=tc.getGender().equals("女") %>'>
                  <input type="radio" name="gender" value="女" required  checked="checked"><label>女</label>
                  <input type="radio" name="gender" value="男" required><label>男</label>
              </c:if>
                
              </span>
          </div>
          <div class="form-group">
            <label for="teacherAge">年龄</label>
            <input type="text" id="teacherAge" class="form-control" name="teacherAge" value='<%=tc.getTeacherAge() %>' required>
          </div>
          <div class="form-group">
            <label for="IDNumber">身份证号</label>
            <input type="text" id="IDNumber" class="form-control" name="idNumber" value='<%=tc.getIdNumber() %>' required>
          </div>
          <div class="form-group">
            <label for="preference">教学内容</label>
            <input type="text" id="preference" class="form-control" name="preference" value='<%=tc.getPreference() %>' required>
          </div>
          <div class="form-group">
            <label for="education">最高学历</label>
            <select name="education" id="education" style="width:100px;margin-left:15px;" required>
              <c:if test='<%=tc.getEducation().equals("本科/专科") %>'>
                <option value="本科/专科" selected>本科/专科</option>
                <option value="硕士">硕士</option>
              </c:if>
              <c:if test='<%=tc.getEducation().equals("硕士") %>'>
                <option value="本科/专科" >本科/专科</option>
              <option value="硕士" selected>硕士</option>
              </c:if>
            </select>
          </div>
          <div class="form-group">
            <label for="seniority">教龄</label>
            <select name="seniority" id="seniority" style="width:100px;margin-left:43px;" required>
            
              <% for(int i=1;i<=7;i++){
            	  if(tc.getSeniority()==i){
            	  %>
            	  <option value='<%=i %>' selected><%= i%>年</option>
              <%}else{%>
                   <option value='<%=i%>'><%=i%>年</option>
              <%} 
              }if(tc.getSeniority()==8){%> 
                 <option value="8" selected>七年以上</option>
              <%}else{ %>
                 <option value="8" >七年以上</option>
              <%} %>
              
            </select>
          </div>
          <div class="form-group">
            <label for="phone">联系方式(手机/固话)</label>
            <input type="text" id="phone" class="form-control" name="phone" value='<%=tc.getPhone() %>' required>
          </div>
          <div class="form-group">
            <span>工作类型</span>
              <span style="padding-left: 15px">
               <c:if test='<%=tc.getTeacherType().equals("3001") %>'>
                  <input type="radio" name="teacherType" value="3001" required checked><label>兼职</label>
                  <input type="radio" name="teacherType" value="3002" required><label>全职</label>
                </c:if>
                <c:if test='<%=tc.getTeacherType().equals("3002") %>'>
                  <input type="radio" name="teacherType" value="3001" required ><label>兼职</label>
                  <input type="radio" name="teacherType" value="3002" required checked><label>全职</label>
                </c:if>  
              <!--    <input type="radio" name="teacherType" value="3001" required checked><label>兼职</label>
                  <input type="radio" name="teacherType" value="3002" required><label>全职</label> -->
              </span>
          </div>
          <div class="form-group">
            <label for="description">自我介绍</label>
            <textarea id="description" class="form-control" name="description"  cols="30" rows="10" >
            <%=tc.getDescription() %>
            </textarea>
          </div>
          <div class="form-group row">
            <div class="col-md-4 col-md-offset-4">
              <button class="btn btn-block btn-danger" type="submit">提交</button>
            </div>
          </div>
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