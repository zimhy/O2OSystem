package cn.itcast.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.TeacherMapper;
import cn.itcast.ssm.po.Teacher;
import cn.itcast.ssm.po.TeacherCustom;
import cn.itcast.ssm.service.TeacherService;

public class TeacherServiceImpl implements TeacherService{

	@Autowired
	private TeacherMapper teacherMapper;
	
//	根据教师邮箱或用户名查询教师信息
	@Override
	public TeacherCustom findTeacherByNameOrEmail(String userName) {
		// TODO Auto-generated method stub
		return teacherMapper.findTeacherByNameOrEmail(userName);
	}

	@Override
	public String login(String account, String password) {
		// TODO Auto-generated method stub
		try {
			TeacherCustom tc=teacherMapper.findTeacherByNameOrEmail(account);
			if(tc==null){
//			用户名不存在
				return "9001";
			}else{
				if(tc.getPassword().equals(password)){
					return "0 "+tc.getTeacherId();
				}else{
//				密码错误
					return "9002";
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "9009";
		}
		
	}
	
	

}
