package com.ian.media.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.ian.media.dao.WxPublicMapper;
import com.ian.media.dao.WxUsersMapper;
import com.ian.media.model.LogLogin;
import com.ian.media.model.WxPublic;
import com.ian.media.model.WxUsers;
import com.ian.media.util.IDGenerator;
import com.ian.media.util.Time;
import com.ian.media.util.ToolUtil;
import com.ian.media.util.WxInterface;
import com.ian.media.util.WxPublicMethodUtil;
import com.ian.media.util.WxPublicUtil;

import org.springframework.web.servlet.ModelAndView;
@Controller("wxUsers")
@Scope("prototype")
@RequestMapping("wxUsers.action")
public class WxUsersController extends BaseController<WxUsers> {
	public WxUsersMapper wxUserDao;
	public WxPublicMapper wxPublicDao; 

	@Autowired
    public void setWxUserMapperDao(WxUsersMapper wxUserDao) {
        this.wxUserDao = wxUserDao;
    }
	@Autowired
    public void setWxPublicMapperDao(WxPublicMapper wxPublicDao) {
        this.wxPublicDao = wxPublicDao;
    }

    @PostConstruct
    public void setBaseDao(){
        super.setBaseDao(wxUserDao);
    }
	
    @RequestMapping(params = "tjqgwxUsers")
	@ResponseBody
	public Map<Object, Object> tjqgwxUsers(HttpServletRequest request){
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
			List<WxUsers> list=wxUserDao.tjqgwxUsers(queryMap);
			
			map.put("rows", list);
			map.put("success",true);
			map.put("total", wxUserDao.tjqgwxUsers(map).size());
			map.put("page", page);
			map.put("msg", "查询成功");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("success",false);
			map.put("msg", "查询失败");
		}
		return map;
	}
    
    @RequestMapping(params = "tjgzwxUsers")
	@ResponseBody
	public Map<Object, Object> tjgzwxUsers(HttpServletRequest request){
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
			List<WxUsers> list=wxUserDao.tjgzwxUsers(queryMap);
			map.put("rows", list);
			map.put("success",true);
			map.put("total", wxUserDao.tjgzwxUsers(map).size());
			map.put("page", page);
			map.put("msg", "查询成功");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("success",false);
			map.put("msg", "查询失败");
		}
		return map;
	}
    
	@RequestMapping(params = "expertOrder")
	public  ModelAndView expertOrder(HttpSession session,HttpServletRequest request) {
		try{
		   Map qureyMap = new HashMap();
		  JSONObject object=(JSONObject) session.getAttribute("userInfo");
		  String customerId= object.getString("openid");
		  qureyMap.put("openId", customerId);
		  List<WxUsers> list=wxUserDao.get(qureyMap);
		  if(list.size()>0){
			  if(list.get(0).getFiled1().equals("1")){
				  return new ModelAndView("weixin/hy/checkExpert");
			  }else{
				  return new ModelAndView("weixin/zj/memberOrder");
			  }
		  }else{
       	   	return null;
          }
		}catch(Exception e){
			e.printStackTrace();
			  return null;
		}
	}
	
	
	 /**
     * ryze摇一摇临时
     */
    @RequestMapping(params = "customerGame")
    public String customerGame(HttpServletRequest request,String customerId) {
    	WxUsers customer=new WxUsers();
    	customer=this.getCustomerById(customerId);
    	if(!customer.equals(null)){
//    		customer.setGroupId(customer.getg);
    		Integer file=Integer.parseInt(customer.getFiled2())+1;
    		customer.setFiled2(file+"");
    		wxUserDao.updateByPrimaryKeySelective(customer);
    	}
    	return null;
    }
    /**
     * 获取摇一摇前十名
     */
    @RequestMapping(params = "getTopTens")
    @ResponseBody
    public 	Map <Object,Object> getTopTens(String brandId){
    	List<WxUsers>list =new ArrayList();
    	list=this.getGameCustomer(brandId);
    	Map <Object,Object> map=new HashMap<Object, Object>();
    	map.put("rows", list);
    	return map;
    } 

    /**
     * 摇一摇重置
     */
    @RequestMapping(params = "updateCustomerGame")
    public String updateCustomerGame(HttpServletRequest request,String customerId) {
    	WxUsers customer=new WxUsers();
    	customer=this.getCustomerById(customerId);
    	if(!customer.equals(null)){
    		customer.setFiled2("0");
    		wxUserDao.updateByPrimaryKeySelective(customer);
    	}
    	return "admin/customer/customerFull";
    }
    
    @RequestMapping(params = "updateGame")
    @ResponseBody
	public int updateGame(HttpServletRequest request,WxUsers customer,String brandId) {
		Map map = new HashMap();
		try {
			customer.setFiled2("0");
			wxUserDao.updateByPrimaryKeySelectiveBrand(customer);
			
		} catch (Exception e) {  
			// TODO: handle exception
			return 0;
			
		}	
		return 1;
	}
    
	
 // 增加方法
    @RequestMapping(params = "getGameCustomer")
    @ResponseBody
    public List getGameCustomer(String brandId){
        Map map = new HashMap();
        map.put("publicNo",brandId);
        List list = null;
        try {
            list = wxUserDao.getGameCustomer(map);
        }catch (Exception e){
            e.printStackTrace();
            return list;
        }
        return list;
    }
    
    /**
     * 根据customerid获取数据
     * @param customerId
     * @return
     */
    @RequestMapping(params = "getCustomerById")
    public WxUsers getCustomerById(String customerId){
        Map map = new HashMap();
        map.put("openId",customerId);
        List<WxUsers> list = null;
        try {
            list = wxUserDao.get(map);
        }catch (Exception e) {
            e.printStackTrace();
        }
        if (list.size()>0){
            return list.get(0);
        }else{
            return null;
        }
    }
    @RequestMapping(params="listWxUsers")
    @ResponseBody
    public Map listWxUsers(HttpServletRequest request,HttpSession session){
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
//		String datefrom=request.getParameter("datefrom");
//		String dateto=request.getParameter("dateto");
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
		// 如果没有page和rows则不传到SQL语句中
		if (page != null && rows != null) {
			queryMap.put("pageIndex",(Integer.parseInt(page)));
			queryMap.put("rows", (Integer.parseInt(rows)));
		}
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			System.out.println(queryMap);
			List<WxUsers> list = wxUserDao.listWxUsers(queryMap);
			map.put("rows", list);
			map.put("total", wxUserDao.getNumber(queryMap));
			map.put("success",true);
			map.put("page", page);
			map.put("msg","查询成功");
 //       Map map = new HashMap();
//		
//        String datefrom=request.getParameter("datefrom");
//        String dateto=request.getParameter("dateto");
//        String page=request.getParameter("page");
//        String rows=request.getParameter("rows");
//        String subscribe=request.getParameter("subscribe");
//    	try {
//    		Map<Object,Object> queryMap = new HashMap<Object,Object>();
//    		
//            queryMap.put("subscribe", subscribe);
//            queryMap.put("dateto", dateto);
//            queryMap.put("datefrom", datefrom);
//            map.put("total", wxUserDao.getCount(queryMap));
//            queryMap.put("pageIndex",(Integer.parseInt(page)));
//            queryMap.put("rows",(Integer.parseInt(rows)));
//            List<WxUsers> list = wxUserDao.listWxUsers(queryMap);
//            map.put("page", page);
//            map.put("success", true);
//            map.put("rows", list);
//	        
		} catch (Exception e) {
			map.put("success", false);
			map.put("msg", "服务器异常");
			e.printStackTrace();
		}
        return map;
    }
    
    /**
     * 同步微信所有用户
     */
    @RequestMapping(params = "getListCustomer")
    @ResponseBody
    public Map<Object, Object> getListCustomer(HttpServletRequest request) {
        String publicNo = request.getParameter("brandId");
        String NEXT_OPENID = request.getParameter("NEXT_OPENID");
        System.out.println(publicNo+"---------------------");
    	Map<Object, Object> map = new HashMap<Object, Object>();
    	
//    	String token=getAccessToken(brandId);
//    	String url = WeixinUtil.list_customer_url.replace("ACCESS_TOKEN", token);
//    	JSONObject jsonObject = WeixinUtil.httpRequest(url, "GET", "");
    	//获取关注者列表o7FDrs-4-jsRsTj9lXZe9hpnptDE
    	//String url = WxInterface.list_customer_url.replace("NEXT_OPENID", NEXT_OPENID);
    	String url=WxInterface.list_customer_url;
		WxPublicMethodUtil.setWxPublicDao(wxPublicDao);
		JSONObject jsonObject=WxPublicMethodUtil.httpRequest(url,"GET","",publicNo);
    	JSONObject jsonObjectOpen = (JSONObject) JSONObject.parse(jsonObject.getString("data"));
    	//System.out.println(jsonObject.getString("next_openid")+"------------------------");
    	String oplist=jsonObjectOpen.getString("openid").substring(1, jsonObjectOpen.getString("openid").length()-1);
    	
    	String[] openidArray=oplist.split(",");
    	for(int i=0;i<openidArray.length;i++){
    		System.out.println(openidArray[i].replace("\"",""));
    		WxUsers customer1=this.getCustomerById(openidArray[i].replace("\"",""));
    		if(customer1==null || customer1.equals("null")){
    			//根据OPENID获取用户基本信息
    			String getUserUrl="https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid="+openidArray[i].replace("\"","")+"&lang=zh_CN";
    			JSONObject customerInfo=WxPublicMethodUtil.httpRequest(getUserUrl,"GET","",publicNo);
        		System.out.println(customerInfo);
        		WxUsers wxUser = new WxUsers();
        		
        		System.out.println(customerInfo.getString("nickname"));
        		String name=customerInfo.getString("nickname");
        		if(name != null){
        			try {
        				String customerName=new String(name.getBytes(), "GB2312");
        				//String customerName2 = new String(customerName.getBytes(),"UTF-8");
        				wxUser.setNickName(customerName);
        			} catch (UnsupportedEncodingException e) {
        				// TODO Auto-generated catch block
        				e.printStackTrace();
        			}
        		}
        		
        		wxUser.setPublicNo(publicNo);
        		wxUser.setOpenId(openidArray[i].replace("\"",""));
				wxUser.setSubscribe(customerInfo.getString("subscribe"));
				wxUser.setCity(customerInfo.getString("city"));
				wxUser.setProvince(customerInfo.getString("province"));
				wxUser.setCountry(customerInfo.getString("country"));
				wxUser.setUnionid(customerInfo.getString("unionid"));
				wxUser.setLanguage(customerInfo.getString("language"));
				wxUser.setSex( customerInfo.getString("sex"));
				wxUser.setCity(customerInfo.getString("city"));
				wxUser.setHeadImgurl(customerInfo.getString("headimgurl"));
				wxUser.setSubscribeTime(Time.long2Date(customerInfo.getInteger("subscribe_time") * 1000l));
				wxUserDao.insertSelective(wxUser);
    		}
    	}
        return map;
    }
    
    


}
