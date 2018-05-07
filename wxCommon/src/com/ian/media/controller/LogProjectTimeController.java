package com.ian.media.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ian.media.dao.LogProjectTimeMapper;
import com.ian.media.model.LogProjectTime;


@Controller("time")
@Scope("prototype")
@RequestMapping("time.action")
public class LogProjectTimeController extends BaseController<LogProjectTime> {
	 public LogProjectTimeMapper logProjectTimeDao;
	 
	@Autowired
    public void setLogProjectTimeDao(LogProjectTimeMapper logProjectTimeDao) {
        this.logProjectTimeDao = logProjectTimeDao;
    }
	
	@PostConstruct
	public void setBaseDao(){
		super.setBaseDao(logProjectTimeDao);
	}
	
	
	@RequestMapping(params = "add")
	@ResponseBody
	public Map add(HttpSession session,HttpServletRequest request,LogProjectTime logProject,String params){
			Map<Object, Object> map = new HashMap<Object, Object>();
	        try {
	        	Map<Object, Object> maps = new HashMap<Object, Object>();
	        	maps.put("name",logProject.getName());
	        	int count=logProjectTimeDao.getNowCount(maps);
	        	if(count>0){
	        		map.put("msg", "亲~ 您老今天已经写过了！不信你问Ashe");
	                map.put("success", true);
	        	}else{
	        		JSONArray jsonArray = JSONArray.fromObject(params);
		    		List<Map<String,Object>> mapListJson =(List)jsonArray;
		            if(mapListJson.size() > 0 ){
		            	dao.insertMore(mapListJson);
		            	map.put("msg", "恭喜你，任务填写完成，可以回家吃饭了。。。");
		                map.put("success", true);
		            }else{
		            	 map.put("msg", "bug了，快点找Ashe");
		                 map.put("success", false);
		            }
	        	}
	            return map;
	        } catch (Exception e) {
	            e.printStackTrace();
	            map.put("msg", "bug了，快点找Ashe");
	            map.put("success", false);
	            return map;
	            
	        }
	}
	
	@RequestMapping(params = "update")
	@ResponseBody
	public Map update(HttpSession session,HttpServletRequest request,LogProjectTime params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			logProjectTimeDao.updateByPrimaryKeySelective(params);
			map.put("msg", "修改成功");
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);	
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	@RequestMapping(params = "projecttj")
	@ResponseBody
	public Map projecttj(HttpSession session,HttpServletRequest request,LogProjectTime params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			List<LogProjectTime> list=logProjectTimeDao.projecttj(map);
			map.put("success", true);
			map.put("rows", list);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);	
		}
		return map;
	}
	
	@RequestMapping(params = "projectMembertj")
	@ResponseBody
	public Map projectMembertj(HttpSession session,HttpServletRequest request,LogProjectTime params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			map.put("pid", params.getPid());
			List<LogProjectTime> list=logProjectTimeDao.projectMembertj(map);
			map.put("success", true);
			map.put("rows", list);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);	
		}
		return map;
	}
	
	
	
}
