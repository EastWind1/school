package com.ian.media.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ian.media.dao.LogProjectNtimeMapper;
import com.ian.media.model.LogProjectNtime;
import com.ian.media.model.PowerUser;
import com.ian.media.util.IDGenerator;
import com.ian.media.util.Time;


@Controller("ntime")
@Scope("prototype")
@RequestMapping("ntime.action")
public class LogProjectNtimeController extends BaseController<LogProjectNtime> {
	 public LogProjectNtimeMapper logProjectNtimeDao;
	 
	@Autowired
    public void setLogProjectNtimeDao(LogProjectNtimeMapper logProjectNtimeDao) {
        this.logProjectNtimeDao = logProjectNtimeDao;
    }
	
	@PostConstruct
	public void setBaseDao(){
		super.setBaseDao(logProjectNtimeDao);
	}
	
	
	@RequestMapping(params = "add")
	@ResponseBody
	public Map add(HttpSession session,HttpServletRequest request,LogProjectNtime params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		PowerUser u = (PowerUser) session.getAttribute("users");
		try {
			params.setId(IDGenerator.getID());
			params.setCreateTime(Time.nowDateToString());
			params.setName(u.getUserName());
			logProjectNtimeDao.insertSelective(params);
			map.put("msg", "添加 成功");
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
	public Map update(HttpSession session,HttpServletRequest request,LogProjectNtime params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			logProjectNtimeDao.updateByPrimaryKeySelective(params);
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
