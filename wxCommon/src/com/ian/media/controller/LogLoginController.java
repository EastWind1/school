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

import com.ian.media.dao.LogLoginMapper;
import com.ian.media.model.LogLogin;

@Controller("logLogin")
@Scope("prototype")
@RequestMapping("logLogin.action")
public class LogLoginController extends BaseController<LogLogin> {
	 public LogLoginMapper logLoginDao; 

	@Autowired
    public void setLogLoginMapperDao(LogLoginMapper logLoginDao) {
        this.logLoginDao = logLoginDao;
    }
	
	@PostConstruct
	public void setBaseDao(){
		super.setBaseDao(logLoginDao);
	}
	
	@RequestMapping(params="listLogLogin")
    @ResponseBody
    public Map listLogLogin(LogLogin logLogin, HttpServletRequest request,HttpSession session){
        Map map = new HashMap();
        String datefrom=request.getParameter("datefrom");
        String dateto=request.getParameter("dateto");
        String page=request.getParameter("page");
        String rows=request.getParameter("rows");
    	try {
    		Map queryMap = new HashMap();
    		if(logLogin.getUserName()!=null && !logLogin.getUserName().equals("")){
    			queryMap.put("userName",logLogin.getUserName());
    		}
            queryMap.put("type",logLogin.getType());
            queryMap.put("dateto", dateto);
            queryMap.put("datefrom", datefrom);
            map.put("total", logLoginDao.getNumber(queryMap));
            queryMap.put("pageIndex",Integer.parseInt(page));
            queryMap.put("rows",Integer.parseInt(rows));
            List<LogLogin> list = logLoginDao.listLogLogin(queryMap);
            map.put("page", page);
            map.put("success", true);
            map.put("rows", list);
	        
		} catch (Exception e) {
			map.put("success", false);
			map.put("msg", "服务器异常");
			e.printStackTrace();
		}
        return map;
    }
	
	@RequestMapping(params="getApp")
    @ResponseBody
    public Map getApp(HttpServletRequest request,HttpSession session){
		Map<Object,Object> map=new HashMap<Object,Object>();
		try{
		List<LogLogin> list=logLoginDao.getApp();
		map.put("rows",list );
		map.put("total",logLoginDao.getAppNumber() );
		map.put("success", true);
		map.put("msg", "查询成功");
		}catch(Exception e){
			e.printStackTrace();
			map.put("success", false);
			map.put("msg", "查询失败");
		}
		return map;
		
	}

}
