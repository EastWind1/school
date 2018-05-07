package com.ian.media.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import com.ian.media.dao.LogLoginMapper;
import com.ian.media.dao.MemberMapper;
import com.ian.media.dao.QRCodeInfoMapper;
import com.ian.media.dao.WxPublicMapper;
import com.ian.media.model.LogLogin;
import com.ian.media.model.Member;
import com.ian.media.model.MemberRole;
import com.ian.media.model.QRCodeInfo;
import com.ian.media.util.IDGenerator;
import com.ian.media.util.IvrUtil;
import com.ian.media.util.MD5;
import com.ian.media.util.Time;
import com.ian.media.util.ToolUtil;
import com.ian.media.util.WxInterface;
import com.ian.media.util.WxPublicMethodUtil;

@Controller("member")
@Scope("prototype")
@RequestMapping("member.action")
public class MemberController extends BaseController<Member> {
	public MemberMapper memberDao;
	 public LogLoginMapper logLoginDao; 
	 public QRCodeInfoMapper qrCodeInfoDao;
	public WxPublicMapper wxPublicDao; 
	

	@Autowired
    public void setWxPublicMapperDao(WxPublicMapper wxPublicDao) {
        this.wxPublicDao = wxPublicDao;
    }

    @Autowired
    public void setQrCodeInfoDao(QRCodeInfoMapper qrCodeInfoDao) {
        this.qrCodeInfoDao = qrCodeInfoDao;
    }

	@Autowired
    public void setMemberOrderDao(MemberMapper memberDao) {
        this.memberDao = memberDao;
    }
	@Autowired
    public void setLogLoginMapperDao(LogLoginMapper logLoginDao) {
        this.logLoginDao = logLoginDao;
    }

