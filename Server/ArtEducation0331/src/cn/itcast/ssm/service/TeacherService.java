package cn.itcast.ssm.service;

import java.util.List;

import cn.itcast.ssm.po.CourseCustom;
import cn.itcast.ssm.po.Teacher;
import cn.itcast.ssm.po.TeacherCourses;
import cn.itcast.ssm.po.TeacherCustom;
import cn.itcast.ssm.view.TeacherCoursesView;
import cn.itcast.ssm.view.TeacherDiplomaInfoView;

public interface TeacherService {

//	根据教师的id来查询教师的信息
	public TeacherCustom findTeacherById(Integer teacherId);
	
//	根据教师用户名或邮箱查询教师信息
	public TeacherCustom findTeacherByNameOrEmail(String userName);
	
// 教师登录
	public String login(String account,String password);
	
//	编辑教师的认证信息
	public String editTeacherDiplomaInfo(TeacherCustom teacherCustom);

//	查询身份认证信息
	public TeacherDiplomaInfoView findDiplomaInfo(Integer teacherId);
	
//	查询教师的课程
	public List<TeacherCoursesView> findTeacherCourses(Integer teacherId);
	
//	编辑教师信息
	public String editTeacherInfo(TeacherCustom teacherCustom);

	public String register(Teacher teacher);
	
//  发布课程
	public Integer insertCourse(CourseCustom cc);

//  根据教师id和课程状态查询历史课程
	public List<CourseCustom> findHisCourseByTIdAndStatus(Integer teacherId,Integer courseStatus) throws Exception;
	
//  根据课程id删除课程，只是逻辑删除，在数据库中修改课程状态为1007
	public Integer deleteCourseBycourseId(Integer courseId);

//  根据课程id查询课程
	public List<CourseCustom> findCourseByTeacherId(Integer courseId);
}
