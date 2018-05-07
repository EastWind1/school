package com.ian.media.controller;

import java.util.Enumeration;
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

import com.alibaba.fastjson.JSON;
import com.ian.media.dao.InformationMapper;
import com.ian.media.dao.WxPublicMapper;
import com.ian.media.dao.WxUsersMapper;
import com.ian.media.model.Information;
import com.ian.media.model.WxPublic;
import com.ian.media.model.WxUsers;
import com.ian.media.util.IDGenerator;
import com.ian.media.util.Time;
import com.ian.media.util.ToolUtil;
import com.ian.media.util.WxPublicUtil;


@Controller("information")
@Scope("prototype")
@RequestMapping("information.action")
public class InformationController extends BaseController<Information> {
	public InformationMapper informationDao;

	@Autowired
    public void setInformationDao(InformationMapper informationDao) {
        this.informationDao = informationDao;
    }

    @PostConstruct
    public void setBaseDao(){
        super.setBaseDao(informationDao);
    }
    
	
    // 查询方法
	@RequestMapping(params = "getById")
	@ResponseBody
	public Map<Object, Object> getById(HttpServletRequest request,Information info){
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("pkid", info.getPkid());
		try {
			List<Information> list = informationDao.getById(map);
			map.put("rows", list);
			map.put("success",true);
			map.put("msg","查询成功");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("success",false);
			map.put("msg","查询失败");
			return map;
		}
		return map;
	}
	@RequestMapping(params = "informationReadCount")
	@ResponseBody
	public Map<Object, Object> informationReadCount(HttpServletRequest request){
		Map<Object, Object> map = new HashMap<Object, Object>();	
		try {
			Map<Object, Object> queryMap = new HashMap<Object, Object>();
			String page = request.getParameter("page");
			String rows = request.getParameter("rows");
			// 如果没有page和rows则不传到SQL语句中
			if (page != null && rows != null) {
				queryMap.put("pageIndex",(Integer.parseInt(page)));
				queryMap.put("rows", (Integer.parseInt(rows)));
			}
			List<Information> list = informationDao.informationReadCount(queryMap);
			map.put("total", informationDao.informationReadCount(map).size());
			map.put("rows", list);
			map.put("success",true);
			map.put("page", page);
			map.put("msg","查询成功");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("success",false);
			map.put("msg","查询失败");
			return map;
		}
		return map;
	}

}
