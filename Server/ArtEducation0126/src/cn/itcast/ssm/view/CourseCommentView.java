package cn.itcast.ssm.view;

public class CourseCommentView {
	private String studentName;
	private String starLevel;
	private String comment;
	private String studentHeadPortraits;
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStarLevel() {
		return starLevel;
	}
	public void setStarLevel(String starLevel) {
		this.starLevel = starLevel;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getStudentHeadPortraits() {
		return studentHeadPortraits;
	}
	public void setStudentHeadPortraits(String studentHeadPortraits) {
		this.studentHeadPortraits = studentHeadPortraits;
	}
	@Override
	public String toString() {
		return "CourseCommentView [studentName=" + studentName + ", starLevel=" + starLevel + ", comment=" + comment
				+ ", studentHeadPortraits=" + studentHeadPortraits + "]";
	}
	
}
