package cn.itcast.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.OrganizationMapper;
import cn.itcast.ssm.po.Organization;
import cn.itcast.ssm.service.OrganizationService;

public class OrganizationServiceImpl implements OrganizationService{
	
	@Autowired
	private OrganizationMapper organizationMapper;

	@Override
	public Organization findOrganizationByName(String userName) throws Exception {
		// TODO Auto-generated method stub
		return organizationMapper.findOrganizationByName(userName);
	}
	
}
