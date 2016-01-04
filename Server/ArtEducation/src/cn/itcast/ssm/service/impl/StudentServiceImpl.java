package cn.itcast.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.StudentMapper;
import cn.itcast.ssm.po.Student;
import cn.itcast.ssm.service.StudentService;


/**
 *实现学生服务接口
 * @author linbo
 *
 */
public class StudentServiceImpl implements StudentService{
	
	@Autowired
	private StudentMapper studentMapper;
	
// 根据学生的用户名或邮箱查询学生信息
	@Override
	public Student findStudentByNameOrEmail(String userName) throws Exception {
		// TODO Auto-generated method stub
		return studentMapper.findStudentByNameOrEmail(userName);
	}

}
