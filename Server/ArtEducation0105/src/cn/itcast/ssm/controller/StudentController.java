package cn.itcast.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.ssm.po.StudentCustom;
import cn.itcast.ssm.service.StudentService;
import cn.itcast.ssm.view.StudentView;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value="/queryStuInfo.action",method=RequestMethod.GET)
	public @ResponseBody StudentView queryStuInfo(Integer studentId) throws Exception{
		StudentView sv = studentService.findStudentByStudentId(studentId);
		System.out.println(sv.toString());
		return sv;
	}
	
	@RequestMapping(value="/updateStuInfoSubmit.action")
	public void updateStuInfoSubmit(StudentCustom sc) throws Exception{
		if(studentService.updateStudent(sc)){
			System.out.println("修改成功");
		}else{
			System.out.println("修改失败");
		}
	}
	
}
