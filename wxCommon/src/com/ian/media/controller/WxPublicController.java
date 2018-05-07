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

import com.ian.media.dao.WxPublicMapper;
import com.ian.media.model.WxPublic;
import com.ian.media.util.IDGenerator;
import com.ian.media.util.Time;
import com.ian.media.util.ToolUtil;
import com.ian.media.util.WxPublicUtil;

@Controller("wxPublic")
@Scope("prototype")
@RequestMapping("wxPublic.action")
public class WxPublicController extends BaseController<WxPublic> {
	 public WxPublicMapper wxPublicDao; 

	@Autowired
    public void setWxPublicMapperDao(WxPublicMapper wxPublicDao) {
        this.wxPublicDao = wxPublicDao;
    }
	
	@PostConstruct
	public void setBaseDao(){
		super.setBaseDao(wxPublicDao);
	}
	
	@RequestMapping(params = "listinfo")
	@ResponseBody
	public Map<Object, Object> listinfo(HttpServletRequest request){
		Map<Object, Object> queryMap = new HashMap<Object, Object>();
		queryMap.put("publicNo", "gh_8d5f9c073de7");
		List<WxPublic> list=wxPublicDao.get(queryMap);
		queryMap.put("rows", list);
		return queryMap;
	}
	
	

}
