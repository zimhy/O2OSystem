package cn.itcast.ssm.mapper;

import java.util.List;

import cn.itcast.ssm.po.CourseCustom;
import cn.itcast.ssm.po.CourseDetailCustom;
import cn.itcast.ssm.po.CourseTypeCustom;

public interface CourseMapper {
	public List<CourseCustom> findCoursesByCtypeId(Integer courseTypeId);
	
	public List<CourseTypeCustom> findCourseTypesList();
	
	public CourseDetailCustom findCourseDetailByCId(Integer courseId);
}
