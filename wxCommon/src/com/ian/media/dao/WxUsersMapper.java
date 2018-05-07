package com.ian.media.dao;

import java.util.List;
import java.util.Map;

import com.ian.media.model.LogLogin;
import com.ian.media.model.WxUsers;

public interface WxUsersMapper extends BaseDao<WxUsers, String>{
	
	public List<WxUsers> getGameCustomer(Map map);
	
	public void updateByPrimaryKeySelectiveBrand(WxUsers customer);
	
	public List<WxUsers> tjqgwxUsers(Map map);
	
	public List<WxUsers> tjgzwxUsers(Map map);
	
	public List<WxUsers> listWxUsers(Map map);
	
	public int getNumber(Map<Object,Object> map);
}