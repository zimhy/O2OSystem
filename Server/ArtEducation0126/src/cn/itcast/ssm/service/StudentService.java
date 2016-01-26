package cn.itcast.ssm.service;

import java.util.List;

import cn.itcast.ssm.po.DiscountDetaileCustom;
import cn.itcast.ssm.po.Student;
import cn.itcast.ssm.po.StudentCustom;
import cn.itcast.ssm.view.DiscountCustomView;
import cn.itcast.ssm.view.OrdersCarListView;
import cn.itcast.ssm.view.StudentCourseEnrollView;
import cn.itcast.ssm.view.StudentView;


/**
 * 定义学生业务接口，与学生相关的业务，在此接口中定义
 * @author linbo
 *
 */
public interface StudentService {
//	根据学生用户名或学生邮箱查询学生信息
	public Student findStudentByNameOrEmail(String userName)throws Exception;
	
//	根据学生id查询学生信息
	public StudentView findStudentByStudentId(Integer studentId) throws Exception;
	
	public boolean updateStudent(StudentCustom sc) throws Exception;
//	查询学生所拥有的所有优惠券
	public List<DiscountCustomView>  findDiscountsBySId(Integer studentId);
	
//	查询优惠券的详细信息
	public DiscountDetaileCustom findDiscountDetailByDId(Integer discountId);
	
//	  学生课程报名
	public StudentCourseEnrollView   studentCourseEnroll(Integer studentId,Integer courseId); 
//	查询购物车列表
	public List<OrdersCarListView> findOrderscarListBySId(Integer studentId);
}
