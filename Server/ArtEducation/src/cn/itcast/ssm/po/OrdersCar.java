package cn.itcast.ssm.po;

import java.util.Date;

public class OrdersCar {
    private Integer ordersCarId;

    private Integer studentId;

    private Integer courseId;

    private Date time;

    private Integer count;

    private Float totalPrice;

    public Integer getOrdersCarId() {
        return ordersCarId;
    }

    public void setOrdersCarId(Integer ordersCarId) {
        this.ordersCarId = ordersCarId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Float totalPrice) {
        this.totalPrice = totalPrice;
    }
}