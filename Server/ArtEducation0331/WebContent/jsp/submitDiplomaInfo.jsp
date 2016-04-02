<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改教师认证信息</title>

</head>
<body> 

<c:if test="${resultCode=='0' }">
   <p>shabile</p>
   <input type="button" value="权限一"/>
</c:if>

 
<form id="teacherForm" action="${pageContext.request.contextPath }/teacher/editTeacherDipPic.action" method="post"  enctype="multipart/form-data">
<%-- <input type="hidden" name="teacherId" value="${1 }"/> --%>
修改教师认证信息
<table width="100%" border=1>
<tr>
	<td>身份证照片</td>
	<td>
		<c:if test="${tdiv.idPic !=null}">
			<img src="/ArtEducation/pic/${tdiv.idPic}" width=200 height=200/>
			<br/>
		</c:if> 
		<input type="file"  name="teacherIdPic"/> 
	</td>
</tr> 

<tr>
	<td>本科/专科毕业证</td>
	<td>
		<c:if test="${tdiv.diplomaPic !=null}">
			<img src="/ArtEducation/pic/${tdiv.diplomaPic}" width=200 height=200/>
			<br/>
		</c:if> 
		<input type="file"  name="teacherDiplomaPic"/> 
	</td>
</tr> 

<tr>
	<td>硕士毕业证</td>
	<td>
		<c:if test="${tdiv.masterDiplomaPic !=null}">
			<img src="/ArtEducation/pic/${tdiv.masterDiplomaPic}" width=200 height=200/>
			<br/>
		</c:if> 
		<input type="file"  name="teacherMasterDiplomaPic"/> 
	</td>
</tr> 

<tr>
<td colspan="2" align="center"><input type="submit" value="提交"/>
</tr>
</table>
</form>

</body>

</html>