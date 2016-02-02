package cn.itcast.ssm.service.impl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.CourseMapper;
import cn.itcast.ssm.po.Comment;
import cn.itcast.ssm.po.CourseCustom;
import cn.itcast.ssm.po.CourseDetailCustom;
import cn.itcast.ssm.po.CourseTypeCustom;
import cn.itcast.ssm.po.OrganizationCustom;
import cn.itcast.ssm.po.TeacherCustom;
import cn.itcast.ssm.service.CourseService;
import cn.itcast.ssm.view.CourseCommentView;
import cn.itcast.ssm.view.CourseDetailView;
import cn.itcast.ssm.view.CourseTypeView;
import cn.itcast.ssm.view.CourseView;

public class CourseServiceImpl implements CourseService{

	@Autowired
	private CourseMapper courseMapping;
	
//	根据课程类型ID，查询课程大类下的所有课程 
	@Override
	public List<CourseView> findCourseListByCId(Integer courseTypeId) throws Exception{
		// TODO Auto-generated method stub
		List<CourseView> cvs = new LinkedList<CourseView>();
		List<CourseCustom> courseCustoms = courseMapping.findCoursesByCtypeId(courseTypeId);
		for(CourseCustom cc : courseCustoms){
			if(cc != null){
				CourseView cv = transToCourseView(cc);
				cvs.add(cv);
			}
		}
		return cvs;
	}

//	查询课程类型列表
	@Override
	public List<CourseTypeView> findCourseTypeList() throws Exception{
		// TODO Auto-generated method stub
		List<CourseTypeView> ctvs = new LinkedList<CourseTypeView>();
		List<CourseTypeCustom> ctcs = courseMapping.findCourseTypesList();
		for(CourseTypeCustom ctc : ctcs){
			if(ctc != null){
				CourseTypeView ctv = transToCourseTypeView(ctc);
				ctvs.add(ctv);
			}
		}
		return ctvs;
	}
	
	
//	查询课程详情
	@Override
	public CourseDetailView findCourseDetailByCId(Integer courseId) throws Exception {
		// TODO Auto-generated method stub
		CourseDetailCustom cdc = courseMapping.findCourseDetailByCId(courseId);
//		if(cdc != null){
//			System.out.println(cdc.getCourseName()+" "+cdc.getTeacherCustom().getTeacherName()+" "+cdc.getTeacherCustom().getOrganizationCustom().getOrganizationName());
//			System.out.println(cdc.getComments().size());
//			System.out.println(cdc.getComments().get(0).getStudentCustom().getStudentName());
//			System.out.println(cdc.getComments().get(1).getStudentCustom().getStudentName());
//		}else{
//			System.out.println("-----null");
//		}
		if(cdc != null){
			CourseDetailView cdv = TransToCourseDetailView(cdc);
			return cdv;
		}
		return null;
	}
	
	private CourseView transToCourseView(CourseCustom cc){
		System.out.println(cc.toString());
		CourseView cv = new CourseView();
		cv.setCourseId(cc.getCourseId());
		cv.setCourseName(cc.getCourseName());
		cv.setTeacherName(cc.getTeacherName());
		cv.setOrganizationName(cc.getOrganizationName());
		cv.setMainImage(cc.getMainImage());
		return cv;
	}
	
	private CourseTypeView transToCourseTypeView(CourseTypeCustom ctc){
		CourseTypeView ctv = new CourseTypeView();
		ctv.setCourseTypeId(ctc.getCourseTypeId());
		ctv.setCourseTypeName(ctc.getCourseTypeName());
		ctv.setImageId(ctc.getImageId());
		return ctv;
	}

	private CourseDetailView TransToCourseDetailView(CourseDetailCustom cdc){
		List<CourseCommentView> ccvs = new LinkedList<CourseCommentView>();
		CourseDetailView cdv = new CourseDetailView();
		TeacherCustom tc = cdc.getTeacherCustom();
		OrganizationCustom oc = tc.getOrganizationCustom();
		List<Comment> comments = cdc.getComments();
		for(Comment c :comments){
			CourseCommentView ccv = new CourseCommentView();
			ccv.setStarLevel(c.getStarLevel());
			ccv.setComment(c.getComment());
			ccv.setStudentName(c.getStudentCustom().getStudentName());
			ccv.setStudentHeadPortraits(c.getStudentCustom().getHeadPortraits());
			ccvs.add(ccv);
		}
		cdv.setCourseCommentViews(ccvs);
		cdv.setCourseId(cdc.getCourseId());
		cdv.setCourseName(cdc.getCourseName());
		cdv.setTeacherName(tc.getTeacherName());
		cdv.setMainImage(cdc.getMainImage());
		cdv.setCourseDesc(cdc.getCourseDesc());
		cdv.setCourseStatus(cdc.getCourseStatus());
		cdv.setEducation(tc.getEducation());
		cdv.setSeniority(tc.getSeniority());
		cdv.setDescription(tc.getDescription());
		cdv.setTeacherHeadPortraits(tc.getHeadPortraits());
		cdv.setOrganizationName(oc.getOrganizationName());
		cdv.setOrganizationDescription(oc.getOrganizationDescription());
		cdv.setOrganizationImageId(oc.getImageId());
		
		return cdv;
	}
}
