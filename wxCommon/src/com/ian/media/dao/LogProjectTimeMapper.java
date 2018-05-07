package com.ian.media.dao;

import java.util.List;
import java.util.Map;

import com.ian.media.model.LogProjectTime;

public interface LogProjectTimeMapper extends BaseDao<LogProjectTime, String>{
	
	public List<LogProjectTime> projecttj(Map<Object, Object> map);
	
	public List<LogProjectTime> projectMembertj(Map<Object, Object> map);
	
	public int getNowCount(Map<Object,Object> map);
}