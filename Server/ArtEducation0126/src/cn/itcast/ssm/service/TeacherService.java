package cn.itcast.ssm.service;

import cn.itcast.ssm.po.Student;
import cn.itcast.ssm.po.Teacher;

public interface TeacherService {

	public Teacher findTeacherByNameOrEmail(String userName)throws Exception;
	
}
