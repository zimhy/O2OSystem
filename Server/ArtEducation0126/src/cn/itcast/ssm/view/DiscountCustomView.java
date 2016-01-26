package cn.itcast.ssm.view;

public class DiscountCustomView {
	private Integer discountId;
	private String discountCode;
	private Integer courseId;
	private String courseName;
	private String mainImage;
	private String teacherName;
	private String organizationName;
	public Integer getDiscountId() {
		return discountId;
	}
	public void setDiscountId(Integer discountId) {
		this.discountId = discountId;
	}
	public String getDiscountCode() {
		return discountCode;
	}
	public void setDiscountCode(String discountCode) {
		this.discountCode = discountCode;
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
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
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
	@Override
	public String toString() {
		return "DiscountCustomView [discountId=" + discountId + ", discountCode=" + discountCode + ", courseId="
				+ courseId + ", courseName=" + courseName + ", mainImage=" + mainImage + ", teacherName=" + teacherName
				+ ", organizationName=" + organizationName + "]";
	}
	
	
	
}
