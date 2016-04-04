package cn.itcast.ssm.po;


/**
 * 这个po类映射的是学生优惠券列表中的相关信息
 * @author linbo
 *
 */
public class DiscountCustom  extends Discount{
	
	private String courseName;
	private String mainImage;
	private String teacherName;
	private String organizationName;
	
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
		return "DiscountCustom [courseName=" + courseName + ", mainImage=" + mainImage + ", teacherName=" + teacherName
				+ ", organizationName=" + organizationName + "]";
	}
	
	

}
