package cn.itcast.ssm.view;

public class OrdersCarListView {
	
	private Integer courseId;
	private String courseName;
	private String teacherName;
	private String organizationName;
	private String mainImage;
	private String organizationAddr;
	
	
	public String getOrganizationAddr() {
		return organizationAddr;
	}
	public void setOrganizationAddr(String organizationAddr) {
		this.organizationAddr= organizationAddr;
	}
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
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
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	@Override
	public String toString() {
		return "OrdersCarListView [courseId=" + courseId + ", courseName=" + courseName + ", teacherName=" + teacherName
				+ ", organizationName=" + organizationName + ", mainImage=" + mainImage + "]";
	}
	
}
