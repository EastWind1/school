package weixin.dao;

import java.util.List;

import com.ian.media.dao.BaseDao;

import weixin.model.ServerService;

public interface ServerServiceMapper extends BaseDao<ServerService, String>{
	public void deleteMoreByService(List<String> oid);
	public void deleteByServiceId(Integer id);
}