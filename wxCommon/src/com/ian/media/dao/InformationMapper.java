package com.ian.media.dao;

import com.ian.media.model.Information;

import java.util.List;
import java.util.Map;

public interface InformationMapper  extends BaseDao<Information,String>{
    public List notReadInformation(Map map);
    public List getCountByInformationId(Map map);
    public List getTimesCountByInformationId(Map map);
    
    public List msgclickLogCount(Map map);
    
    public List<Information> getById(Map<Object, Object> map);
    
    public List<Information> informationReadCount(Map<Object, Object> map);
}