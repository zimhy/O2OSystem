package cn.itcast.ssm.mapper;

import java.util.List;

import cn.itcast.ssm.po.CourseCustom;
import cn.itcast.ssm.po.DiscountCustom;
import cn.itcast.ssm.po.DiscountDetaileCustom;
import cn.itcast.ssm.po.MyDiscountInfo;
import cn.itcast.ssm.po.OrdersCarCustom;
import cn.itcast.ssm.po.OrdersCarInfo;
import cn.itcast.ssm.po.OrdersCarList;
import cn.itcast.ssm.po.Student;
import cn.itcast.ssm.po.StudentCustom;

public interface StudentMapper {
	
	//	根据学生的用户名查询学生信息，学生的用户名是唯一的
	public Student findStudentByName(String studentName)throws Exception;
	
	//	根据学生的用户名或邮箱查询学生信息，学生的邮箱也是唯一的
	public StudentCustom findStudentByNameOrEmail(String userName);
	//根据学生Id查询学生信息	
	public StudentCustom findStudentById(Integer studentId);
//	修改学生信息
	public void updateStudent(StudentCustom sc);
//	查询学生所拥有的所有优惠券
	public List<DiscountCustom> findDiscountsBySId(Integer studentId);
//	查询优惠券的详细信息
	public DiscountDetaileCustom findDiscountDetailByDId(Integer discountId);
//	查询购物车列表
	public List<OrdersCarList> findOrderscarListBySId(Integer studentId);
//	学生注册，返回studentId
	public int insertStudent(StudentCustom studentCustom);
	
//	学生选择课程，添加进购物车
	public int addToOrdersCar(OrdersCarCustom ordersCarCustom);
	
//	根据课程id查询课程单价
	public CourseCustom findCoursePriceById(Integer courseId);
	
//	查询购物车信息
	public List<OrdersCarInfo> queryOrdersCar(Integer studentId);
	
//	根据课程id和学生id，查询购物车中是该学生否已经添加该课程
	public OrdersCarCustom findCarCourseByCourseId(OrdersCarCustom ordersCarCustom);
	
//	根据学生id和课程id，更新购物车信息 
 	public boolean  updateOrdersCar(OrdersCarCustom ordersCarCustom);
 	
// 	删除购物车中课程信息
 	public void deleteOrdersCar(Integer ordersCarId);
 	
// 	获取优惠券信息
 	public List<MyDiscountInfo> getDiscount(Integer studentId);
	
}


















