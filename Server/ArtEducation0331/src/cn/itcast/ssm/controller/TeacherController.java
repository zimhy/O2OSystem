package cn.itcast.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import cn.itcast.ssm.po.TeacherCustom;
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
	
//	编辑教师认证信息
	@RequestMapping(value="/editTeacherDipPic.action")
	public String  editTeacherDipPic(HttpServletRequest request,
            Integer id,
            Model model,
            MultipartFile idPic, //接受身份证的图片
            MultipartFile diplomaPic,
            MultipartFile masterDiplomaPic
            ) throws IllegalStateException, IOException{
		TeacherCustom tc=new TeacherCustom();
//		存储图片的物理路径
		String pic_path="/Users/linbo/Documents/test/";

//		图片的原始名称
		String idPicFilename=idPic.getOriginalFilename();
		if(idPic!=null&&idPicFilename!=null&&idPicFilename.length()>0){
//			新的图片名称
			String newFileName=UUID.randomUUID()+idPicFilename.substring(idPicFilename.lastIndexOf('.'));
//			新图片
			File newFile=new File(pic_path+newFileName);
//			将内存中的数据写入磁盘
			idPic.transferTo(newFile);
//			将新的图片名称写进itemsCustom中
			tc.setIdPic(newFileName);
		}
		
//		图片的原始名称
		String diplomaPicFilename=diplomaPic.getOriginalFilename();
		if(diplomaPic!=null&&diplomaPicFilename!=null&&diplomaPicFilename.length()>0){
//			新的图片名称
			String newFileName=UUID.randomUUID()+diplomaPicFilename.substring(diplomaPicFilename.lastIndexOf('.'));
//			新图片
			File newFile=new File(pic_path+newFileName);
//			将内存中的数据写入磁盘
			diplomaPic.transferTo(newFile);
//			将新的图片名称写进itemsCustom中
			tc.setDiplomaPic(newFileName);
		}
		
//		图片的原始名称
		String masterDiplomaPicFilename=masterDiplomaPic.getOriginalFilename();
		if(masterDiplomaPic!=null&&masterDiplomaPicFilename!=null&&masterDiplomaPicFilename.length()>0){
//			新的图片名称
			String newFileName=UUID.randomUUID()+masterDiplomaPicFilename.substring(masterDiplomaPicFilename.lastIndexOf('.'));
//			新图片
			File newFile=new File(pic_path+newFileName);
//			将内存中的数据写入磁盘
			masterDiplomaPic.transferTo(newFile);
//			将新的图片名称写进itemsCustom中
			tc.setMasterDiplomaPic(newFileName);
		}
		
		String resultCode=teacherService.editTeacherDiplomaInfo(tc);
		return resultCode;
	}
	
}
