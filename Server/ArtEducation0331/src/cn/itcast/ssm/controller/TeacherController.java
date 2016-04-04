package cn.itcast.ssm.controller;

import java.io.File;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.itcast.ssm.po.Teacher;
import cn.itcast.ssm.po.TeacherCustom;
import cn.itcast.ssm.service.TeacherService;
import cn.itcast.ssm.view.TeacherCoursesView;
import cn.itcast.ssm.view.TeacherDiplomaInfoView;

@Controller
@RequestMapping(value="/teacher")
public class TeacherController {
	
	@Autowired
	private TeacherService teacherService;
	
//	教师登录
	@RequestMapping(value="/login.action",method=RequestMethod.POST)
	public String login(HttpServletRequest request,HttpSession session){
		String account=request.getParameter("username");
		String password=request.getParameter("password");
		
		String resultCode=teacherService.login(account,password);
		String[] resultCodes=resultCode.split(" ");
	
		if(!resultCodes[0].equals("0")){
			session.setAttribute("resultCode", resultCodes[0]);
			return "redirect:/jsp/index.jsp";
		}else{
			int teacherId=Integer.parseInt(resultCodes[1]);
			TeacherCustom tc=teacherService.findTeacherById(teacherId);
			List<TeacherCoursesView> teacherCoursesViews=teacherService.findTeacherCourses(teacherId);
			session.setAttribute("teacherCustom", tc);
			session.setAttribute("teacherCoursesViews", teacherCoursesViews);
			return "redirect:/jsp/teacher/tm.jsp";
		}
	}
	
//	编辑教师认证信息
	@RequestMapping(value="/editTeacherDipPic.action",method=RequestMethod.POST)
	public String  editTeacherDipPic(HttpServletRequest request,
			TeacherCustom tc,
            HttpSession session,
            MultipartFile teacherIdPic, //接受身份证的图片
            MultipartFile teacherDiplomaPic,
            MultipartFile teacherMasterDiplomaPic
            ) throws IllegalStateException, IOException{
		
//		存储图片的物理路径
		String pic_path="/Users/linbo/Documents/test/";
		System.out.println(tc);

//		图片的原始名称
		String idPicFilename=teacherIdPic.getOriginalFilename();
		if(teacherIdPic!=null&&idPicFilename!=null&&idPicFilename.length()>0){
//			新的图片名称
			String newFileName=UUID.randomUUID()+idPicFilename.substring(idPicFilename.lastIndexOf('.'));
//			新图片
			File newFile=new File(pic_path+newFileName);
//			将内存中的数据写入磁盘
			teacherIdPic.transferTo(newFile);
//			将新的图片名称写进itemsCustom中
			tc.setIdPic(newFileName);
		}
		
//		图片的原始名称
		String diplomaPicFilename=teacherDiplomaPic.getOriginalFilename();
		if(teacherDiplomaPic!=null&&diplomaPicFilename!=null&&diplomaPicFilename.length()>0){
//			新的图片名称
			String newFileName=UUID.randomUUID()+diplomaPicFilename.substring(diplomaPicFilename.lastIndexOf('.'));
//			新图片
			File newFile=new File(pic_path+newFileName);
//			将内存中的数据写入磁盘
			teacherDiplomaPic.transferTo(newFile);
//			将新的图片名称写进itemsCustom中
			tc.setDiplomaPic(newFileName);
		}
		
//		图片的原始名称
		String masterDiplomaPicFilename=teacherMasterDiplomaPic.getOriginalFilename();
		if(teacherMasterDiplomaPic!=null&&masterDiplomaPicFilename!=null&&masterDiplomaPicFilename.length()>0){
//			新的图片名称
			String newFileName=UUID.randomUUID()+masterDiplomaPicFilename.substring(masterDiplomaPicFilename.lastIndexOf('.'));
//			新图片
			File newFile=new File(pic_path+newFileName);
//			将内存中的数据写入磁盘
			teacherMasterDiplomaPic.transferTo(newFile);
//			将新的图片名称写进itemsCustom中
			tc.setMasterDiplomaPic(newFileName);
		}
		
		String resultCode=teacherService.editTeacherDiplomaInfo(tc);
		
		TeacherCustom newTc=teacherService.findTeacherById(tc.getTeacherId());
		
		session.removeAttribute("teacherCustom");
		session.setAttribute("teacherCustom", newTc);
		return "redirect:/jsp/teacher/tm-identity.jsp";
	}
	
	
//	查询教师的认证图片信息
	@RequestMapping(value="/findDiplomaInfo.action")
	public ModelAndView findDiplomaInfo(Integer teacherId){
		TeacherDiplomaInfoView tdiv=teacherService.findDiplomaInfo(teacherId);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("tdiv", tdiv);
//		return "redirect:/jsp/submitDiplomaInfo.jsp";
		modelAndView.setViewName("submitDiplomaInfo");
		return modelAndView;
	}
	
	
//	编辑教师信息
	@RequestMapping(value="/editTeacherInfo.action",method=RequestMethod.POST)
	public String editTeacherInfo(TeacherCustom teacherCustom,HttpSession session){
		String editTeacherInfo=teacherService.editTeacherInfo(teacherCustom);
		session.setAttribute("editTeacherInfo", editTeacherInfo);
		TeacherCustom tc=teacherService.findTeacherById(teacherCustom.getTeacherId());
		session.removeAttribute("teacherCustom");
		session.setAttribute("teacherCustom", tc);
		return "redirect:/jsp/teacher/tm-profile.jsp";
	}
	
//	修改教师密码
	@RequestMapping(value="/editPassword.action",method=RequestMethod.POST)
	public String editPassword(HttpServletRequest request,HttpSession session){
		String oldPassword=request.getParameter("oldPassword");
		String newPassword=request.getParameter("newPassword");
		int teacherId=Integer.parseInt(request.getParameter("teacherId"));
		String resultCode=teacherService.editTeacherPwd(oldPassword, newPassword, teacherId);
		session.setAttribute("resultCode", resultCode);
		return "redirect:/jsp/teacher/editpwd.jsp";
	}
	
