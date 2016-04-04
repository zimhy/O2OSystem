package cn.itcast.ssm.po;

/**
 * 封装查询到的学生优惠券信息
 * @author linbo
 *
 */
public class MyDiscountInfo {
	
	private int discountStatus;
	private int courseId;
	private String discountCode;
	private String teacherName;
	private String courseName;
	private String organizationName;
	
	
	
	public int getDiscountStatus() {
		return discountStatus;
	}
	public void setDiscountStatus(int discountStatus) {
		this.discountStatus = discountStatus;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getDiscountCode() {
		return discountCode;
	}
	public void setDiscountCode(String discountCode) {
		this.discountCode = discountCode;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getOrganizationName() {
		return organizationName;
	}
	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}
	
	
}
