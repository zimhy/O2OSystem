package cn.itcast.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.StudentMapper;
import cn.itcast.ssm.po.Student;
import cn.itcast.ssm.po.StudentCustom;
import cn.itcast.ssm.service.StudentService;
import cn.itcast.ssm.view.StudentView;


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

	@Override
	public StudentView findStudentByStudentId(Integer studentId) throws Exception {
		// TODO Auto-generated method stub
		StudentCustom sc = studentMapper.findStudentById(studentId);
		if(sc != null){
			StudentView sv = transToStudentView(sc);
			return sv;
		}
		return null;
	}

	private StudentView transToStudentView(StudentCustom sc){
		StudentView sv = new StudentView();
		sv.setStudentId(sc.getStudentId());
		sv.setNickName(sc.getNickName());
		sv.setEmail(sc.getEmail());
		sv.setHeadPortraits(sc.getHeadPortraits());
		sv.setStudentAge(sc.getStudentAge());
		sv.setRealName(sc.getRealName());
		if(sc.getGender().equals("1001")){
			sv.setGender("男");
		}else if(sc.getGender().equals("1002")){
			sv.setGender("女");
		}
		sv.setPreference(sc.getPreference());
		return sv;
	}

	@Override
	public boolean updateStudent(StudentCustom sc) {
		// TODO Auto-generated method stub
		Integer studentId = sc.getStudentId();
		StudentCustom newSc = studentMapper.findStudentById(studentId);
		newSc.setNickName(sc.getNickName());
		newSc.setEmail(sc.getEmail());
		newSc.setHeadPortraits(sc.getHeadPortraits());
		newSc.setStudentAge(sc.getStudentAge());
		newSc.setRealName(sc.getRealName());
		newSc.setGender(sc.getGender());
		newSc.setPreference(sc.getPreference());
		try{
			studentMapper.updateStudent(newSc);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
}