    @PostConstruct
    public void setBaseDao(){
        super.setBaseDao(memberDao);
    }
    @RequestMapping(params = "hospitalCount")
    @ResponseBody
	public Map hospitalCount(HttpSession session,HttpServletRequest request) {
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
			List<Member> list=new ArrayList<Member>();
			list=memberDao.hospitalCount(queryMap);
			map.put("msg", "查询成功");
			map.put("success", true);
			map.put("rows", list);
			map.put("total",memberDao.hospitalCount(map).size() );
			map.put("page", page);
		} catch (Exception e) {  
			e.printStackTrace();
			map.put("success", false);	
			map.put("msg", "查询失败");
		}
		return map;
	}
    
    
  //发送验证码
    @RequestMapping(params = "sendCode")
	@ResponseBody
    public Map<Object,Object> sendCode(String tel){
    	Map<Object, Object> map = new HashMap<Object, Object>();
		//随机一个4位数
		String code=ToolUtil.getRandom();
    	map=IvrUtil.sendMsg(tel,code);
    	if(map.get("success").equals(true)){
    		map.put("success", true);
    		map.put("code", code);
//    		try {
//    			Member member=new Member();
//    			member.set
//    			member.setFiled5(code);
//    			memberDao.updateByCustomerId(member);
//    	    	map.put("success", true);
//    		} catch (Exception e) {
//    			e.printStackTrace();
//    			map.put("success", false);
//    			return map;
//    		}
    	}else{
    		map.put("success", false);
    	}
    	return map;
    }
    
    @RequestMapping(params = "registerDetail")
	public  ModelAndView registerDetail(HttpSession session,HttpServletRequest request) {
		try{
		   Map qureyMap = new HashMap();
		  JSONObject object=(JSONObject) session.getAttribute("userInfo");
		  String customerId= object.getString("openid");
		  qureyMap.put("openId", customerId);
		  List<Member> list=memberDao.get(qureyMap);
		  if(list.size()>0){
			  return new ModelAndView("weixin/hy/registerDetail");
		  }else{
			  return new ModelAndView("weixin/hy/register");
          }
		}catch(Exception e){
			e.printStackTrace();
			  return null;
		}
	}
    
    
    /**
	 * 登录
	 * @param user
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(params="login")
    @ResponseBody
    public Map login(Member member, HttpServletRequest request,HttpSession session,String deviceType){
        Map map = new HashMap();
        Map map1 = new HashMap();
        String loginName = member.getEmail();
        String passWord = member.getFiled1();
    	try {
        	if (loginName.equals("") || loginName.equals(null) || passWord.equals("") || passWord.equals(null)){
    	        map1.put("success", false);
    	        return map1;
    	       }
        		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(17[^4,\\D])|(18[0-9]))\\d{8}$");
        		Matcher m = p.matcher(loginName);
        		Pattern p1 = Pattern.compile("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\\.([a-zA-Z0-9_-])+)+$");
        		Matcher m1 = p1.matcher(loginName);
        		if(m.matches()){//判断是否是手机号
        			map.put("tel", loginName);
        		}
        		if(m1.matches()){//判断是否是邮箱
    	        	map.put("email", loginName);
        		}
        		if(!m.matches() && !m1.matches()){//既不是手机号也不是邮箱
        			map1.put("success", false);
         	        return map1;
        		}
        		if(member.getType()==5){
        			map.put("type",5);
        		}
	        	map.put("filed1", MD5.pass(passWord));
	        	List<Member> list=memberDao.get(map);
	        	 if (list.size() <= 0){
	        		 map1.put("success", false);
		            }else {
		            	if(member.getType() == 4){//app登录
		            		this.addlogApp(list.get(0),member.getType(),deviceType);
		            		Map map2 = new HashMap();
		            		map2.put("filed2", member.getFiled2());
		            		List<Member> list2=memberDao.get(map2);
		            		if(list2.size()==0){
		            			//UtilController.registerDevice(member.getFiled2(),deviceType);
		            			String deviceCode=member.getFiled2();
		            			String requestUrl="http://139.129.17.76:8485/ianpush/resources/register/regDevice";
		            			String appId="";//个推生成的应用id
		            			if(deviceType.equals("1")){//ios
		            				appId="ZTpgVuKmFR8hQBRh6BneF8";
		            			}else{
		            				appId="OyqTQ5dSMG8pDFRX5AZ3Q5";
		            			}
		            			
		            			String deType=deviceType;//设备类型1是ios 2 是android
		            			String osName="";
		            			String phoneNum="";
		            			String jsonMsg="{\"appId\": \""+appId+"\",\"deviceCode\": \""+deviceCode+"\",\"deviceType\": \""+deType+"\",\"osName\": \"\",\"phoneNum\":\"\"}";
		            			//JSONObject jsonObject = WxPublicMethodUtil.httpRequest(requestUrl, "POST",jsonMsg,"123");
		            			UtilController.post(requestUrl, jsonMsg);
		            		}
		            		Member mem=new Member();
		            		mem.setId(list.get(0).getId());
		            		mem.setFiled2(member.getFiled2());
		            		memberDao.updateByPrimaryKeySelective(mem);
		            	}else{
		            		this.addlog(list.get(0),member.getType());
		            	}
		            	map1.put("success", true);
		            	map1.put("memberId", list.get(0).getId());
		            	map1.put("openId", list.get(0).getOpenId());
		            	map1.put("type", list.get(0).getType());
		            	map1.put("memberName", list.get(0).getName()+"【"+list.get(0).getHospitalName()+"】");
		            	
		            	//临时给小推车添加的会议id等返回值
		            	if(list.get(0).getFiled4() != null){
		            		if(list.get(0).getFiled4().equals("5")){
			            		map1.put("meetingCode",list.get(0).getFiled2());
			            		map1.put("beginTime",list.get(0).getFiled3());
			            		map1.put("endTime",list.get(0).getFiled5());

			            	}
		            	}
		            	
		                session.setAttribute("member",list.get(0));
		            }
	        
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
        return map1;
    }
    
	public void addlog(Member user,int type){
		LogLogin paramT=new LogLogin();
        paramT.setId(IDGenerator.getID());
        paramT.setLoginName(user.getEmail());
        paramT.setLoginTimer(Time.nowDateToString());
        paramT.setType(type);
        paramT.setUserId(user.getId());
        paramT.setUserName(user.getName());
        logLoginDao.insertSelective(paramT);
	}
	
	
	/**
	 * APP登录接口
	 * @param member
	 * @param request
	 * @param session
	 * @param deviceType
	 * @return
	 */
	@RequestMapping(params="appLogin")
    @ResponseBody
    public Map appLogin(Member member, HttpServletRequest request,HttpSession session,String deviceType){
        Map map = new HashMap();
        Map map1 = new HashMap();
        String loginName = member.getEmail();
        String passWord = member.getFiled1();
    	try {
        	if (loginName.equals("") || loginName.equals(null) || passWord.equals("") || passWord.equals(null)){
    	        map1.put("success", false);
    	        return map1;
    	       }
        		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(17[^4,\\D])|(18[0-9]))\\d{8}$");
        		Matcher m = p.matcher(loginName);
        		Pattern p1 = Pattern.compile("^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$");
        		Matcher m1 = p1.matcher(loginName);
        		if(m.matches()){//判断是否是手机号
        			map.put("tel", loginName);
        		}
        		if(m1.matches()){//判断是否是邮箱
    	        	map.put("email", loginName);
        		}
        		if(!m.matches() && !m1.matches()){//既不是手机号也不是邮箱
        			map1.put("success", false);
         	        return map1;
        		}
	        	map.put("filed1", MD5.pass(passWord));
	        	List<Member> list=memberDao.get(map);
	        	 if (list.size() <= 0){
	        		 map1.put("success", false);
		            }else {
		            	this.addlogApp(list.get(0),member.getType(),deviceType);
	            		Map map2 = new HashMap();
	            		map2.put("filed2", member.getFiled2());
	            		List<Member> list2=memberDao.get(map2);
	            		if(list2.size()==0){//判断设备ID是否已经注册  filed2:设备ID
	            			String deviceCode=member.getFiled2();
	            			String requestUrl="http://139.129.17.76:8485/ianpush/resources/register/regDevice";
	            			String appId="";//个推生成的应用id
	            			if(deviceType.equals("1")){//ios
	            				appId="ZTpgVuKmFR8hQBRh6BneF8";
	            			}else{
	            				appId="OyqTQ5dSMG8pDFRX5AZ3Q5";
	            			}
	            			
	            			String deType=deviceType;//设备类型1是ios 2 是android
	            			String osName="";
	            			String phoneNum="";
	            			String jsonMsg="{\"appId\": \""+appId+"\",\"deviceCode\": \""+deviceCode+"\",\"deviceType\": \""+deType+"\",\"osName\": \"\",\"phoneNum\":\"\"}";
	            			UtilController.post(requestUrl, jsonMsg);
	            		}
	            		//设备ID等于空 或 更换设备时
	            		if(list.get(0).getFiled2() == null || !list.get(0).getFiled2().equals(member.getFiled2())){
	            			Member mem=new Member();
		            		mem.setId(list.get(0).getId());
		            		mem.setFiled2(member.getFiled2());
		            		memberDao.updateByPrimaryKeySelective(mem);
	            		}
	            		Map map3 = new HashMap();
	            		map3.put("memberId", list.get(0).getId());
//	            		List<MemberRole> mebRole=memberRoleDao.get(map3);
	            		String type="";
//	            		if(mebRole.size()>0){
//	            			for(int i=0;i<mebRole.size();i++){
//		            			type+=mebRole.get(i).getType()+",";
//		            		}
//		            		type=type.substring(0,type.length()-1);
//	            		}
	            		
		            	map1.put("success", true);
		            	map1.put("memberId", list.get(0).getId());
		            	map1.put("openId", list.get(0).getOpenId());
		            	map1.put("type", type);
		            	map1.put("memberName", list.get(0).getName()+"【"+list.get(0).getHospitalName()+"】");
		            }
	        
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
        return map1;
    }
	
	
	
	/**
	 * APP登录日志
	 * @param user
	 * @param type
	 * @param deviceType
	 */
	public void addlogApp(Member user,int type,String deviceType){
		LogLogin paramT=new LogLogin();
        paramT.setId(IDGenerator.getID());
        paramT.setLoginName(user.getEmail());
        paramT.setLoginTimer(Time.nowDateToString());
        paramT.setType(type);
        paramT.setUserId(user.getId());
        paramT.setColumn01(deviceType);
        paramT.setUserName(user.getName());
        logLoginDao.insertSelective(paramT);
	}
	
	
	
	
	
	
	/**
	 * 退出
	 */
	@RequestMapping(params="logOut")
    @ResponseBody
    public Map logOut(HttpSession session){
		Map map = new HashMap();
        try {
            session.setAttribute("member",new Member());
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        return map;
    }
	/**
	 * 修改专家密码
	 */
	@RequestMapping(params="updatezjPwd")
    @ResponseBody
    public Map updatezjPwd(HttpServletRequest request,Member params){
		Map map = new HashMap();
        try {
        		Member member=new Member();
        		member.setId(params.getId());
        		member.setFiled1(MD5.pass(params.getFiled1()));
        		memberDao.updateByPrimaryKeySelective(member);
        
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        return map;
    }
	
	
	/**
	 * 修改密码
	 */
	@RequestMapping(params="updatePwd")
    @ResponseBody
    public Map updatePwd(HttpServletRequest request,String memberId,String oldpwd,String newpwd){
		Map map = new HashMap();
        try {
        	map.put("id", memberId);
        	map.put("filed1", MD5.pass(oldpwd));
        	List<Member> list=memberDao.get(map);
        	if(list.size() == 0){
        		map.put("result", 0);
        	}else{
        		map.put("result", 1);
        		Member member=new Member();
        		member.setId(memberId);
        		member.setFiled1(MD5.pass(newpwd));
        		memberDao.updateByPrimaryKeySelective(member);
        	}
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        return map;
    }
    
    @RequestMapping(params = "add")
	@ResponseBody
	public Map add(HttpSession session,HttpServletRequest request,Member params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			Map<Object, Object> map1 = new HashMap<Object, Object>();
			map1.put("tel", params.getTel());
			List<Member> list=memberDao.get(map1);
			if(list.size()>0){
				map.put("msg", "该手机已经被注册了！");
				map.put("success", false);
			}else{
				String pkid=IDGenerator.getID();
				params.setId(pkid);
				params.setCreateTime(Time.nowDateToString());
				params.setFiled1( MD5.pass(params.getFiled1()));
				memberDao.insertSelective(params);
				
				if(params.getOpenId() == null || params.getOpenId().equals("")){//网站注册
					session.setAttribute("member",params);
					QRCodeInfo paramT=new QRCodeInfo();
					paramT.setType(2);
					paramT.setField1(params.getPublicNo());
					paramT.setSceneId(pkid+"_hy");
					WxPublicMethodUtil.setWxPublicDao(wxPublicDao);
					WxPublicMethodUtil.setQrCodeInfoDao(qrCodeInfoDao);
					Map<Object, Object> map2=WxPublicMethodUtil.addFromWXWithSceneId(paramT);
					map.put("ticket", map2.get("ticket"));
				}else{//微信注册
					String jsonMsg="{\"touser\": \""+params.getOpenId()+"\",\"totag\": \"1\",\"msgtype\": \"text\",\"agentid\": \"1\",\"text\": {\"content\": \"恭喜您，注册成功！\"},\"safe\":\"0\"}";
					String url=WxInterface.kf_send_msg;
					WxPublicMethodUtil.setWxPublicDao(wxPublicDao);
					JSONObject jsonObject=WxPublicMethodUtil.httpRequest(url,"GET",jsonMsg,"gh_8d5f9c073de7");
//					Map<Object, Object> map2 = new HashMap<Object, Object>();
//					map2.put("publicNo", "gh_8d5f9c073de7");
//					List<WxPublic> list2=wxPublicDao.get(map2);
//					String accessToken = list2.get(0).getAccessToken();
//					String requestUrl=WxInterface.kf_send_msg.replace("ACCESS_TOKEN", accessToken);
					// 需要提交的json数据
//					String jsonMsg="{\"touser\": \""+params.getOpenId()+"\",\"totag\": \"1\",\"msgtype\": \"text\",\"agentid\": \"1\",\"text\": {\"content\": \"恭喜你，注册成功\"},\"safe\":\"0\"}";
//					JSONObject jsonObject = WxPublicMethodUtil.httpRequest(requestUrl, "POST",jsonMsg,"123");
					
				}
				session.setAttribute("memberId",pkid);
				session.setAttribute("memberName",params.getName());
				session.setAttribute("type",params.getType());
//				map.put("msg", "注册成功");
				map.put("success", true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);	
			map.put("msg", "注册失败");
		}
		return map;
	}
    
    
    @RequestMapping(params = "addExpert")
	@ResponseBody
	public Map addExpert(HttpSession session,HttpServletRequest request,Member params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			Map<Object, Object> map1 = new HashMap<Object, Object>();
			Map<Object, Object> map2 = new HashMap<Object, Object>();
			map1.put("tel", params.getTel());
			List<Member> list=memberDao.get(map1);
			if(list.size()>0){
				map.put("msg", "该手机已经被注册了！");
				map.put("success", false);
			}else if(!(params.getEmail().equals(""))){
				map2.put("email", params.getEmail());
				List<Member> list1=memberDao.get(map2);
				if(list1.size()>0){
					map.put("msg", "该邮箱已经被注册了！");
					map.put("success", false);
				}else{
					String pkid=IDGenerator.getID();
				if(params.getType()==1){
					this.addMemberRole(pkid,params.getName(),params.getType());
				}
				
				params.setId(pkid);
				params.setCreateTime(Time.nowDateToString());
				params.setFiled1( MD5.pass(params.getFiled1()));
				memberDao.insertSelective(params);
				
				map.put("success", true);
				}
			}else{
				String pkid=IDGenerator.getID();
				if(params.getType()==1){
					this.addMemberRole(pkid,params.getName(),params.getType());
				}
			
			params.setId(pkid);
			params.setCreateTime(Time.nowDateToString());
			params.setFiled1( MD5.pass(params.getFiled1()));
			memberDao.insertSelective(params);
			
			map.put("success", true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);	
			map.put("msg", "注册失败");
		}
		return map;
	}
    
    public void addMemberRole(String memberId,String name,int type){
    	MemberRole paramU=new MemberRole();
    	paramU.setId(IDGenerator.getID());
    	paramU.setName(name);
    	paramU.setMemberId(memberId);
    	paramU.setType(type);
    	paramU.setCreateTime(Time.nowDateToString());
//    	memberRoleDao.insertSelective(paramU);
    }
    
    
    @RequestMapping(params = "addHighUser")
	@ResponseBody
	public Map addHighUser(HttpSession session,HttpServletRequest request,Member params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			Map<Object, Object> map1 = new HashMap<Object, Object>();
			map1.put("tel", params.getTel());
			List<Member> list=memberDao.get(map1);
			if(list.size()>0){
				map.put("msg", "该手机后已经被注册了！");
				map.put("success", false);
			}else{
				String pkid=IDGenerator.getID();
				params.setId(pkid);
				params.setOpenId(IDGenerator.getID());
				params.setCreateTime(Time.nowDateToString());
				params.setFiled1( MD5.pass(params.getFiled1()));
				memberDao.insertSelective(params);
				
				map.put("success", true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);	
			map.put("msg", "注册失败");
		}
		return map;
	}
    @RequestMapping(params = "addSpecialUser")
	@ResponseBody
	public Map addSpecialUser(HttpSession session,HttpServletRequest request,Member params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			Map<Object, Object> map1 = new HashMap<Object, Object>();
			map1.put("email", params.getEmail());
			List<Member> list=memberDao.get(map1);
			if(list.size()>0){
				map.put("msg", "该邮箱已经被注册了！");
				map.put("success", false);
			}else{
				String pkid=IDGenerator.getID();
				params.setId(pkid);
				params.setOpenId(IDGenerator.getID());
				params.setCreateTime(Time.nowDateToString());
				params.setFiled1( MD5.pass(params.getFiled1()));
				memberDao.insertSelective(params);
				
				map.put("success", true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);	
			map.put("msg", "注册失败");
		}
		return map;
	}
    
    @RequestMapping(params = "update")
	@ResponseBody
	public Map update(HttpSession session,HttpServletRequest request,Member params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			memberDao.updateByPrimaryKeySelective(params);
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
	public Map update1(HttpSession session,HttpServletRequest request,Member params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			Map<Object,Object> map2=new HashMap<Object,Object>();
			
			Map<Object, Object> map1 = new HashMap<Object, Object>();
			map2.put("id", params.getId());
			map2.put("tel",params.getTel());
			List<Member> list2=memberDao.othertel(map2);
			
			if(list2.size()>0){
				map.put("msg", "该手机号已被注册");
				map.put("success", false);
			}else if(!(params.getEmail().equals(""))){
				map1.put("id",params.getId());
				map1.put("email", params.getEmail());
				
				List<Member> list=memberDao.othersel(map1);
				if(list.size()>0){
					map.put("msg","该邮箱已注册");
					map.put("success", false);
				}else{
					
					memberDao.updateByPrimaryKeySelective(params);
					map.put("msg", "修改成功");
					map.put("success", true);
				}
				
			}else{
				memberDao.updateByPrimaryKeySelective(params);
				map.put("msg", "修改成功");
				map.put("success", true);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);	
			map.put("msg", "修改失败");
		}
		return map;
	}
    
    
    @RequestMapping(params = "updateEmail")
	@ResponseBody
	public Map updateEmail(HttpSession session,HttpServletRequest request,Member params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			
			Map<Object, Object> map1 = new HashMap<Object, Object>();
			
			map1.put("id",params.getId());
			map1.put("email", params.getEmail());
			
			List<Member> list=memberDao.othersel(map1);
			if(list.size()>0){
				map.put("msg","该邮箱已注册");
				map.put("success", false);
			}
			else{
				memberDao.updateByPrimaryKeySelective(params);
				map.put("msg", "修改成功");
				map.put("success", true);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);	
			map.put("msg", "修改失败");
		}
		return map;
	}
    
    @RequestMapping(params = "updateTel")
	@ResponseBody
	public Map updateTel(HttpSession session,HttpServletRequest request,Member params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			
			Map<Object, Object> map1 = new HashMap<Object, Object>();
			
			map1.put("id",params.getId());
			map1.put("tel", params.getTel());
			
			List<Member> list=memberDao.otherseltel(map1);
			if(list.size()>0){
				map.put("msg","该手机号已注册");
				map.put("success", false);
			}
			else{
				memberDao.updateByPrimaryKeySelective(params);
				map.put("msg", "修改成功");
				map.put("success", true);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);	
			map.put("msg", "修改失败");
		}
		return map;
	}
    
    @RequestMapping(params = "sel")
	@ResponseBody
	public Map sel(HttpSession session,HttpServletRequest request,Member params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			Member member=memberDao.selectByPrimaryKey(params.getId());
			map.put("msg", "查询成功");
			map.put("member", member);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);	
			map.put("msg", "查询失败");
		}
		return map;
	}
    @RequestMapping(params = "tjjobTitleUsers")
	@ResponseBody
	public Map<Object, Object> tjjobTitleUsers(HttpServletRequest request){
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
			List<Member> list=memberDao.tjjobTitleUsers(queryMap);
			map.put("total", memberDao.tjjobTitleUsers(map).size());
			map.put("rows", list);
			map.put("success",true);
			map.put("page", page);
			map.put("msg", "查询成功");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("success",false);
			map.put("msg", "查询失败");
		}
		return map;
	}
    
    @RequestMapping(params = "tjhospitalNameUsers")
	@ResponseBody
	public Map<Object, Object> tjhospitalNameUsers(HttpServletRequest request){
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
			List<Member> list=memberDao.tjhospitalNameUsers(queryMap);
			map.put("total", memberDao.tjhospitalNameUsers(map).size());
			map.put("rows", list);
			map.put("success",true);
			map.put("page", page);
			map.put("msg", "查询成功");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("success",false);
			map.put("msg", "查询失败");
		}
		return map;
	}
    
    

   
    @RequestMapping(params = "telsel")
	@ResponseBody
	public Map telsel(HttpSession session,HttpServletRequest request,Member params){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			List<Member> list=memberDao.telsel(params.getTel());
			if(list.size()>0){
				map.put("success", false);
				map.put("msg", "该手机号已被注册!");
			}else{
			map.put("msg", "查询成功");
			map.put("list", list);
			map.put("success", true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);	
			map.put("msg", "查询失败");
		}
		return map;
	}

    @RequestMapping(params = "getCheck")
	@ResponseBody
	public Map<Object, Object> getCheck(HttpServletRequest request){
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
			List<Member> list = memberDao.getCheck(queryMap);
			map.put("rows", list);
			map.put("total", memberDao.getCheckNum(queryMap));
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
    

}
