package cn.itcast.ssm.service;

import cn.itcast.ssm.po.Teacher;
import cn.itcast.ssm.po.TeacherCustom;

public interface TeacherService {

//	根据教师用户名或邮箱查询教师信息
	public TeacherCustom findTeacherByNameOrEmail(String userName);
	public Integer register(Teacher teacher);
	
// 教师登录
	public String login(String account,String password);
	
}
