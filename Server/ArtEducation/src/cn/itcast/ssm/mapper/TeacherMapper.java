package cn.itcast.ssm.mapper;


import cn.itcast.ssm.po.Teacher;

public interface TeacherMapper {

//	根据教师的用户名查询教师信息
	public Teacher findTeacherByName(String studentName)throws Exception;
	
//	根据教师用户名或邮箱查询教师的信息，教师的邮箱也是唯一的
	public Teacher findTeacherByNameOrEmail(String userName)throws Exception;
	
}