	//教师注册
		@RequestMapping(value="/registerTeacher.action",method=RequestMethod.POST)
		public ModelAndView registerBaseInfo(Teacher teacher ,MultipartFile headPortraitsPic , //接受的图片
	            MultipartFile idPicFile,MultipartFile diplomaPicFile,MultipartFile masterDiplomaPicFile ,HttpServletRequest request){
			System.out.println("/registerTeacher.action");
			ModelAndView modelAndView=new ModelAndView();
			String rootPath = request.getSession().getServletContext().getRealPath("") ;
			if (headPortraitsPic !=null) {
				String headPortraitsStr = savePic(headPortraitsPic,rootPath) ;
				teacher.setHeadPortraits(headPortraitsStr);
			}
			if (diplomaPicFile !=null) {
				String diplomaPic = savePic(diplomaPicFile,rootPath) ;
				teacher.setDiplomaPic(diplomaPic);
			}
			if (idPicFile !=null) {
				String idPic = savePic(idPicFile,rootPath) ;
				teacher.setIdPic(idPic);
			}
			if (masterDiplomaPicFile !=null) {
				String masterDiplomaPic = savePic(masterDiplomaPicFile,rootPath) ;
				teacher.setMasterDiplomaPic(masterDiplomaPic);
			}
			if(teacherService.register(teacher).matches("\\d+"))
			{
				modelAndView.setViewName("signup/regsuccess");
			}else{
				modelAndView.setViewName("index");
			}
			
			
			return modelAndView ;
		}  
		
		private String savePic(MultipartFile file ,String rootPath )
		{
			try {
				
				String originalFilename=file.getOriginalFilename();

				if(file!=null&&originalFilename!=null&&originalFilename.length()>0){
//					存储图片的物理路径
//					新的图片名称
					String pic_path= rootPath+File.separator+"imagesUpolad"+File.separator;
					String newFileName=UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf('.'));
//					新图片
					File newFile=new File(pic_path+newFileName);
//					将内存中的数据写入磁盘
					file.transferTo(newFile);
					System.out.println(newFile.getAbsolutePath());
					return newFileName ;
//					将新的图片名称写进itemsCustom中
				}
					
				return "" ;
				
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
				return "";
			}
			
			
		}
	
}











