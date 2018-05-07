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

import com.ian.media.dao.QuestionTableMapper;
import com.ian.media.model.QuestionTable;
import com.ian.media.util.IDGenerator;
import com.ian.media.util.Time;

@Controller("questiontable")
@Scope("prototype")
@RequestMapping("questiontable.action")
public class QuestionTableController extends BaseController<QuestionTable>{
	public QuestionTableMapper questionTableDao;
	 
	@Autowired
    public void setQuestionTableDao(QuestionTableMapper questionTableDao) {
        this.questionTableDao = questionTableDao;
    }
	
	@PostConstruct
	public void setBaseDao(){
		super.setBaseDao(questionTableDao);
	}
	@RequestMapping(params = "sel")
	@ResponseBody
	public Map<Object, Object> sel(HttpServletRequest request){
		Map<Object, Object> queryMap = new HashMap<Object, Object>();
		Enumeration en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String paramName = (String) en.nextElement();
			String paramValue = request.getParameter(paramName);
	
			if (paramValue.equals("")) {

			} else {
				//形成键值对应的map
				queryMap.put(paramName, paramValue);
			}
		}
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
		// 如果没有page和rows则不传到SQL语句中
		if (page != null && rows != null) {
			queryMap.put("pageIndex",(Integer.parseInt(page)));
			queryMap.put("rows", (Integer.parseInt(rows)));
		}
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			List<QuestionTable> list = questionTableDao.sel(queryMap);
			System.out.println(list);
			map.put("rows", list);
			map.put("total", questionTableDao.getNumber());
			map.put("success",true);
			map.put("page", page);
			map.put("msg","查询成功");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
			map.put("success",false);
			map.put("msg","查询失败");
			return map;
		}
		return map;
	}
	@RequestMapping(params = "getSel")
	@ResponseBody
	public Map<Object, Object> getSel(HttpServletRequest request){
		Map<Object, Object> queryMap = new HashMap<Object, Object>();
		Enumeration en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String paramName = (String) en.nextElement();
			String paramValue = request.getParameter(paramName);
	
			if (paramValue.equals("")) {

			} else {
				//形成键值对应的map
				queryMap.put(paramName, paramValue);
			}
		}
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
		// 如果没有page和rows则不传到SQL语句中
		if (page != null && rows != null) {
			queryMap.put("pageIndex",(Integer.parseInt(page)));
			queryMap.put("rows", (Integer.parseInt(rows)));
		}
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			List<QuestionTable> list = questionTableDao.getSel(queryMap);
			System.out.println(list);
			map.put("rows", list);
			map.put("total", questionTableDao.getCou(queryMap));
			map.put("success",true);
			map.put("page", page);
			map.put("msg","查询成功");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
			map.put("success",false);
			map.put("msg","查询失败");
			return map;
		}
		return map;
	}
	@RequestMapping(params = "add")
	@ResponseBody
	public Map add(HttpSession session,HttpServletRequest request,QuestionTable params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			String pkid=IDGenerator.getID(); //随机产生一个id
			params.setId(pkid);
			params.setQuestionTime(Time.nowDateToString());//获取当前时间
			params.setFiled1(Time.nowDateToString());
			questionTableDao.insertSelective(params);
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
	public Map update(HttpSession session,HttpServletRequest request,QuestionTable params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			questionTableDao.updateByPrimaryKeySelective(params);
			map.put("msg", "修改成功");
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);	
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	@RequestMapping(params = "update1")
	@ResponseBody
	public Map update1(HttpSession session,HttpServletRequest request,QuestionTable params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			params.setFiled1(Time.nowDateToString());
			questionTableDao.updateByPrimaryKeySelective(params);
			map.put("msg", "修改成功");
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);	
			map.put("msg", "修改失败");
		}
		return map;
	}



@RequestMapping(params = "updateBegin")
@ResponseBody
public Map updateBegin(HttpSession session,HttpServletRequest request,QuestionTable params){
	Map<Object, Object> map = new HashMap<Object, Object>();
	try {
		System.out.println(params.getFiled5());
		questionTableDao.updateByPrimaryKeySelectiveBegin(params);
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