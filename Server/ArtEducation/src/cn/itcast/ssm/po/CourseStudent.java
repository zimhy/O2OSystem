package cn.itcast.ssm.po;

import java.util.Date;

public class CourseStudent {
    private Integer couStuId;

    private Integer studentId;

    private Integer stuCourseCode;

    private Integer courseId;

    private Date signupTime;

    private String comment;

    private String starLevel;

    private Integer csStatus;

    private Integer isUseDiscount;

    private Integer payStatus;

    public Integer getCouStuId() {
        return couStuId;
    }

    public void setCouStuId(Integer couStuId) {
        this.couStuId = couStuId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getStuCourseCode() {
        return stuCourseCode;
    }

    public void setStuCourseCode(Integer stuCourseCode) {
        this.stuCourseCode = stuCourseCode;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Date getSignupTime() {
        return signupTime;
    }

    public void setSignupTime(Date signupTime) {
        this.signupTime = signupTime;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public String getStarLevel() {
        return starLevel;
    }

    public void setStarLevel(String starLevel) {
        this.starLevel = starLevel == null ? null : starLevel.trim();
    }

    public Integer getCsStatus() {
        return csStatus;
    }

    public void setCsStatus(Integer csStatus) {
        this.csStatus = csStatus;
    }

    public Integer getIsUseDiscount() {
        return isUseDiscount;
    }

    public void setIsUseDiscount(Integer isUseDiscount) {
        this.isUseDiscount = isUseDiscount;
    }

    public Integer getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(Integer payStatus) {
        this.payStatus = payStatus;
    }
}