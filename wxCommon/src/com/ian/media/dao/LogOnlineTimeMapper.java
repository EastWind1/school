package com.ian.media.dao;

import java.util.List;
import java.util.Map;

import com.ian.media.model.LogOnlineTime;

public interface LogOnlineTimeMapper extends BaseDao<LogOnlineTime,String>{
	public List<LogOnlineTime> get(Map<Object,Object> map);
	
	public int getCount(Map<Object,Object> map);
	
	public List<LogOnlineTime> getList(Map<Object,Object> map);
	
	public int getNumber1(Map<Object,Object> map);
	
	public  void  updateByElementsSelective(LogOnlineTime parmas);
	
}