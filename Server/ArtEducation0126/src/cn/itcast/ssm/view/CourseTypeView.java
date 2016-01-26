package cn.itcast.ssm.view;

public class CourseTypeView {
	private Integer courseTypeId;
	private String courseTypeName;
	private String imageId;
	public Integer getCourseTypeId() {
		return courseTypeId;
	}
	public void setCourseTypeId(Integer courseTypeId) {
		this.courseTypeId = courseTypeId;
	}
	public String getCourseTypeName() {
		return courseTypeName;
	}
	public void setCourseTypeName(String courseTypeName) {
		this.courseTypeName = courseTypeName;
	}
	public String getImageId() {
		return imageId;
	}
	public void setImageId(String imageId) {
		this.imageId = imageId;
	}
	@Override
	public String toString() {
		return "CourseTypeView [courseTypeId=" + courseTypeId + ", courseTypeName=" + courseTypeName + ", imageId="
				+ imageId + "]";
	}
	
}
