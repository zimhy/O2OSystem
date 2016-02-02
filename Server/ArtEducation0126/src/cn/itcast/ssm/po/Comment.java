package cn.itcast.ssm.po;

public class Comment {

	private String starLevel;
	private String comment;
	private Integer couStuId;
	
	private StudentCustom studentCustom;
	
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

	public Integer getCouStuId() {
		return couStuId;
	}
	public void setCouStuId(Integer couStuId) {
		this.couStuId = couStuId;
	}
	
	public StudentCustom getStudentCustom() {
		return studentCustom;
	}
	public void setStudentCustom(StudentCustom studentCustom) {
		this.studentCustom = studentCustom;
	}
	
}
