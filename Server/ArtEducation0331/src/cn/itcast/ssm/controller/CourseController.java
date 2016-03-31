package cn.itcast.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.ssm.po.DiscountUseInfo;
import cn.itcast.ssm.service.CourseService;
import cn.itcast.ssm.view.CourseDetailView;
import cn.itcast.ssm.view.CourseTypeView;
import cn.itcast.ssm.view.CourseView;

@Controller
@RequestMapping("/course")
public class CourseController {

	@Autowired
	private CourseService courseService;
	
	@RequestMapping(value="/queryCoursesList.action")
	public @ResponseBody List<CourseView> queryCoursesList(Integer courseTypeId) throws Exception{
		List<CourseView> cvs = courseService.findCourseListByCId(courseTypeId);
//		for(CourseView courseView:cvs){
//			System.out.println(courseView.toString());
//		}
		return cvs;
	}
	
	@RequestMapping(value="/queryCourseTypeList.action")
	public @ResponseBody List<CourseTypeView> queryCourseTypeList() throws Exception{
		List<CourseTypeView> ctvs = courseService.findCourseTypeList();
		return ctvs;
	}
	
	@RequestMapping(value="/queryCourseDetail.action")
	public @ResponseBody CourseDetailView queryCourseDetail(Integer courseId) throws Exception{
		CourseDetailView cdv = courseService.findCourseDetailByCId(courseId);
		return cdv;
	}
	
//	根据课程id，查询课程优惠券使用信息
	@RequestMapping(value="/getDiscountUseInfo.action",method=RequestMethod.GET)
	public @ResponseBody DiscountUseInfo getDiscountUseInfo(Integer courseId){
		return courseService.getDiscountUseInfo(courseId);
	}
}










