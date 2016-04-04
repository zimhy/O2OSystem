<%@page import="cn.itcast.ssm.po.TeacherCustom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>修改密码</title>
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container" style="margin-top: 30px;">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
      <% TeacherCustom tc=(TeacherCustom)session.getAttribute("teacherCustom"); %>
        <form action="/ArtEducation/teacher/editPassword.action" method="post">
          <input type="hidden" name="teacherId" value='<%=tc.getTeacherId()%>'/>
          <div class="form-group">
            <label for="oldPassword">旧密码</label>
            <input type="password" class="form-control" name="oldPassword" id="oldPassword">
          </div>
          <div class="form-group">
            <label for="newPassword">新密码</label>
            <input type="password" class="form-control" name="newPassword" id="newPassword">
          </div>
          <% if(session.getAttribute("resultCode")!=null){ 
                  String resultCode=(String)session.getAttribute("resultCode");%>
               <c:if test='<%=resultCode.equals("9001") %>'>
                  <p style="color: red;">旧密码错误</p>
               </c:if>
                <c:if test='<%=resultCode.equals("9009") %>'>
                  <p style="color: red;">其他原因导致修改密码失败</p>
               </c:if>
                <c:if test='<%=resultCode.equals("0") %>'>
                  <p style="color: red;">修改成功</p>
               </c:if>
          <% session.removeAttribute("resultCode");} %>
          <div class="text-center">
            <button class="btn btn-danger" type="submit">修改密码</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>