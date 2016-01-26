package cn.itcast.ssm.mapper;

import java.util.List;

import cn.itcast.ssm.po.DiscountCustom;
import cn.itcast.ssm.po.DiscountDetaileCustom;
import cn.itcast.ssm.po.OrdersCarList;
import cn.itcast.ssm.po.Student;
import cn.itcast.ssm.po.StudentCustom;

public interface StudentMapper {
	
	//	根据学生的用户名查询学生信息，学生的用户名是唯一的
	public Student findStudentByName(String studentName)throws Exception;
	
	//	根据学生的用户名或邮箱查询学生信息，学生的邮箱也是唯一的
	public Student findStudentByNameOrEmail(String userName)throws Exception;
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
}
