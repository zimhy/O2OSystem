package cn.itcast.ssm.service;

import java.util.List;

import cn.itcast.ssm.po.CourseCustom;
import cn.itcast.ssm.po.DiscountDetaileCustom;
import cn.itcast.ssm.po.MyDiscountInfo;
import cn.itcast.ssm.po.OrdersCarCustom;
import cn.itcast.ssm.po.OrdersCarInfo;
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
//	学生登录
	public String login(String value,String password);
	
//	根据学生用户名或学生邮箱查询学生信息
	public Student findStudentByNameOrEmail(String userName)throws Exception;
	
//	根据学生id查询学生信息
	public StudentView findStudentByStudentId(Integer studentId) throws Exception;
	
	public String updateStudent(StudentCustom sc) ;
//	查询学生所拥有的所有优惠券
	public List<DiscountCustomView>  findDiscountsBySId(Integer studentId);
	
//	查询优惠券的详细信息
	public DiscountDetaileCustom findDiscountDetailByDId(Integer discountId);
	
//	  学生课程报名
	public StudentCourseEnrollView   studentCourseEnroll(Integer studentId,Integer courseId); 
//	查询购物车列表
	public List<OrdersCarListView> findOrderscarListBySId(Integer studentId);
	
//	学生注册，返回studentId
	public String registerStudent(StudentCustom studentCustom);
	
//	学生选择课程，添加进购物车
	public String addToOrdersCar(OrdersCarCustom ordersCarCustom);
	
//	根据课程id查询课程单价
	public CourseCustom findCoursePriceById(Integer courseId);
	
//	查询购物车信息
	public List<OrdersCarInfo>  queryOrdersCar(Integer studentId);
	
//	根据课程id和学生id，查询购物车中是该学生否已经添加该课程
	public OrdersCarCustom findCarCourseByCourseId(OrdersCarCustom ordersCarCustom);
	
//	根据学生id和课程id，更新购物车信息 
 	public boolean  updateOrdersCar(OrdersCarCustom ordersCarCustom);
 	
// 	删除购物车中课程信息
 	public String deleteOrdersCar(List<Integer> ordersCarIds);
 	
// 	获取优惠券信息
 	public List<MyDiscountInfo> getDiscount(Integer studentId);
}
