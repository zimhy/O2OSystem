package cn.itcast.ssm.po;

import java.util.Date;

public class Course {
    private Integer courseId;

    private String courseCode;

    private Integer courseTypeId;

    private Integer teacherId;

    private String courseName;

    private String courseDesc;

    private Date teachTime;

    private String totalStarLevel;

    private String teachAddress;

    private Integer lessonNum;

    private Integer teachMethod;

    private Integer listenTest;

    private Float coursePrice;

    private String mainImage;

    private Integer planStuNum;

    private Integer realStuNum;

    private Integer courseStatus;

    private String discountUseInfo;

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode == null ? null : courseCode.trim();
    }

    public Integer getCourseTypeId() {
        return courseTypeId;
    }

    public void setCourseTypeId(Integer courseTypeId) {
        this.courseTypeId = courseTypeId;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName == null ? null : courseName.trim();
    }

    public String getCourseDesc() {
        return courseDesc;
    }

    public void setCourseDesc(String courseDesc) {
        this.courseDesc = courseDesc == null ? null : courseDesc.trim();
    }

    public Date getTeachTime() {
        return teachTime;
    }

    public void setTeachTime(Date teachTime) {
        this.teachTime = teachTime;
    }

    public String getTotalStarLevel() {
        return totalStarLevel;
    }

    public void setTotalStarLevel(String totalStarLevel) {
        this.totalStarLevel = totalStarLevel == null ? null : totalStarLevel.trim();
    }

    public String getTeachAddress() {
        return teachAddress;
    }

    public void setTeachAddress(String teachAddress) {
        this.teachAddress = teachAddress == null ? null : teachAddress.trim();
    }

    public Integer getLessonNum() {
        return lessonNum;
    }

    public void setLessonNum(Integer lessonNum) {
        this.lessonNum = lessonNum;
    }

    public Integer getTeachMethod() {
        return teachMethod;
    }

    public void setTeachMethod(Integer teachMethod) {
        this.teachMethod = teachMethod;
    }

    public Integer getListenTest() {
        return listenTest;
    }

    public void setListenTest(Integer listenTest) {
        this.listenTest = listenTest;
    }

    public Float getCoursePrice() {
        return coursePrice;
    }

    public void setCoursePrice(Float coursePrice) {
        this.coursePrice = coursePrice;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage == null ? null : mainImage.trim();
    }

    public Integer getPlanStuNum() {
        return planStuNum;
    }

    public void setPlanStuNum(Integer planStuNum) {
        this.planStuNum = planStuNum;
    }

    public Integer getRealStuNum() {
        return realStuNum;
    }

    public void setRealStuNum(Integer realStuNum) {
        this.realStuNum = realStuNum;
    }

    public Integer getCourseStatus() {
        return courseStatus;
    }

    public void setCourseStatus(Integer courseStatus) {
        this.courseStatus = courseStatus;
    }

    public String getDiscountUseInfo() {
        return discountUseInfo;
    }

    public void setDiscountUseInfo(String discountUseInfo) {
        this.discountUseInfo = discountUseInfo == null ? null : discountUseInfo.trim();
    }
}