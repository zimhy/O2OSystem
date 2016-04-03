<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师发布课程</title>
</head>
<body>
<div class="col-md-6">
  <p class="bg-warning">以下内容全部必填</p>
  <form action="/ArtEducation/teacher/publishCourse.action" method="post" enctype="multipart/form-data">
  	<input type="hidden" name="teacherId" value="1" />
    <div class="form-group">
      <label for="courseName">课程名称</label>
      <input type="text" class="form-control" name="courseName" id="courseName" required>
    </div>
    <div class="form-group">
      <label for="courseDesc">课程描述</label>
      <textarea class="form-control" name="courseDesc" id="courseDesc" cols="30" rows="10" required></textarea>
    </div>
    <div class="row">
      <div class="col-md-4">
        <p style="font-weight: bold;font-size: 20px;margin-top: 50px;">选择时间</p>
      </div>
      <div class="col-md-8">
        <div class="form-group">
          <label for="courseStartTime">课程开始时间</label>
          <input type="text" name="courseStartTime" id="courseStartTime" ui-date required/>
        </div>
        <div class="form-group">
          <label for="courseEndTime">课程结束时间</label>
          <input type="text" name="courseEndTime" id="courseEndTime" ui-date required/>
        </div>
        <div class="form-group">
          <label for="classTime">每周上课时间</label>
          <input type="text" name="classTime" id="classTime" required/>
        </div>
      </div>
    </div>
    <div class="form-group">
      <label for="teachAddress">上课地点</label>
      <input type="text" class="form-control" name="teachAddress" id="teachAddress" required>
    </div>
    <div class="form-group">
      <label for="lessonNum">课时数</label>
      <input type="text" class="form-control" name="lessonNum" id="lessonNum" required>
    </div>
    <div class="form-group">
      <label for="teachMethod">授课方式</label>
      <select name="teachMethod" id="teachMethod" class="form-control" required>
        <option value="2001" selected>上门授课</option>
        <option value="2002">机构教室</option>
      </select>
    </div>
    <div class="form-group">
      <label for="teachMethod">是否支持试听</label>
      <select name="listenTest" id="listenTest" class="form-control" required>
        <option value="3001" selected>不支持试听</option>
        <option value="3002">支持试听</option>
      </select>
    </div>
    <div class="form-group">
      <label for="coursePrice">课程价格(元)</label>
      <input type="text" class="form-control" name="coursePrice" id="coursePrice" required>
    </div>
    <div class="form-group">
      <label for="mainImage">一张与课程相关的图片</label>
      <img src="" alt="" style="display: block;margin: 5px;">
      <input type="file" name="mainImageFile" id="mainImage" required>
    </div>
    <div class="form-group">
      <label for="planStuNum">计划招生人数</label>
      <input type="text" class="form-control" name="planStuNum" id="planStuNum" required>
    </div>
    <button class="btn btn-danger" type="submit">创建课程</button>
  </form>
</div>
</body>
</html>