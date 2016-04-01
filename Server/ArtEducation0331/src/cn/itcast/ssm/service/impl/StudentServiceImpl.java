package cn.itcast.ssm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.StudentMapper;
import cn.itcast.ssm.po.CourseCustom;
import cn.itcast.ssm.po.DiscountCustom;
import cn.itcast.ssm.po.DiscountDetaileCustom;
import cn.itcast.ssm.po.MyDiscountInfo;
import cn.itcast.ssm.po.OrdersCarCustom;
import cn.itcast.ssm.po.OrdersCarInfo;
import cn.itcast.ssm.po.OrdersCarList;
import cn.itcast.ssm.po.Student;
import cn.itcast.ssm.po.StudentCustom;
import cn.itcast.ssm.service.StudentService;
import cn.itcast.ssm.view.DiscountCustomView;
import cn.itcast.ssm.view.OrdersCarListView;
import cn.itcast.ssm.view.StudentCourseEnrollView;
import cn.itcast.ssm.view.StudentView;


/**
 *实现学生服务接口
 * @author linbo
 *
 */
public class StudentServiceImpl implements StudentService{
	
	@Autowired
	private StudentMapper studentMapper;
	
// 根据学生的用户名或邮箱查询学生信息
	@Override
	public Student findStudentByNameOrEmail(String userName) {
		// TODO Auto-generated method stub
		try {
			Student student=studentMapper.findStudentByNameOrEmail(userName);
			return student;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
//	学生登录
	@Override
	public String login(String value,String password) {
		// TODO Auto-generated method stub
		try {
			StudentCustom sc=studentMapper.findStudentByNameOrEmail(value);
			if(sc==null){
				return "{\"resultCode\":\"9001\"}";
			}else{
				if(sc.getPassword().equals(password)){
					return "{\"resultCode\":\"0\",\"studentId\":"+sc.getStudentId()+"}";
				}else{
					return "{\"resultCode\":\"9002\"}";
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "{\"resultCode\":\"9009\"}";
		}
	}

//	查询学生信息
	@Override
	public StudentView findStudentByStudentId(Integer studentId) throws Exception {
		// TODO Auto-generated method stub
//		System.out.println("---------"+studentMapper+"--------");
		StudentCustom sc = studentMapper.findStudentById(studentId);
		if(sc != null){
			StudentView sv = transToStudentView(sc);
			return sv;
		}
		return null;
	}

	private StudentView transToStudentView(StudentCustom sc){
		StudentView sv = new StudentView();
		sv.setStudentId(sc.getStudentId());
		sv.setStudentName(sc.getStudentName());
		sv.setEmail(sc.getEmail());
		sv.setHeadPortraits(sc.getHeadPortraits());
		sv.setStudentAge(sc.getStudentAge());
		sv.setRealName(sc.getRealName());
		if(sc.getGender().equals("男")){
			sv.setGender("男");
		}else if(sc.getGender().equals("女")){
			sv.setGender("女");
		}
		sv.setPreference(sc.getPreference());
		return sv;
	}
//  更新学生信息
	@Override
	public String updateStudent(StudentCustom sc) {
		// TODO Auto-generated method stub
		
		try{
			studentMapper.updateStudent(sc);
			return "{\"resultCode\":0}";
		}catch(Exception e){
			e.printStackTrace();
			return "{\"resultCode\":9009}";
		}
	}

//	查询学生所拥有的所有优惠券信息
	@Override
	public List<DiscountCustomView> findDiscountsBySId(Integer studentId) {
		// TODO Auto-generated method stub
		List<DiscountCustom> discountCustoms= studentMapper.findDiscountsBySId(studentId);
		for(DiscountCustom discountCustom:discountCustoms){
			System.out.println(discountCustom.toString());
		}
		List<DiscountCustomView> discountCustomViews=new ArrayList<>();
		if(discountCustoms!=null){
			for(DiscountCustom discountCustom:discountCustoms){
				DiscountCustomView discountCustomView=new DiscountCustomView();
				discountCustomView.setDiscountId(discountCustom.getDiscountId());
				discountCustomView.setDiscountCode(discountCustom.getDiscountCode());
				discountCustomView.setCourseId(discountCustom.getCourseId());
				discountCustomView.setCourseName(discountCustom.getCourseName());
				discountCustomView.setMainImage(discountCustom.getMainImage());
				discountCustomView.setOrganizationName(discountCustom.getOrganizationName());
				discountCustomView.setTeacherName(discountCustom.getTeacherName());
				discountCustomViews.add(discountCustomView);
//				System.out.println(discountCustomView);
			}
		}
		return discountCustomViews;
	}

//	查询优惠券的详细信息
	@Override
	public DiscountDetaileCustom findDiscountDetailByDId(Integer discountId) {
		// TODO Auto-generated method stub
		if(studentMapper.findDiscountDetailByDId(discountId)!=null){
			return studentMapper.findDiscountDetailByDId(discountId);
		}
		return null;
	}


	
//	学生课程报名
	@Override
	public StudentCourseEnrollView studentCourseEnroll(Integer studentId, Integer courseId) {
		// TODO Auto-generated method stub
		Student student=studentMapper.findStudentById(studentId);
		if(student!=null){
			StudentCourseEnrollView studentCourseEnrollView=new StudentCourseEnrollView();
			studentCourseEnrollView.setStudentId(studentId);
			studentCourseEnrollView.setCourseId(courseId);
			studentCourseEnrollView.setStudentName(student.getStudentName());
			studentCourseEnrollView.setGender(student.getGender());
			studentCourseEnrollView.setPhone(student.getPhone());
			return studentCourseEnrollView;
		}
		return null;
	}


//	查询购物车列表
	@Override
	public List<OrdersCarListView> findOrderscarListBySId(Integer studentId) {
		// TODO Auto-generated method stub
		List<OrdersCarList> ordersCarLists=studentMapper.findOrderscarListBySId(studentId);
		if(ordersCarLists!=null){
			List<OrdersCarListView> ordersCarListViews=new ArrayList<>();
			for(OrdersCarList ordersCarList:ordersCarLists){
				OrdersCarListView ordersCarListView=new OrdersCarListView();
				ordersCarListView.setCourseId(ordersCarList.getCourseId());
				ordersCarListView.setCourseName(ordersCarList.getCourseName());
				ordersCarListView.setTeacherName(ordersCarList.getTeacherName());
				ordersCarListView.setOrganizationAddr(ordersCarList.getOrganizationAddr());
				ordersCarListView.setOrganizationName(ordersCarList.getOrganizationName());
				ordersCarListView.setMainImage(ordersCarList.getMainImage());
				ordersCarListViews.add(ordersCarListView);
			}
			return ordersCarListViews;
		}
		return null;
	}


//	学生注册，返回studentId
	@Override
	public String registerStudent(StudentCustom studentCustom) {
		// TODO Auto-generated method stub
		Integer studentId;
		Student  newStu=null;
//		判断用户名是否已经存在
		try {
			newStu=studentMapper.findStudentByNameOrEmail(studentCustom.getStudentName());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(newStu!=null){
			return "{\"resultCode\":"+"\"9003\"}";
		}
		
//		判断邮箱是否已经存在
		try {
			newStu=studentMapper.findStudentByNameOrEmail(studentCustom.getEmail());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(newStu!=null){
			return "{\"resultCode\":"+"\"9005\"}";
		}
		
//		resultCode=0注册成功
		try {
			studentMapper.insertStudent(studentCustom);
			studentId=studentCustom.getStudentId();
			return "{\"resultCode\":"+"\"0\","+"\"studentId\":"+studentId+"}";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "{\"resultCode\":"+"\"9999\"}";
		}
	}

//    将学生选择课程添加进购物车，返回购物车id
	@Override
	public String addToOrdersCar(OrdersCarCustom ordersCarCustom) {
		// TODO Auto-generated method stub
		CourseCustom courseCustom=findCoursePriceById(ordersCarCustom.getCourseId());
//		查询课程单价
		float price=courseCustom.getCoursePrice();
		ordersCarCustom.setTotalPrice(price);
		ordersCarCustom.setTime(new Date());
		ordersCarCustom.setCount(1);
		
		int ordersCarId=0;
		
//        判断购物中该学生是否已经添加过此门课程
		OrdersCarCustom ocs=studentMapper.findCarCourseByCourseId(ordersCarCustom);
		if(ocs!=null){
			return "{\"resultCode\":9005}";
		}
		
	    try {
			studentMapper.addToOrdersCar(ordersCarCustom);
//			加入购物车成功，获取加入购物车的后自动生成的id
			ordersCarId=ordersCarCustom.getOrdersCarId();
			return "{\"resultCode\":0,"+"\"ordersCarId\":"+ordersCarId+"}";
		} catch (Exception e) {
			return "{\"resultCode\":9001}";
		}
	}


//	根据课程id查询课程单价
	@Override
	public CourseCustom findCoursePriceById(Integer courseId) {
		// TODO Auto-generated method stub
		return studentMapper.findCoursePriceById(courseId);
	}


	
	
//	查询学生的购物车信息
	@Override
	public List<OrdersCarInfo>  queryOrdersCar(Integer studentId) {
		return studentMapper.queryOrdersCar(studentId);
	}

//   根据学生id和课程id，查询购物车中该学生是否已经添加该课程
	@Override
	public OrdersCarCustom findCarCourseByCourseId(OrdersCarCustom ordersCarCustom) {
		return studentMapper.findCarCourseByCourseId(ordersCarCustom);
	}

//  更新购物车信息
	@Override
	public boolean updateOrdersCar(OrdersCarCustom ordersCarCustom) {
		try {
			studentMapper.updateOrdersCar(ordersCarCustom);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

//  删除购物车中的课程
	@Override
	public String deleteOrdersCar(List<Integer> ordersCarIds) {
		// TODO Auto-generated method stub
		try {
			for(int i:ordersCarIds){
				studentMapper.deleteOrdersCar(i);	
			}
			return "{\"resultCode\":0}";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "{\"resultCode\":9001}";
		}
	}

//  获取优惠券信息
	@Override
	public List<MyDiscountInfo> getDiscount(Integer studentId) {
		// TODO Auto-generated method stub
		return studentMapper.getDiscount(studentId);
	}
}



















