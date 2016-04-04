package cn.itcast.ssm.service;

import java.util.List;

import cn.itcast.ssm.po.TeacherCourses;
import cn.itcast.ssm.po.TeacherCustom;
import cn.itcast.ssm.view.TeacherCoursesView;
import cn.itcast.ssm.view.TeacherDiplomaInfoView;

public interface TeacherService {

//	根据教师的id来查询教师的信息
	public TeacherCustom findTeacherById(Integer teacherId);
	
//	根据教师用户名或邮箱查询教师信息
	public TeacherCustom findTeacherByNameOrEmail(String userName);
	
// 教师登录
	public String login(String account,String password);
	
//	编辑教师的认证信息
	public String editTeacherDiplomaInfo(TeacherCustom teacherCustom);

//	查询身份认证信息
	public TeacherDiplomaInfoView findDiplomaInfo(Integer teacherId);
	
//	查询教师的课程
	public List<TeacherCoursesView> findTeacherCourses(Integer teacherId);
	
//	编辑教师信息
	public String editTeacherInfo(TeacherCustom teacherCustom);
	
//	修改教师密码
	public String editTeacherPwd(String oldPassword,String newPassword,Integer teacherId);
}
