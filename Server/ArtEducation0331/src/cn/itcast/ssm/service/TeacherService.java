package cn.itcast.ssm.service;

import cn.itcast.ssm.po.TeacherCustom;
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

	public TeacherDiplomaInfoView findDiplomaInfo(Integer teacherId);
}
