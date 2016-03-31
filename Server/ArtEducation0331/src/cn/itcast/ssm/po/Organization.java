package cn.itcast.ssm.po;

public class Organization {
    private Integer organizationId;

    private String organizationName;
    
    private String password;

    private String organizationDescription;

    private String imageId;

    private String organizationUrl;

    private String orgnizationAddr;
    
    

    public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(Integer organizationId) {
        this.organizationId = organizationId;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName == null ? null : organizationName.trim();
    }

    public String getOrganizationDescription() {
        return organizationDescription;
    }

    public void setOrganizationDescription(String organizationDescription) {
        this.organizationDescription = organizationDescription == null ? null : organizationDescription.trim();
    }

    public String getImageId() {
        return imageId;
    }

    public void setImageId(String imageId) {
        this.imageId = imageId == null ? null : imageId.trim();
    }

    public String getOrganizationUrl() {
        return organizationUrl;
    }

    public void setOrganizationUrl(String organizationUrl) {
        this.organizationUrl = organizationUrl == null ? null : organizationUrl.trim();
    }

    public String getOrgnizationAddr() {
        return orgnizationAddr;
    }

    public void setOrgnizationAddr(String orgnizationAddr) {
        this.orgnizationAddr = orgnizationAddr == null ? null : orgnizationAddr.trim();
    }
}