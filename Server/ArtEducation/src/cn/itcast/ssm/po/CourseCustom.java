package cn.itcast.ssm.po;

public class CourseCustom extends Course{
	private String teacherName;
	private String organizationName;
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
		return "CourseCustom [teacherName=" + teacherName + ", organizationName=" + organizationName
				+ ", getCourseId()=" + getCourseId() + ", getCourseCode()=" + getCourseCode() + ", getCourseTypeId()="
				+ getCourseTypeId() + ", getTeacherId()=" + getTeacherId() + ", getCourseName()=" + getCourseName()
				+ ", getCourseDesc()=" + getCourseDesc() + ", getTeachTime()=" + getTeachTime()
				+ ", getTotalStarLevel()=" + getTotalStarLevel() + ", getTeachAddress()=" + getTeachAddress()
				+ ", getLessonNum()=" + getLessonNum() + ", getTeachMethod()=" + getTeachMethod() + ", getListenTest()="
				+ getListenTest() + ", getCoursePrice()=" + getCoursePrice() + ", getMainImage()=" + getMainImage()
				+ ", getPlanStuNum()=" + getPlanStuNum() + ", getRealStuNum()=" + getRealStuNum()
				+ ", getCourseStatus()=" + getCourseStatus() + ", getDiscountUseInfo()=" + getDiscountUseInfo() + "]";
	}
	
}
