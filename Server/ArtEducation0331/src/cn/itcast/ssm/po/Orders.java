package cn.itcast.ssm.po;

import java.util.Date;

public class Orders {
    private Integer ordersId;

    private Integer studentId;

    private Integer courseId;

    private Date orderTime;

    private Integer count;

    private Float realUnitPrice;

    private Integer orderStatus;

    public Integer getOrdersId() {
        return ordersId;
    }

    public void setOrdersId(Integer ordersId) {
        this.ordersId = ordersId;
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

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Float getRealUnitPrice() {
        return realUnitPrice;
    }

    public void setRealUnitPrice(Float realUnitPrice) {
        this.realUnitPrice = realUnitPrice;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }
}