package cn.itcast.ssm.po;

import java.util.Date;

public class UserToken {
    private Integer usertokenId;

    private Integer studentId;

    private Integer tercherId;

    private String token;

    private Date productionTime;

    private Date effectiveTime;

    public Integer getUsertokenId() {
        return usertokenId;
    }

    public void setUsertokenId(Integer usertokenId) {
        this.usertokenId = usertokenId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getTercherId() {
        return tercherId;
    }

    public void setTercherId(Integer tercherId) {
        this.tercherId = tercherId;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token == null ? null : token.trim();
    }

    public Date getProductionTime() {
        return productionTime;
    }

    public void setProductionTime(Date productionTime) {
        this.productionTime = productionTime;
    }

    public Date getEffectiveTime() {
        return effectiveTime;
    }

    public void setEffectiveTime(Date effectiveTime) {
        this.effectiveTime = effectiveTime;
    }
}