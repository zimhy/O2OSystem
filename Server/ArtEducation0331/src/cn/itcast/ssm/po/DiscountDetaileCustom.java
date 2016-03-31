package cn.itcast.ssm.po;


/**
 * 这个po类映射优惠券的详细信息
 * @author linbo
 *
 */
public class DiscountDetaileCustom {
	
	private String courseName;
	private String discountCode;
	private String discountUseInfo;
	
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getDiscountCode() {
		return discountCode;
	}
	public void setDiscountCode(String discountCode) {
		this.discountCode = discountCode;
	}
	public String getDiscountUseInfo() {
		return discountUseInfo;
	}
	public void setDiscountUseInfo(String discountUseInfo) {
		this.discountUseInfo = discountUseInfo;
	}
	@Override
	public String toString() {
		return "DiscountDetaileCustom [courseName=" + courseName + ", discountCode=" + discountCode
				+ ", discountUseInfo=" + discountUseInfo + "]";
	}
	
	

}
