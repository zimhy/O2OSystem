package cn.itcast.ssm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.StudentMapper;
import cn.itcast.ssm.po.DiscountCustom;
import cn.itcast.ssm.po.DiscountDetaileCustom;
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
	public Student findStudentByNameOrEmail(String userName) throws Exception {
		// TODO Auto-generated method stub
		return studentMapper.findStudentByNameOrEmail(userName);
	}

	
	@Override
	public StudentView findStudentByStudentId(Integer studentId) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("---------"+studentMapper+"--------");
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
		sv.setNickName(sc.getNickName());
		sv.setEmail(sc.getEmail());
		sv.setHeadPortraits(sc.getHeadPortraits());
		sv.setStudentAge(sc.getStudentAge());
		sv.setRealName(sc.getRealName());
		if(sc.getGender().equals("1001")){
			sv.setGender("男");
		}else if(sc.getGender().equals("1002")){
			sv.setGender("女");
		}
		sv.setPreference(sc.getPreference());
		return sv;
	}
//  更新学生信息
	@Override
	public boolean updateStudent(StudentCustom sc) {
		// TODO Auto-generated method stub
		Integer studentId = sc.getStudentId();
		StudentCustom newSc = studentMapper.findStudentById(studentId);
		newSc.setNickName(sc.getNickName());
		newSc.setEmail(sc.getEmail());
		newSc.setHeadPortraits(sc.getHeadPortraits());
		newSc.setStudentAge(sc.getStudentAge());
		newSc.setRealName(sc.getRealName());
		newSc.setGender(sc.getGender());
		newSc.setPreference(sc.getPreference());
		try{
			studentMapper.updateStudent(newSc);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
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
}
