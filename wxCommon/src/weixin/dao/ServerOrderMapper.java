package weixin.dao;

import com.ian.media.dao.BaseDao;

import weixin.model.ServerOrder;

public interface ServerOrderMapper extends BaseDao<ServerOrder, String>{
	public void deleteByOid(Integer oid);
}