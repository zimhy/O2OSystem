package cn.itcast.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.itcast.ssm.po.Organization;
import cn.itcast.ssm.po.Student;
import cn.itcast.ssm.po.Teacher;
import cn.itcast.ssm.service.OrganizationService;
import cn.itcast.ssm.service.StudentService;
import cn.itcast.ssm.service.TeacherService;

@Controller
public class SystemFunctionController {

//	注入StudentService接口的实例化对象
//adasda
	@Autowired
	private StudentService studentService;

//	注入TeacherService接口的实例化对象
	@Autowired
	private TeacherService teacherService;
	
//	注入OrganizationService接口的实例化对象
	@Autowired
	private OrganizationService organizationService;
	
	@RequestMapping("/userLogin.action")
	public ModelAndView userLogin() throws Exception{
//		测试数据
		String userName="新东方";
		String password="123456";
		String userType="organization";
		
		String resultCode=null;
		
		Student student=null;
		Teacher teacher=null;
		Organization organization=null;
		
//		先判断是不是学生类型
		if(userType.equals("student")){
			
			student=studentService.findStudentByNameOrEmail(userName);
			
			if(student!=null){
				if(student.getPassword().equals(password)){
					System.out.println("登录成功");
				}else{
					System.out.println("密码输入错误");
				}
			}else{
				System.out.println("用户名输入错误");
			}
			
		}else if(userType.equals("teacher")){
			
			teacher=teacherService.findTeacherByNameOrEmail(userName);
			
			if(teacher!=null){
				if(teacher.getPassword().equals(password)){
					System.out.println("教师登录成功"+teacher.getPassword());
				}else{
					System.out.println("教师密码输入错误");
				}
			}else{
				System.out.println("教师用户名输入错误");
			}
			
		}else if(userType.equals("organization")){
			
			organization=organizationService.findOrganizationByName(userName);
			
			if(organization!=null){
				if(organization.getPassword().equals(password)){
					System.out.println("机构登录成功"+organization.getPassword());
				}else{
					System.out.println("机构密码输入错误");
				}
			}else{
				System.out.println("机构用户名输入错误");
			}
		}else{
//		当登录的用户是管理员的时候

		}
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("user", student);
		modelAndView.setViewName("success");
		return modelAndView;
	}
	
}
