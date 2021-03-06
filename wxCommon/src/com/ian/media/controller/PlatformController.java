package com.ian.media.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ian.media.dao.InformationMapper;
import com.ian.media.dao.PlatformMapper;
import com.ian.media.dao.SysNoticeMapper;
import com.ian.media.dao.WxPublicMapper;
import com.ian.media.dao.WxUsersMapper;
import com.ian.media.model.Information;
import com.ian.media.model.Platform;
import com.ian.media.model.PowerMenu;
import com.ian.media.model.PowerRoleMenu;
import com.ian.media.model.SysNotice;
import com.ian.media.model.WxPublic;
import com.ian.media.model.WxUsers;
import com.ian.media.util.IDGenerator;
import com.ian.media.util.Time;
import com.ian.media.util.ToolUtil;
import com.ian.media.util.WxPublicUtil;

@Controller("platform")
@Scope("prototype")
@RequestMapping("platform.action")
public class PlatformController extends BaseController<Platform> {
	public PlatformMapper platformDao;

	@Autowired
    public void setPlatformDao(PlatformMapper platformDao) {
        this.platformDao= platformDao;
    }
	
    @PostConstruct
    public void setBaseDao(){
        super.setBaseDao(platformDao);
       
    }


	 @RequestMapping(params = "add")
		@ResponseBody
		public Map add(HttpSession session,HttpServletRequest request,Platform params){
			Map<Object, Object> map = new HashMap<Object, Object>();
			try {
				String pkid=IDGenerator.getID();
				params.setId(pkid);
				params.setPlatformtime(Time.nowDateToString());
				platformDao.insertSelective(params);
				map.put("msg", "添加成功");
				map.put("success", true);
			} catch (Exception e) {
				e.printStackTrace();
				map.put("success", false);	
				map.put("msg", "添加失败");
			}
			return map;
		}
	
	@RequestMapping(params = "update")
		@ResponseBody
		public Map update(HttpSession session,HttpServletRequest request,Platform params){
			Map<Object, Object> map = new HashMap<Object, Object>();
			System.out.print(11);
			try {
			platformDao.updateByPrimaryKeySelective(params);
			map.put("msg", "修改成功");
			map.put("success", true);
		} catch (Exception e) {
				e.printStackTrace();
			map.put("success", false);	
			map.put("msg", "修改失败");
		}
			return map;
		}


}
