package cn.itcast.ssm.service;

import cn.itcast.ssm.po.Organization;

public interface OrganizationService {
	
	public Organization findOrganizationByName(String userName)throws Exception;
	
	
}
