package cn.itcast.ssm.mapper;

import cn.itcast.ssm.po.TeacherCustom;

public interface TeacherMapper {

//	根据教师的id来查询教师的信息
	public TeacherCustom findTeacherById(Integer teacherId);
	
//	根据教师的用户名查询教师信息
	public TeacherCustom findTeacherByName(String studentName);
	
//	根据教师用户名或邮箱查询教师的信息，教师的邮箱也是唯一的
	public TeacherCustom findTeacherByNameOrEmail(String userName);
	
//	编辑教师认证信息
	public void editTeacherDiplomaInfo(TeacherCustom teacherCustom);
	
}
