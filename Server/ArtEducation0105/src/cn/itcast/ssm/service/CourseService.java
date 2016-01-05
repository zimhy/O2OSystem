package cn.itcast.ssm.service;

import java.util.List;

import cn.itcast.ssm.view.CourseDetailView;
import cn.itcast.ssm.view.CourseTypeView;
import cn.itcast.ssm.view.CourseView;

public interface CourseService {
	public List<CourseView> findCourseListByCId(Integer courseTypeId) throws Exception;
	
	public List<CourseTypeView> findCourseTypeList() throws Exception;
	
	public CourseDetailView findCourseDetailByCId(Integer courseId) throws Exception;
	
}
