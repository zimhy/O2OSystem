package cn.itcast.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.ssm.po.DiscountDetaileCustom;
import cn.itcast.ssm.po.StudentCustom;
import cn.itcast.ssm.service.StudentService;
import cn.itcast.ssm.view.DiscountCustomView;
import cn.itcast.ssm.view.OrdersCarListView;
import cn.itcast.ssm.view.StudentCourseEnrollView;
import cn.itcast.ssm.view.StudentView;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private StudentService studentService;
	
//	根据学生ID查询学生信息
	@RequestMapping(value="/queryStuInfo.action",method=RequestMethod.GET)
	public @ResponseBody StudentView queryStuInfo(Integer studentId) throws Exception{
		StudentView sv = studentService.findStudentByStudentId(studentId);
		System.out.println(sv.toString());
		return sv;
	}
	
//	更新学生信息
	@RequestMapping(value="/updateStuInfoSubmit.action")
	public void updateStuInfoSubmit(StudentCustom sc) throws Exception{
		if(studentService.updateStudent(sc)){
			System.out.println("修改成功");
		}else{
			System.out.println("修改失败");
		}
	}
	
//	查询学生所有优惠券，返回列表
	@RequestMapping(value="/queryDiscountList.action",method=RequestMethod.GET)
	public @ResponseBody List<DiscountCustomView> queryDiscountList(Integer studentId)throws Exception{
		List<DiscountCustomView> discountCustomViews=studentService.findDiscountsBySId(studentId);
		for(DiscountCustomView discountCustomView:discountCustomViews){
			System.out.println(discountCustomView.toString());
		}
		return discountCustomViews;
	}
	
//	查询优惠券详细信息
	@RequestMapping(value="queryDiscountDetail.action",method=RequestMethod.GET)
	public @ResponseBody DiscountDetaileCustom queryDiscountDetail(Integer discountId)throws Exception{
		DiscountDetaileCustom discountDetaileCustom=studentService.findDiscountDetailByDId(discountId);
		System.out.println(discountDetaileCustom.toString());
		return discountDetaileCustom;
	}
	
//	学生课程报名
	@RequestMapping(value="courseEnroll.action", method=RequestMethod.GET)
	public @ResponseBody StudentCourseEnrollView courseEnroll(Integer studentId,Integer courseId){
		StudentCourseEnrollView studentCourseEnrollView=studentService.studentCourseEnroll(studentId, courseId);
		System.out.println(studentCourseEnrollView.toString());
		return studentCourseEnrollView;
	}
	
//	查询购物车列表
	@RequestMapping(value="queryOrdersCarList.action",method=RequestMethod.GET)
	public @ResponseBody List<OrdersCarListView> queryOrdersCarList(Integer studentId){
		List<OrdersCarListView> ordersCarListViews=studentService.findOrderscarListBySId(studentId);
		for(OrdersCarListView ordersCarListView:ordersCarListViews){
			System.out.println(ordersCarListView.toString());
		}
		return ordersCarListViews;
	}
}
