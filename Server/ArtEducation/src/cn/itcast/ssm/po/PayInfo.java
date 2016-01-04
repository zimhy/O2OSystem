package cn.itcast.ssm.po;

public class PayInfo {
    private Integer payId;

    private String bankId;

    private Integer ordersId;

    private Float realPayMoney;

    public Integer getPayId() {
        return payId;
    }

    public void setPayId(Integer payId) {
        this.payId = payId;
    }

    public String getBankId() {
        return bankId;
    }

    public void setBankId(String bankId) {
        this.bankId = bankId == null ? null : bankId.trim();
    }

    public Integer getOrdersId() {
        return ordersId;
    }

    public void setOrdersId(Integer ordersId) {
        this.ordersId = ordersId;
    }

    public Float getRealPayMoney() {
        return realPayMoney;
    }

    public void setRealPayMoney(Float realPayMoney) {
        this.realPayMoney = realPayMoney;
    }
}