package cn.itcast.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.ssm.po.DiscountDetaileCustom;
import cn.itcast.ssm.po.MyDiscountInfo;
import cn.itcast.ssm.po.OrdersCarCustom;
import cn.itcast.ssm.po.OrdersCarInfo;
import cn.itcast.ssm.po.StudentCustom;
import cn.itcast.ssm.service.StudentService;
import cn.itcast.ssm.view.DiscountCustomView;
import cn.itcast.ssm.view.OrdersCarListView;
import cn.itcast.ssm.view.StudentCourseEnrollView;
import cn.itcast.ssm.view.StudentCourseView;
import cn.itcast.ssm.view.StudentView;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	
//  学生登录
	@RequestMapping(value="/login.action",method=RequestMethod.POST)
	public void login(HttpServletRequest request,HttpServletResponse response){
		String data=request.getParameter("data");
		JSONObject jsonObject=JSONObject.fromObject(data);
		String account=jsonObject.get("account").toString();
		String password=jsonObject.get("password").toString();
		String resultCode=studentService.login(account, password);
		
		PrintWriter pw=null;
		
		try {
			pw=response.getWriter();
			pw.write(resultCode);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
//	根据学生ID查询学生信息
	@RequestMapping(value="/queryStuInfo.action",method=RequestMethod.GET)
	public @ResponseBody StudentView queryStuInfo(Integer studentId) throws Exception{
		StudentView sv = studentService.findStudentByStudentId(studentId);
		System.out.println(sv.toString());
		return sv;
	}
	
//	更新学生信息
	@RequestMapping(value="/updateStuInfoSubmit.action",method=RequestMethod.POST)
	public void updateStuInfoSubmit(HttpServletRequest request,HttpServletResponse response) {
		String data=request.getParameter("data");
		JSONObject jsonObject=JSONObject.fromObject(data);
		StudentCustom studentCustom=new StudentCustom();
		
	    studentCustom.setStudentId(Integer.parseInt(jsonObject.get("studentId").toString()));
		studentCustom.setPhone(jsonObject.get("phone").toString());
		studentCustom.setStudentAge(Integer.parseInt(jsonObject.get("studentAge").toString()));
		studentCustom.setPreference(jsonObject.get("preference").toString());
		
		String resultCode=studentService.updateStudent(studentCustom);
		
		try {
			PrintWriter ps=response.getWriter();
			ps.write(resultCode);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	@RequestMapping(value="/queryDiscountDetail.action",method=RequestMethod.GET)
	public @ResponseBody DiscountDetaileCustom queryDiscountDetail(Integer discountId)throws Exception{
		DiscountDetaileCustom discountDetaileCustom=studentService.findDiscountDetailByDId(discountId);
		System.out.println(discountDetaileCustom.toString());
		return discountDetaileCustom;
	}
	
//	学生课程报名
	@RequestMapping(value="/courseEnroll.action", method=RequestMethod.GET)
	public @ResponseBody StudentCourseEnrollView courseEnroll(Integer studentId,Integer courseId){
		StudentCourseEnrollView studentCourseEnrollView=studentService.studentCourseEnroll(studentId, courseId);
		System.out.println(studentCourseEnrollView.toString());
		return studentCourseEnrollView;
	}
	
//	查询购物车列表
	@RequestMapping(value="/queryOrdersCarList.action",method=RequestMethod.GET)
	public @ResponseBody List<OrdersCarListView> queryOrdersCarList(Integer studentId){
		List<OrdersCarListView> ordersCarListViews=studentService.findOrderscarListBySId(studentId);
		for(OrdersCarListView ordersCarListView:ordersCarListViews){
			System.out.println(ordersCarListView.toString());
		}
		return ordersCarListViews;
	}
	
	
	
//	学生注册，返回学生id
	@RequestMapping(value="/registerStudent.action",method=RequestMethod.POST)
	public void registerStudnet(HttpServletRequest request,HttpServletResponse response){
		
		String data=request.getParameter("data").trim();
//		System.out.println(data);
		JSONObject jsonObject=JSONObject.fromObject(data);
//		System.out.println(jsonObject.get("studentName").toString());
//		System.out.println("123");
		StudentCustom studentCustom=new StudentCustom();
		studentCustom.setStudentName(jsonObject.get("studentName").toString());
		studentCustom.setEmail(jsonObject.get("email").toString());
		studentCustom.setPassword(jsonObject.get("password").toString());
		studentCustom.setRealName(jsonObject.get("realName").toString());
		studentCustom.setGender(jsonObject.get("gender").toString());
		studentCustom.setStudentAge(Integer.parseInt(jsonObject.get("studentAge").toString()));
		studentCustom.setPreference(jsonObject.get("preference").toString());
		studentCustom.setPhone(jsonObject.get("phone").toString());
		
		System.out.println(studentCustom);
		
		String s=studentService.registerStudent(studentCustom);
		PrintWriter ps=null;
		try {
			ps = response.getWriter();
			ps.write(s);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
//	将学生选择的课程添加进购物车
	@RequestMapping(value="/addToOrdersCar.action",method=RequestMethod.POST)
	public void addToOrdersCar(HttpServletRequest request,HttpServletResponse response){
		String data=request.getParameter("data").trim();
		JSONObject jsonObject=JSONObject.fromObject(data);
		
		OrdersCarCustom ordersCarCustom=new OrdersCarCustom();
		
		ordersCarCustom.setStudentId(Integer.parseInt(jsonObject.get("studentId").toString()));
		ordersCarCustom.setCourseId(Integer.parseInt(jsonObject.get("courseId").toString()));
		
		String s=studentService.addToOrdersCar(ordersCarCustom);
		
		PrintWriter ps=null;
		
		try {
			ps=response.getWriter();
			ps.write(s);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
//	查询购物车信息
	@RequestMapping(value="/queryOrdersCar.action",method=RequestMethod.GET)
	public @ResponseBody List<OrdersCarInfo>  queryOrdersCar(Integer studentId){
		return studentService.queryOrdersCar(studentId);
	}
	
//	删除购物车中的课程
	@RequestMapping(value="/deleteOrdersCar.action",method=RequestMethod.POST)
	public void deleteOrdersCar(HttpServletRequest request,HttpServletResponse response){
		String data=request.getParameter("data");
		JSONObject jsonObject=JSONObject.fromObject(data);
		String s=jsonObject.get("ids").toString();
		JSONArray jsonArray=JSONArray.fromObject(s);
		List<Integer> list=new ArrayList<>();
		for(int i=0;i<jsonArray.size();i++){
			list.add(Integer.parseInt(jsonArray.getJSONObject(i).get("id").toString()));
		}
		
		String resultCode=studentService.deleteOrdersCar(list);
		
		try {
			PrintWriter ps=response.getWriter();
			ps.write(resultCode);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/getDiscount.action",method=RequestMethod.GET)
	public @ResponseBody List<MyDiscountInfo> getDiscount(Integer studentId){
		return studentService.getDiscount(studentId);
	}
	
	@RequestMapping(value="/queryStuCourseList.action",method=RequestMethod.GET)
	public @ResponseBody List<StudentCourseView> queryStuCourseList(Integer studentId){
		return studentService.findStuCouViewBySId(studentId);
	}
	
//  生成优惠码
	@RequestMapping(value="/getDiscountNum.action",method=RequestMethod.POST)
	public void getDiscountNum(HttpServletRequest request,HttpServletResponse response){
		String data=request.getParameter("data");
		JSONObject jsonObject=JSONObject.fromObject(data);
		String resultCode=null;
//		获取学生id
		Integer studentId=Integer.parseInt(jsonObject.get("studentId").toString());
		
		String s=jsonObject.get("ids").toString();
		JSONArray jsonArray=JSONArray.fromObject(s);
		
		try {
			for(int i=0;i<jsonArray.size();i++){
				Integer ordersCarId=Integer.parseInt(jsonArray.getJSONObject(i).get("id").toString());
				Integer courseId=Integer.parseInt(jsonArray.getJSONObject(i).get("courseId").toString());
				studentService.insertDiscountNum(studentId, courseId, ordersCarId);
			}
			resultCode="{\"resultCode\":0}";
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resultCode="{\"resultCode\":9001}";
		}
		
		
		try {
			PrintWriter ps=response.getWriter();
			ps.write(resultCode);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}















