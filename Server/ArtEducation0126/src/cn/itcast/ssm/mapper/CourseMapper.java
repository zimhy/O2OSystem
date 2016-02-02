package cn.itcast.ssm.mapper;

import java.util.List;

import cn.itcast.ssm.po.CourseCustom;
import cn.itcast.ssm.po.CourseDetailCustom;
import cn.itcast.ssm.po.CourseTypeCustom;

public interface CourseMapper {
	
//	根据课程类型ID，发现课程大类下的所有课程
	public List<CourseCustom> findCoursesByCtypeId(Integer courseTypeId);
	
//	查找所有课程类型
	public List<CourseTypeCustom> findCourseTypesList();
	
//	查询课程详情
	public CourseDetailCustom findCourseDetailByCId(Integer courseId);
}
