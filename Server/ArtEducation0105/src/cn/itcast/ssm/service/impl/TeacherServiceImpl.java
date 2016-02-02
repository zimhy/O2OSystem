package cn.itcast.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.TeacherMapper;
import cn.itcast.ssm.po.Teacher;
import cn.itcast.ssm.service.TeacherService;

public class TeacherServiceImpl implements TeacherService{

	@Autowired
	private TeacherMapper teacherMapper;
	
	@Override
	public Teacher findTeacherByNameOrEmail(String userName) throws Exception {
		// TODO Auto-generated method stub
		return teacherMapper.findTeacherByNameOrEmail(userName);
	}

}
