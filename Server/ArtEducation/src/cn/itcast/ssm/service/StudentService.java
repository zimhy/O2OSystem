package cn.itcast.ssm.service;

import cn.itcast.ssm.po.Student;


/**
 * 定义学生业务接口，与学生相关的业务，在此接口中定义
 * @author linbo
 *
 */
public interface StudentService {
	
	public Student findStudentByNameOrEmail(String userName)throws Exception;
	
}
