package cn.itcast.ssm.view;

public class StudentView {
	private Integer studentId;
	private String nickName;
	private String email;
	private String headPortraits;
	private Integer studentAge;
	private String realName;
	private String gender;
	private String preference;
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHeadPortraits() {
		return headPortraits;
	}
	public void setHeadPortraits(String headPortraits) {
		this.headPortraits = headPortraits;
	}
	public Integer getStudentAge() {
		return studentAge;
	}
	public void setStudentAge(Integer studentAge) {
		this.studentAge = studentAge;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPreference() {
		return preference;
	}
	public void setPreference(String preference) {
		this.preference = preference;
	}
	@Override
	public String toString() {
		return "StudentView [studentId=" + studentId + ", nickName=" + nickName + ", email=" + email
				+ ", headPortraits=" + headPortraits + ", studentAge=" + studentAge + ", realName=" + realName
				+ ", gender=" + gender + ", preference=" + preference + "]";
	}
	
}
