package cn.itcast.ssm.view;

public class StudentCourseEnrollView {
	
	private Integer courseId;
	private Integer studentId;
	private String studentName;
	private String phone;
	private String gender;
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	@Override
	public String toString() {
		return "StudentCourseEnrollView [courseId=" + courseId + ", studentId=" + studentId + ", studentName="
				+ studentName + ", phone=" + phone + ", gender=" + gender + "]";
	}
	
	

}
