package weixin.dao;

import com.ian.media.dao.BaseDao;

import weixin.model.User;

public interface UserMapper extends BaseDao<User, String>{
	User selectByPrimaryKey(String id);
}