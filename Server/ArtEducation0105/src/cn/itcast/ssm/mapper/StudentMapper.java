package cn.itcast.ssm.mapper;

import cn.itcast.ssm.po.Student;
import cn.itcast.ssm.po.StudentCustom;

public interface StudentMapper {
	
	//	根据学生的用户名查询学生信息，学生的用户名是唯一的
	public Student findStudentByName(String studentName)throws Exception;
	
	//	根据学生的邮箱查询学生信息，学生的邮箱也是唯一的
	public Student findStudentByNameOrEmail(String userName)throws Exception;
	//根据学生Id查询学生信息	
	public StudentCustom findStudentById(Integer studentId);
	
	public void updateStudent(StudentCustom sc);
}
