package cn.itcast.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
