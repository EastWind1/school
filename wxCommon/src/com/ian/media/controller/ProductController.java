package com.ian.media.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ian.media.dao.ProductMapper;
import com.ian.media.model.Product;

@Controller("product")
@Scope("prototype")
@RequestMapping("product.action")
public class ProductController extends BaseController<Product> {
	@Autowired
	public ProductMapper dao;
    @PostConstruct
    public void setBaseDao(){
        super.setBaseDao(dao);
    }
    
    //新增
    @RequestMapping(params="insert")
    @ResponseBody
    public Map<Object, Object> insert(HttpServletRequest request,Product  model)
    {
    	Map<Object, Object> map=new HashMap<Object, Object>();
    	try {
    		dao.insertSelective(model);
    		map.put("msg", "新增成功");
    		
		} catch (Exception e) {
			map.put("msg", "新增失败");
		}
    	
    	return map;
    }
    
    
    

}
