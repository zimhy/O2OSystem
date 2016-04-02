package cn.itcast.ssm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.itcast.ssm.po.Teacher;
import cn.itcast.ssm.service.TeacherService;

@Controller
@RequestMapping(value="/teacher")
public class TeacherController {
	
	@Autowired
	private TeacherService teacherService;
	
//	教师登录
	@RequestMapping(value="/login.action",method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response){
		String account=request.getParameter("username");
		String password=request.getParameter("password");
		
		String resultCode=teacherService.login(account,password);
		String[] resultCodes=resultCode.split(" ");
		
		ModelAndView modelAndView=new ModelAndView();
		if(!resultCodes[0].equals("0")){
			modelAndView.addObject("resultCode", resultCodes[0]);
			modelAndView.setViewName("index");
			return modelAndView;
		}else{
			modelAndView.addObject("resultCode", resultCodes[0]);
			modelAndView.addObject("studentId", resultCodes[1]);
			modelAndView.setViewName("");
			return modelAndView;
			
		}
	}
	
	//教师注册
	@RequestMapping(value="/registerTeacher.action",method=RequestMethod.POST)
	public ModelAndView registerBaseInfo(Teacher teacher ,HttpServletRequest request){
		//TODO
		ModelAndView modelAndView=new ModelAndView();
		String stepStr = request.getParameter("step") ;
		if(!stepStr.isEmpty()&&stepStr.matches("\\d+")) 
		{
			int step = Integer.parseInt(stepStr);
			switch (step) {
			case value:
				
				break;

			default:
				break;
			}
		}else {
			
		}
		
		return modelAndView ;
	}
}
