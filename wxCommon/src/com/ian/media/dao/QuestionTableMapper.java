package com.ian.media.dao;

import java.util.List;
import java.util.Map;

import com.ian.media.model.QuestionTable;

public interface QuestionTableMapper extends BaseDao<QuestionTable,String>{
	public List<QuestionTable> sel(Map<Object, Object> map);
	
	public int getNumber();
	
	public void updateByPrimaryKeySelectiveBegin(QuestionTable params);
	
	public List<QuestionTable> getSel(Map<Object, Object> map);
	
	public int getCou(Map<Object, Object> map);
    
}