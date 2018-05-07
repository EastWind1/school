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

import com.ian.media.dao.LogPushMsgMapper;
import com.ian.media.model.LogPushMsg;
import com.ian.media.util.IDGenerator;
import com.ian.media.util.Time;
@Controller("logpushmsg")
@Scope("prototype")
@RequestMapping("logpushmsg.action")
public class LogPushMsgController extends BaseController<LogPushMsg>{
	public LogPushMsgMapper logPushMsgDao;

	@Autowired
    public void setLogPushMsgDao(LogPushMsgMapper logPushMsgDao) {
        this.logPushMsgDao = logPushMsgDao;
    }

    @PostConstruct
    public void setBaseDao(){
        super.setBaseDao(logPushMsgDao);
    }
    
    
    @RequestMapping(params = "add")
	@ResponseBody
	public Map add(HttpSession session,HttpServletRequest request,LogPushMsg params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			String pkid=IDGenerator.getID(); //随机产生一个id
			params.setId(pkid);
			params.setPushTime(Time.nowDateToString());//获取当前时间
			logPushMsgDao.insertSelective(params);
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
	public Map update(HttpSession session,HttpServletRequest request,LogPushMsg params){
    	Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			logPushMsgDao.updateByPrimaryKeySelective(params);
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
