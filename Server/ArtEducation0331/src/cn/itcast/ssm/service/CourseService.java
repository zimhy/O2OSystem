package cn.itcast.ssm.service;

import java.util.List;

import cn.itcast.ssm.po.DiscountUseInfo;
import cn.itcast.ssm.view.CourseDetailView;
import cn.itcast.ssm.view.CourseTypeView;
import cn.itcast.ssm.view.CourseView;

public interface CourseService {
	
	public List<CourseView> findCourseListByCId(Integer courseTypeId) throws Exception;
	
	public List<CourseTypeView> findCourseTypeList() throws Exception;
	
	public CourseDetailView findCourseDetailByCId(Integer courseId) throws Exception;
	
//	根据课程id，查询课程优惠券使用信息
	public DiscountUseInfo getDiscountUseInfo(Integer courseId);

	
}
