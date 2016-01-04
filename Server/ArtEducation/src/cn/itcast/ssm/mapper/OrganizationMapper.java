package cn.itcast.ssm.mapper;

import cn.itcast.ssm.po.Organization;

public interface OrganizationMapper {
	
	public Organization findOrganizationByName(String username)throws Exception;
	
}
