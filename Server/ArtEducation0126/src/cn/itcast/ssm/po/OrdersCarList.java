package cn.itcast.ssm.po;

public class OrdersCarList extends Course{
	
	private String teacherName;
	private String organizationAddr;
	private String organizationName;
	
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getOrganizationName() {
		return organizationName;
	}
	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}
	public String getOrganizationAddr() {
		return organizationAddr;
	}
	public void setOrganizationAddr(String organizationAddr) {
		this.organizationAddr = organizationAddr;
	}
	
	
	
	
}
