package weixin.dao;

import java.util.List;
import java.util.Map;

import com.ian.media.dao.BaseDao;

import weixin.model.Service;

public interface ServiceMapper extends BaseDao<Service, String>{
    Service selectByPrimaryKey(Integer id);
	public List<Service> getMy(Map<Object, Object> map);
	public int getMyCount(Map<Object,Object> map);
}