package cn.itcast.ssm.po;

public class Teacher {
    private Integer teacherId;

    private String teacherCode;

    private String teacherName;

    private String password;

    private String email;

    private String headPortraits;

    private String realName;

    private String gender;

    private Integer teacherAge;

    private String preference;

    private String phone;

    private Integer seniority;

    private Integer organizationId;

    private String education;

    private String description;

    private Integer status;
    
    private String idNumber;

    private String teacherType;
    
    private String idPic;
    
    private String diplomaPic;
    
    private String masterDiplomaPic;
    

    
    public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	
	public String getIdPic() {
		return idPic;
	}

	public void setIdPic(String idPic) {
		this.idPic = idPic;
	}

	public String getDiplomaPic() {
		return diplomaPic;
	}

	public void setDiplomaPic(String diplomaPic) {
		this.diplomaPic = diplomaPic;
	}

	public String getMasterDiplomaPic() {
		return masterDiplomaPic;
	}

	public void setMasterDiplomaPic(String masterDiplomaPic) {
		this.masterDiplomaPic = masterDiplomaPic;
	}

	public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherCode() {
        return teacherCode;
    }

    public void setTeacherCode(String teacherCode) {
        this.teacherCode = teacherCode == null ? null : teacherCode.trim();
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName == null ? null : teacherName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getHeadPortraits() {
        return headPortraits;
    }

    public void setHeadPortraits(String headPortraits) {
        this.headPortraits = headPortraits == null ? null : headPortraits.trim();
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Integer getTeacherAge() {
        return teacherAge;
    }

    public void setTeacherAge(Integer teacherAge) {
        this.teacherAge = teacherAge;
    }

    public String getPreference() {
        return preference;
    }

    public void setPreference(String preference) {
        this.preference = preference == null ? null : preference.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getSeniority() {
        return seniority;
    }

    public void setSeniority(Integer seniority) {
        this.seniority = seniority;
    }

    public Integer getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(Integer organizationId) {
        this.organizationId = organizationId;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education == null ? null : education.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getTeacherType() {
        return teacherType;
    }

    public void setTeacherType(String teacherType) {
        this.teacherType = teacherType;
    }

	@Override
	public String toString() {
		return "Teacher [teacherId=" + teacherId + ", teacherCode=" + teacherCode + ", teacherName=" + teacherName
				+ ", password=" + password + ", email=" + email + ", headPortraits=" + headPortraits + ", realName="
				+ realName + ", gender=" + gender + ", teacherAge=" + teacherAge + ", preference=" + preference
				+ ", phone=" + phone + ", seniority=" + seniority + ", organizationId=" + organizationId
				+ ", education=" + education + ", description=" + description + ", status=" + status + ", idNumber="
				+ idNumber + ", teacherType=" + teacherType + ", idPic=" + idPic + ", diplomaPic=" + diplomaPic
				+ ", masterDiplomaPic=" + masterDiplomaPic + "]";
	}
    
    
}