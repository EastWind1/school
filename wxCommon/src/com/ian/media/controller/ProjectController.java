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

import com.ian.media.dao.ProjectMapper;
import com.ian.media.model.PowerUser;
import com.ian.media.model.Project;
import com.ian.media.util.IDGenerator;
import com.ian.media.util.Time;


@Controller("project")
@Scope("prototype")
@RequestMapping("project.action")
public class ProjectController extends BaseController<Project> {
	 public ProjectMapper projectDao;
	 
	@Autowired
    public void setProjectDao(ProjectMapper projectDao) {
        this.projectDao = projectDao;
    }
	
	@PostConstruct
	public void setBaseDao(){
		super.setBaseDao(projectDao);
	}
	
	
	@RequestMapping(params = "add")
	@ResponseBody
	public Map add(HttpSession session,HttpServletRequest request,Project params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		PowerUser u = (PowerUser) session.getAttribute("users");
		try {
			params.setId(IDGenerator.getID());
			params.setCreateTime(Time.nowDateToString());
			params.setCreateUser(u.getUserName());
			projectDao.insertSelective(params);
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
	public Map update(HttpSession session,HttpServletRequest request,Project params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			projectDao.updateByPrimaryKeySelective(params);
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
