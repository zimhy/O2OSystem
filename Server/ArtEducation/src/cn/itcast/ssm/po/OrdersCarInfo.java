package cn.itcast.ssm.po;

public class OrdersCarInfo {
	
	private int ordersCarId;
	private int courseId;
	private String courseName;
	private String teacherName;
	private String organizationName;
	
	
	
	public int getOrdersCarId() {
		return ordersCarId;
	}
	public void setOrdersCarId(int ordersCarId) {
		this.ordersCarId = ordersCarId;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getOrganizationName() {
		return organizationName;
	}
	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}
	
	
}
