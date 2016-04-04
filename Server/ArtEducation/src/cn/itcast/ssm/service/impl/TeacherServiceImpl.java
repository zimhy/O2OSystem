package cn.itcast.ssm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.TeacherMapper;
import cn.itcast.ssm.po.Teacher;
import cn.itcast.ssm.po.TeacherCourses;
import cn.itcast.ssm.po.TeacherCustom;
import cn.itcast.ssm.service.TeacherService;
import cn.itcast.ssm.view.TeacherCoursesView;
import cn.itcast.ssm.view.TeacherDiplomaInfoView;

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

//	编辑教师认证信息
	@Override
	public String editTeacherDiplomaInfo(TeacherCustom teacherCustom) {
		// TODO Auto-generated method stub
		TeacherCustom tc=teacherMapper.findTeacherById(teacherCustom.getTeacherId());
		if(teacherCustom.getIdPic()!=null){
			tc.setIdPic(teacherCustom.getIdPic());
		}
		if(teacherCustom.getDiplomaPic()!=null){
			tc.setDiplomaPic(teacherCustom.getDiplomaPic());
		}
		if(teacherCustom.getMasterDiplomaPic()!=null){
			tc.setMasterDiplomaPic(teacherCustom.getMasterDiplomaPic());
		}
		try {
			teacherMapper.editTeacherDiplomaInfo(tc);
			return "0";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "9001";
		}
	}

//	根据教师id 查询教师信息
	@Override
	public TeacherCustom findTeacherById(Integer teacherId) {
		// TODO Auto-generated method stub
		try {
			TeacherCustom tc=teacherMapper.findTeacherById(teacherId);
			return tc;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
//	查询教师的认证图片信息
	@Override
	public TeacherDiplomaInfoView findDiplomaInfo(Integer teacherId){
		TeacherCustom tc=teacherMapper.findTeacherById(teacherId);
		if(tc==null){
			return null;
		}else{
			TeacherDiplomaInfoView tdiv=new TeacherDiplomaInfoView();
			tdiv.setIdPic(tc.getIdPic());
			tdiv.setDiplomaPic(tc.getDiplomaPic());
			tdiv.setMasterDiplomaPic(tc.getMasterDiplomaPic());
			return tdiv;
		}
	}

	@Override
	public List<TeacherCoursesView> findTeacherCourses(Integer teacherId) {
		List<TeacherCourses> teacherCourses=teacherMapper.findTeacherCourses(teacherId);
		List<TeacherCoursesView> teacherCoursesViews=new ArrayList<>();
		if(teacherCourses!=null){
			for(TeacherCourses tc:teacherCourses){
				teacherCoursesViews.add(transportToTCView(tc));
			}
			return teacherCoursesViews;
		}
		return null;
	}

	public TeacherCoursesView transportToTCView(TeacherCourses tc){
		TeacherCoursesView tcv=new TeacherCoursesView();
		String teachTime=tc.getTeachTime();
		String[] teachTimes=teachTime.split(" ");
		tcv.setStartTime(teachTimes[0]);
		tcv.setEndTime(teachTimes[1]);
//		tcv.setClassTime(teachTimes[2]);
		tcv.setCourseId(tc.getCourseId());
		tcv.setCourseName(tc.getCourseName());
		if(tc.getCourseStatus().equals("1001")){
			tcv.setCourseStatus("审核不通过");
		}else if(tc.getCourseStatus().equals("1002")){
			tcv.setCourseStatus("待审核");
		}else if(tc.getCourseStatus().equals("1003")){
			tcv.setCourseStatus("未招满");
		}else if(tc.getCourseStatus().equals("1004")){
			tcv.setCourseStatus("已招满");
		}else if(tc.getCourseStatus().equals("1005")){
			tcv.setCourseStatus("已停课");
		}else if(tc.getCourseStatus().equals("1006")){
			tcv.setCourseStatus("正在上课");
		}else {
			tcv.setCourseStatus("历史课程");
		}
		tcv.setTeachAddress(tc.getTeachAddress());
		tcv.setTeacherId(tc.getTeacherId());
		return tcv;
	}

//	编辑教师基本信息
	@Override
	public String editTeacherInfo(TeacherCustom teacherCustom) {
		// TODO Auto-generated method stub
		TeacherCustom tc=teacherMapper.findTeacherByNameOrEmail(teacherCustom.getTeacherName());
		if(tc!=null&&tc.getTeacherId()!=teacherCustom.getTeacherId()){
//			System.out.println("******************");
//			System.out.println(teacherCustom.getTeacherName());
//			System.out.println("******************");
			return "9002";
		}
		tc=teacherMapper.findTeacherByNameOrEmail(teacherCustom.getEmail());
		if(tc!=null&&tc.getTeacherId()!=teacherCustom.getTeacherId()){
			return "9001";
		}else{
			try {
				teacherMapper.editTeacherInfo(teacherCustom);
				return "0";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "9009";
			}
		}
	}

//	修改教师密码
	@Override
	public String editTeacherPwd(String oldPassword,String newPassword,Integer teacherId) {
		// TODO Auto-generated method stub
		TeacherCustom tc=teacherMapper.findTeacherById(teacherId);
		
		System.out.println("***********");
		System.out.println(oldPassword);
		System.out.println(newPassword);
		System.out.println(teacherId);
		System.out.println(tc.getPassword());
		System.out.println("***********");
		
		if(!tc.getPassword().equals(oldPassword)){
			return "9001";
		}else{
			tc.setPassword(newPassword);
			try {
				teacherMapper.editTeacherPwd(tc);
				return "0";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "9009";
			}
		}
	}
	
	
}















