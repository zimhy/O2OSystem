package cn.itcast.ssm.mapper;

import java.util.List;

import cn.itcast.ssm.po.Teacher;
import cn.itcast.ssm.po.TeacherCourses;
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
	
//	查询教师的课程
	public List<TeacherCourses> findTeacherCourses(Integer teacherId);
	
//	编辑教师信息
	public void editTeacherInfo(TeacherCustom teacherCustom);
	
//	修改教师密码
	public void editTeacherPwd(TeacherCustom teacherCustom);
	public Integer insertTeacher(Teacher teacher);

	
}
