package weixin.dao;

import java.util.List;

import com.ian.media.dao.BaseDao;

import weixin.model.UserOrder;

public interface UserOrderMapper extends BaseDao<UserOrder, String>{
	public void deleteMoreByOrder(List<String> oid);
	public void deleteByOrderId(Integer id);
	
}