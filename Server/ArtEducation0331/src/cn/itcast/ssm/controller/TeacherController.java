package cn.itcast.ssm.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.env.IGenericField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
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
	public ModelAndView registerBaseInfo(Teacher teacher ,MultipartFile headPortraits , //接受商品的图片
            MultipartFile idPic,MultipartFile diplomaPic,MultipartFile masterDiplomaPic){
		
		ModelAndView modelAndView=new ModelAndView();
		if (headPortraits !=null) {
			String headPortraitsStr = savePic(headPortraits) ;
		}
		return modelAndView ;
	}
	
	private String savePic(MultipartFile file )
	{
		try {
			
			String originalFilename=file.getOriginalFilename();

			if(file!=null&&originalFilename!=null&&originalFilename.length()>0){
//				存储图片的物理路径
				String pic_path="imageUpload/";
//				新的图片名称
				String newFileName=UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf('.'));
//				新图片
				File newFile=new File(pic_path+newFileName);
//				将内存中的数据写入磁盘
				file.transferTo(newFile);
				return newFileName ;
//				将新的图片名称写进itemsCustom中
			}
				
			return "" ;
			
			
			
			
		} catch (Exception e) {
			return "";
		}
		
		
	}
}
