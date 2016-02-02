package cn.itcast.ssm.view;

import java.util.List;

public class CourseDetailView {
	private Integer courseId;
	private String courseName;
	private String teacherName;
	private String mainImage;
	private String courseDesc;
	private Integer courseStatus;
	private String education;
	private Integer seniority;
	private String description;
	private String teacherHeadPortraits;
	private String organizationName;
	private String organizationDescription;
	private String organizationImageId;
	private List<CourseCommentView> courseCommentViews;
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
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public String getCourseDesc() {
		return courseDesc;
	}
	public void setCourseDesc(String courseDesc) {
		this.courseDesc = courseDesc;
	}
	public Integer getCourseStatus() {
		return courseStatus;
	}
	public void setCourseStatus(Integer courseStatus) {
		this.courseStatus = courseStatus;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	
	public Integer getSeniority() {
		return seniority;
	}
	public void setSeniority(Integer seniority) {
		this.seniority = seniority;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTeacherHeadPortraits() {
		return teacherHeadPortraits;
	}
	public void setTeacherHeadPortraits(String teacherHeadPortraits) {
		this.teacherHeadPortraits = teacherHeadPortraits;
	}
	public String getOrganizationName() {
		return organizationName;
	}
	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}
	public String getOrganizationDescription() {
		return organizationDescription;
	}
	public void setOrganizationDescription(String organizationDescription) {
		this.organizationDescription = organizationDescription;
	}
	public String getOrganizationImageId() {
		return organizationImageId;
	}
	public void setOrganizationImageId(String organizationImageId) {
		this.organizationImageId = organizationImageId;
	}
	public List<CourseCommentView> getCourseCommentViews() {
		return courseCommentViews;
	}
	public void setCourseCommentViews(List<CourseCommentView> courseCommentViews) {
		this.courseCommentViews = courseCommentViews;
	}
	@Override
	public String toString() {
		return "CourseDetailView [courseId=" + courseId + ", courseName=" + courseName + ", teacherName=" + teacherName
				+ ", mainImage=" + mainImage + ", courseDesc=" + courseDesc + ", courseStatus=" + courseStatus
				+ ", education=" + education + ", seniority=" + seniority + ", description=" + description
				+ ", teacherHeadPortraits=" + teacherHeadPortraits + ", organizationName=" + organizationName
				+ ", organizationDescription=" + organizationDescription + ", organizationImageId="
				+ organizationImageId + ", courseCommentViews=" + courseCommentViews + "]";
	}
	
	
}
