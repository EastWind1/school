package com.ian.media.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.ian.media.dao.InformationMapper;
import com.ian.media.dao.MemberMapper;
import com.ian.media.dao.WxPublicMapper;
import com.ian.media.dao.WxSignatureMapper;
import com.ian.media.dao.WxUsersMapper;
import com.ian.media.model.Information;
import com.ian.media.model.Member;
import com.ian.media.model.WxPublic;
import com.ian.media.model.WxUsers;
import com.ian.media.util.OAuth20;
import com.ian.media.util.Time;
import com.ian.media.util.ToolUtil;
import com.ian.media.util.SignUtil;
import com.ian.media.util.MessageUtil;
import com.ian.media.util.WxPublicMethodUtil;
import com.ian.media.model.res.Article;
import com.ian.media.model.res.NewsMessageRes;
import com.ian.media.model.res.TextMessageRes;

@Controller("wxEvenAction")
@Scope("prototype")
@RequestMapping("/wxEven")
public class WxEventController extends BaseController<WxPublic> {
	 public WxPublicMapper wxPublicDao; 
	 public WxUsersMapper wxUserDao;
	 public WxSignatureMapper wxSignatureDao;
	 public InformationMapper informationDao;
	 public MemberMapper memberDao;
	 String global_url=null;
//	private String latitude;//地理位置纬度
//	 private String eventKey;//事件KEY值，与自定义菜单接口中KEY值对应 
	 @Autowired
    public void setInformationDao(InformationMapper informationDao) {
        this.informationDao = informationDao;
    }
	 @Autowired
	    public void setMemberOrderDao(MemberMapper memberDao) {
	        this.memberDao = memberDao;
	    }

	@Autowired
    public void setWxPublicMapperDao(WxPublicMapper wxPublicDao) {
        this.wxPublicDao = wxPublicDao;
    }
	@Autowired
    public void setWxUsersMapperDao(WxUsersMapper wxUserDao) {
        this.wxUserDao = wxUserDao;
    }
	@Autowired
    public void setWxSignatureMapperDao(WxSignatureMapper wxSignatureDao) {
        this.wxSignatureDao = wxSignatureDao;
    }
	@PostConstruct
	public void setBaseDao(){
		super.setBaseDao(wxPublicDao);
	}
	
	HttpServletResponse response;
	
	@RequestMapping("/receive")
	@ResponseBody
	public void receive(HttpServletRequest request,HttpServletResponse res,HttpSession session){
		response = res;
		String token = "";
		String echostr = request.getParameter("echostr");
		String signature = request.getParameter("signature");
		//接入服务器时，成为开发者echostr是随机字符串，接入之后的事件echostr为null
		if (null == echostr || echostr.isEmpty()) {
			//processRequest事件处理方法，将事件需要返回的结果组成字符串
			String respMessage = this.processRequest(request,session);
            if (!respMessage.equals("")){ 
            	//事件返回的结果不是空的时候，则调用print将结果返回到微信
            	this.print(respMessage);
            }
		} else {
			if (SignUtil.check(request, response ,"weixinreceive")) {
				this.print(echostr);
			} else {
				this.print("error");
			}
		}
	}
	
	/**
	 * 接入之后的时间逻辑处理
	 * @param request
	 * @return
	 */
	 public String processRequest(HttpServletRequest request,HttpSession session) {
		 String respMessage = ""; 
		 try {
			 global_url =ToolUtil.getValue("/config.properties", "S4S_SERVER_URL");
			// xml请求解析
	         Map<String, String> requestMap = MessageUtil.parseXml(request);
	         
	         String respContent="";
			 String wxId = requestMap.get("ToUserName");//开发者微信号
			 final String openId = requestMap.get("FromUserName");//发送方帐号（一个OpenID）
			 String createTime = requestMap.get("CreateTime");//消息创建时间 （整型）
			 String msgType = requestMap.get("MsgType");//消息类型，event
			 
			// 初始化回复文本消息的实体
			 TextMessageRes textMessage=null;
			 
			//事件消息
			 if(msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)){
				 System.out.println("---------------------------");
				 String event = requestMap.get("Event");//事件类型
				 /**
				  * 关注事件
				  */
				 if(event.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)){
//					 String content="你好，谢谢关注，<a href=\"http://www.baidu.com\">点击上网</a>";
//					 textMessage=t his.replyText(content, openId, wxId);
//					 respMessage = MessageUtil.textMessageToXml(textMessage);
					 
					 String eventKey=requestMap.get("EventKey");
					 //System.out.println("eventKey======"+eventKey);//eventKey======qrscene_zghd
					 WxUsers paramT=new WxUsers();
					 Map userMap3=new HashMap();
					 userMap3.put("openId", openId);
					 List<WxUsers> listUser=wxUserDao.get(userMap3);
					 if(listUser != null && listUser.size()>0){
						 paramT.setOpenId(openId);
						 paramT.setSubscribe("1");
						 wxUserDao.updateByPrimaryKeySelective(paramT);
					 }else{
						 WxPublicMethodUtil.setWxPublicDao(wxPublicDao);
						 WxPublicMethodUtil.setWxUserDao(wxUserDao);
						 WxPublicMethodUtil.getUserInfo(openId, "gh_8d5f9c073de7");
					 }
					 if(eventKey != null && !eventKey.equals("")){
						 String params=eventKey.split("_")[1];
						 if(params.equals("hyjf")){
							 return eventgz(openId,wxId,"网上注册缴费：第二届中国重症医学信息化与互联网大会暨2016年山东省和济南市重症医学年会",global_url+"weixin/images/hyjf.png",global_url+"wxEven/auth.action?brandId="+wxId+"&type=pay");
						 }
						 if(params.equals("zghd")){
							 return eventzghd(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
						 }else if(params.equals("zgtp")){
							 return eventzgtg(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
						 }else if(params.equals("fzvote")){
//							 String contentmsg="抱歉，本轮竞猜尚未开始。\n绿色方舟第3季南区半决赛有奖竞猜时间为：4月6日0点-4月15日24点，期待您的参与！";
//							 textMessage=this.replyText(contentmsg, openId, wxId);
//							 respMessage = MessageUtil.textMessageToXml(textMessage);
							 return eventfztg(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
						 }else{
							 String hy=eventKey.split("_")[2];
							 if(hy.equals("hy")){
								 Map<Object, Object> map1 = new HashMap<Object, Object>();
								 map1.put("openId", openId);
								 List<Member> listme=memberDao.get(map1);
								 String contentmsg;
								 if(listme.size()>0){
									 memberDao.deleteByPrimaryKey(params);
									 contentmsg="该微信号已绑定，可以直接登录！";
								 }else{
									 Member member=new Member();
						        		member.setId(params);
						        		member.setOpenId(openId);
						        		memberDao.updateByPrimaryKeySelective(member);
										contentmsg="绑定成功！";
								 }
								 textMessage=this.replyText(contentmsg, openId, wxId);
								 respMessage = MessageUtil.textMessageToXml(textMessage);
							 }
							 else{
								 Map userMap=new HashMap();
								 userMap.put("openId", openId);
								 List<WxUsers> listUser3=wxUserDao.get(userMap);
								 if(listUser3 != null && listUser3.size()>0){
									 paramT.setOpenId(openId);
									 paramT.setSubscribe("1");
									 wxUserDao.updateByPrimaryKeySelective(paramT);
								 }else{
									 WxPublicMethodUtil.setWxPublicDao(wxPublicDao);
									 WxPublicMethodUtil.setWxUserDao(wxUserDao);
									 WxPublicMethodUtil.getUserInfo(openId, "gh_8d5f9c073de7");
								 }
								 String content="活动已结束，谢谢参与！";
								 textMessage=this.replyText(content, openId, wxId);
								 respMessage = MessageUtil.textMessageToXml(textMessage);
								// return event(openId,wxId,"在线面对面",global_url+"weixin/images/wd.png",global_url+"weixin/huodong/zhuanti.jsp?openId="+openId+"&brandId="+wxId);
//								 paramT.setUserId(params);
//								 paramT.setFiled1("2");
//								 String contentmsg="你已成为专家！";
//								 textMessage=this.replyText(contentmsg, openId, wxId);
//								 respMessage = MessageUtil.textMessageToXml(textMessage);
							 }
						 }
					}
//					 String contentmsg="抱歉，本轮竞猜尚未开始。\n绿色方舟第3季南区半决赛有奖竞猜时间为：4月6日0点-4月15日24点，期待您的参与！";
//					 textMessage=this.replyText(contentmsg, openId, wxId);
//					 respMessage = MessageUtil.textMessageToXml(textMessage);
					// return eventgz(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
					//普通关注时推送
					 return eventgz(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
						
				 }
				 /**
				  * 取消关注事件
				  */
				 else if(event.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)){
					// TODO 取消订阅后用户再收不到公众号发送的消息，因此不需要回复消息
	                 Thread t = new Thread(new Runnable() {
	                     public void run() {
	                    	 WxUsers paramT=new WxUsers();
							 paramT.setOpenId(openId);
							 paramT.setSubscribe("0");
							 paramT.setFiled3(Time.nowDateToString());
							 System.out.println(openId);
							 wxUserDao.updateByPrimaryKeySelective(paramT);
	                     }
	                 });
	                 t.start();
				 }
				 
				 /**
				  * 二维码事件，已关注
				  */
				 else if(event.equals(MessageUtil.EVENT_SCAN_TYPE_HAD_SUBSCRIBE)){
					 String eventKey=requestMap.get("EventKey");
					 if(eventKey.equals("hyjf")){
						 return hyjf(openId,wxId,"网上注册缴费：第二届中国重症医学信息化与互联网大会暨2016年山东省和济南市重症医学年会",global_url+"weixin/images/hyjf.png",global_url+"wxEven/auth.action?brandId="+wxId+"&type=pay");
					 }
					 if(eventKey.equals("zghd")){
						 return eventzghd(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
					 }if(eventKey.equals("zgtp")){
						 return eventzgtg(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
					 }if(eventKey.equals("fzvote")){
//						 String contentmsg="抱歉，本轮竞猜尚未开始。\n绿色方舟第3季南区半决赛有奖竞猜时间为：4月6日0点-4月15日24点，期待您的参与！";
//						 textMessage=this.replyText(contentmsg, openId, wxId);
//						 respMessage = MessageUtil.textMessageToXml(textMessage);
						 return eventfztg(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
					 }
					 String ticket=requestMap.get("Ticket");
					 String params=eventKey.split("_")[0];
					 String params1=eventKey.split("_")[1];
					
					 if(eventKey.equals("yyy")){
						 return event(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
				    }if(params1.equals("hy")){
						 Map<Object, Object> map1 = new HashMap<Object, Object>();
						 map1.put("openId", openId);
						 List<Member> listme=memberDao.get(map1);
						 String contentmsg;
						 if(listme.size()>0){
							 memberDao.deleteByPrimaryKey(params);
							 contentmsg="该微信号已绑定，可以直接登录！";
						 }
						 else{
							 Member member=new Member();
				        		member.setId(params);
				        		member.setOpenId(openId);
				        		memberDao.updateByPrimaryKeySelective(member);
								contentmsg="绑定成功！";
						 }
						 
							 textMessage=this.replyText(contentmsg, openId, wxId);
							 respMessage = MessageUtil.textMessageToXml(textMessage);
					 }
//				    else{
//						 Map userMap=new HashMap();
//						 userMap.put("openId", openId);
//						 List<WxUsers> listUser=wxUserDao.get(userMap);
//						 WxUsers paramT=new WxUsers();
//						 if(listUser != null && listUser.size()>0){
//							 paramT.setOpenId(openId);
//							 paramT.setSubscribe("1");
//							 wxUserDao.updateByPrimaryKeySelective(paramT);
//						 }else{
//							 WxPublicMethodUtil.setWxPublicDao(wxPublicDao);
//							 WxPublicMethodUtil.setWxUserDao(wxUserDao);
//							 WxPublicMethodUtil.getUserInfo(openId, "gh_8d5f9c073de7");
//						 }
//						 String content="活动已结束，谢谢参与！";
//						 textMessage=this.replyText(content, openId, wxId);
//						 respMessage = MessageUtil.textMessageToXml(textMessage);
//					 }
				    return eventgz(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
					
				 }
				 
				 /**
				  * 上报地理位置
				  */
				 else if(event.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)){
					 String latitude=requestMap.get("Latitude");
					 String longitude=requestMap.get("Longitude");
					 Map map = new HashMap();
					 map.put("username", openId);
					 System.out.println("你的经纬度："+latitude+"----"+longitude);
					 
				 }
				 /**
				  * 点击菜单拉取消息时的事件推送
				  */
				 else if(event.equals(MessageUtil.EVENT_TYPE_CLICK)){
					 String eventKey=requestMap.get("EventKey");
					 if(eventKey.equals("0")){
						 String contentmsg="功能开发中，敬请期待！";
						 textMessage=this.replyText(contentmsg, openId, wxId);
						 respMessage = MessageUtil.textMessageToXml(textMessage);
					 }else if(eventKey.equals("yyy")){
						 return event(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
					 }else if(eventKey.equals("zb")){
						 return eventMore(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
				     }else if(eventKey.equals("new")){
						 return eventNew(openId,wxId);
				     }else if(eventKey.equals("yczx")){
						 return eventyczx(openId,wxId);
				     }
					 
				 }
				 /**
				  * 点击菜单跳转链接时的事件推送
				  */
				 else if(event.equals(MessageUtil.EVENT_TYPE_VIEW)){
					 String eventKey=requestMap.get("EventKey");
				 }
			 }
			 //普通消息
			 //微信端发送文本消息
			 else if(msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)){
				 String content = requestMap.get("Content");//消息内容
				 String msgId = requestMap.get("MsgId");//消息id
				 if(content.equals("投票")){
					 return eventzgtg(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
				 }
				 if(content.equals("投稿")){
					 return eventzghd(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
				 }
			 }
			 //微信端发送图片消息
			 else if(msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)){
				 String picUrl = requestMap.get("PicUrl");//图片链接
				 String mediaId = requestMap.get("MediaId");//图片消息媒体id，可以调用多媒体文件下载接口拉取数据。
				 String msgId = requestMap.get("MsgId");//消息id
			 }
			//微信端发送语音消息
			 else if(msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)){
				 String format = requestMap.get("Format");//语音格式，如amr，speex等
				 String mediaId = requestMap.get("MediaId");//语音消息媒体id，可以调用多媒体文件下载接口拉取数据。
				 String msgId = requestMap.get("MsgId");//消息id
				 String recognition = requestMap.get("Recognition");//语音识别结果，UTF8编码
			 }
			//微信端发送视频消息 
			 else if(msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VIDEO)){
				 String thumbMediaId = requestMap.get("ThumbMediaId");//视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。
				 String mediaId = requestMap.get("MediaId");//视频消息媒体id，可以调用多媒体文件下载接口拉取数据。
				 String msgId = requestMap.get("MsgId");//消息id
			 }
			//微信端发送地理位置消息
			 else if(msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)){
				 String locationX = requestMap.get("Location_X");//地理位置维度
				 String locationY = requestMap.get("Location_Y");//地理位置经度
				 String scale = requestMap.get("Scale");//地图缩放大小
				 String label = requestMap.get("Label");//地理位置信息
				 String msgId = requestMap.get("MsgId");//消息id
			 }
			//微信端发送链接消息
			 else if(msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)){
				 String title = requestMap.get("Title");//地理位置维度
				 String description = requestMap.get("Description");//地理位置经度
				 String url = requestMap.get("Url");//地图缩放大小
				 String msgId = requestMap.get("MsgId");//消息id
			 }
			 
			 
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		 return respMessage;
	 } 
	 
	 //资讯
	 public String eventNew(String fromUserName,String toUserName){
	    	NewsMessageRes newsMessage = new NewsMessageRes();
	        newsMessage.setToUserName(fromUserName);
	        newsMessage.setFromUserName(toUserName);
	        newsMessage.setCreateTime(new Date().getTime());
	        newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
	        newsMessage.setFuncFlag(0);
	        Map<Object, Object> map = new HashMap<Object, Object>();
	        map.put("brandId", toUserName);
	        map.put("type", "1");
	        List<Information> list = informationDao.get(map);
	        List articleList  = new ArrayList();
	        
	        for(int i=0;i<list.size();i++){
	        	Article article_i = new Article();
	        	article_i.setTitle(list.get(i).getInformationTitle());
		       // article.setDescription("");
	        	article_i.setPicUrl(global_url+"data/material/"+list.get(i).getInformationImage());
	        	article_i.setUrl(list.get(i).getField4());
		        articleList.add(article_i);
	        }
	        
	        // 设置图文消息个数
	        newsMessage.setArticleCount(articleList.size());
	        // 设置图文消息包含的图文集合
	        newsMessage.setArticles(articleList);
	        // 将图文消息对象转换成xml字符串
	        return MessageUtil.newsMessageToXml(newsMessage);
	    }
	 
	 //远程咨询
	 public String eventyczx(String fromUserName,String toUserName){
		 Map<Object, Object> map = new HashMap<Object, Object>();
		 map.put("openId", fromUserName);
		 List<Member> listMember=memberDao.get(map);
		 NewsMessageRes newsMessage = new NewsMessageRes();
		 List articleList  = new ArrayList();
		 newsMessage.setToUserName(fromUserName);
         newsMessage.setFromUserName(toUserName);
         newsMessage.setCreateTime(new Date().getTime());
         newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
         newsMessage.setFuncFlag(0);
         Article article = new Article();
        article.setTitle("APP常见问题解答");
        article.setDescription("");
        article.setPicUrl(global_url+"weixin/images/app.jpg");
        article.setUrl(global_url+"weixin/app/FAQ.html");
        articleList.add(article);
        
        Article article1 = new Article();
        article1.setTitle("Android版APP下载（安卓手机/pad适用）");
        article1.setDescription("");
        article1.setPicUrl(global_url+"weixin/images/android.png");
        article1.setUrl("http://a.app.qq.com/o/simple.jsp?pkgname=com.ian.icu");
        articleList.add(article1);
        Article article3 = new Article();
        article3.setTitle("Android版APP使用手册");
        article3.setDescription("");
        article3.setPicUrl(global_url+"weixin/images/android.png");
        article3.setUrl("http://u.eqxiu.com/s/s7Zjyj2b");
        articleList.add(article3);
        
        Article article2 = new Article();
        article2.setTitle("IOS版APP下载（苹果手机/ipad适用）");
        article2.setDescription("");
        article2.setPicUrl(global_url+"weixin/images/ios.png");
        article2.setUrl("https://itunes.apple.com/us/app/yunicu/id1062118952?l=zh&ls=1&mt=8");
        articleList.add(article2);
        
        Article article4 = new Article();
        article4.setTitle("IOS版APP使用手册");
        article4.setDescription("");
        article4.setPicUrl(global_url+"weixin/images/ios.png");
        article4.setUrl("http://x.eqxiu.com/s/Jvm50pqW");
        articleList.add(article4);
		 
	        // 设置图文消息个数
	        newsMessage.setArticleCount(articleList.size());
	        // 设置图文消息包含的图文集合
	        newsMessage.setArticles(articleList);
	        // 将图文消息对象转换成xml字符串
	        return MessageUtil.newsMessageToXml(newsMessage);
	    }
	 
	 //摇一摇
	 public String event(String fromUserName,String toUserName,String title,String picUrl ,String url){
	    	NewsMessageRes newsMessage = new NewsMessageRes();
	        newsMessage.setToUserName(fromUserName);
	        newsMessage.setFromUserName(toUserName);
	        newsMessage.setCreateTime(new Date().getTime());
	        newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
	        newsMessage.setFuncFlag(0);
	        List articleList  = new ArrayList();
	        Article article = new Article();
	        article.setTitle(title);
	        article.setDescription("");
	        article.setPicUrl(picUrl);
	        article.setUrl(url);
	        articleList.add(article);
	        // 设置图文消息个数
	        newsMessage.setArticleCount(articleList.size());
	        // 设置图文消息包含的图文集合
	        newsMessage.setArticles(articleList);
	        // 将图文消息对象转换成xml字符串
	        return MessageUtil.newsMessageToXml(newsMessage);
	    }
	 
	 //会议缴费
	 public String hyjf(String fromUserName,String toUserName,String title,String picUrl ,String url){
	    	NewsMessageRes newsMessage = new NewsMessageRes();
	        newsMessage.setToUserName(fromUserName);
	        newsMessage.setFromUserName(toUserName);
	        newsMessage.setCreateTime(new Date().getTime());
	        newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
	        newsMessage.setFuncFlag(0);
	        List articleList  = new ArrayList();
	        Article article = new Article();
	        article.setTitle(title);
	        article.setDescription("");
	        article.setPicUrl(picUrl);
	        article.setUrl(url);
	        articleList.add(article);
	        // 设置图文消息个数
	        newsMessage.setArticleCount(articleList.size());
	        // 设置图文消息包含的图文集合
	        newsMessage.setArticles(articleList);
	        // 将图文消息对象转换成xml字符串
	        return MessageUtil.newsMessageToXml(newsMessage);
	    }
	 
	 /*直播课堂*/
	 public String eventMore(String fromUserName,String toUserName,String title,String picUrl ,String url){
	    	NewsMessageRes newsMessage = new NewsMessageRes();
	        newsMessage.setToUserName(fromUserName);
	        newsMessage.setFromUserName(toUserName);
	        newsMessage.setCreateTime(new Date().getTime());
	        newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
	        newsMessage.setFuncFlag(0);
	        List articleList  = new ArrayList();
	        Article article = new Article();
	        article.setTitle("直播视频的课程正在收集确认中，有兴趣上传视频或直播课程的同道，请与我们联系，谢谢！");
	        article.setDescription("");
	        article.setPicUrl(global_url+"weixin/images/zb.jpg");
	        articleList.add(article);
	        // 设置图文消息个数
	        newsMessage.setArticleCount(articleList.size());
	        // 设置图文消息包含的图文集合
	        newsMessage.setArticles(articleList);
	        // 将图文消息对象转换成xml字符串
	        return MessageUtil.newsMessageToXml(newsMessage);
	    }
	 
	 /****普通关注*****/
	 public String eventgz(String fromUserName,String toUserName,String title,String picUrl ,String url){
	    	NewsMessageRes newsMessage = new NewsMessageRes();
	        newsMessage.setToUserName(fromUserName);
	        newsMessage.setFromUserName(toUserName);
	        newsMessage.setCreateTime(new Date().getTime());
	        newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
	        newsMessage.setFuncFlag(0);
	        List articleList  = new ArrayList();
	        Article article = new Article();
	        article.setTitle("云ICU平台简介");
	        article.setDescription("");
	        article.setPicUrl(global_url+"weixin/images/app.jpg");
	        article.setUrl("http://mp.weixin.qq.com/s?__biz=MjM5NTEwNDE4OA==&mid=401641167&idx=1&sn=d36a1224e28b5fb38a05543741f578cf&scene=0&previewkey=PFoH3nxSCgm4B%2FMYg5CawsNS9bJajjJKzz%2F0By7ITJA%3D#rd");
	        articleList.add(article);
	        
	        Article article2 = new Article();
	        article2.setTitle("我要注册");
	        article2.setDescription("");
	        article2.setUrl(global_url+"wxEven/auth.action?brandId="+toUserName+"&type=info");
	        article2.setPicUrl(global_url+"weixin/images/register.png");
	        articleList.add(article2);
	        
	        Article article3 = new Article();
	        article3.setTitle("会议注册缴费");
	        article3.setDescription("");
	        article3.setUrl("http://weixin.yunicu.com/ychz/wxEven/auth.action?brandId=gh_8d5f9c073de7&type=pay");
	        article3.setPicUrl(global_url+"weixin/images/hyjf.png");
	        articleList.add(article3);
	        
//	        Article article4 = new Article();
//	        article4.setTitle("绿色方舟第3季半决赛有奖竞猜-南区");
//	        article4.setDescription("");
//	        article4.setUrl(global_url+"wxEven/auth.action?brandId="+toUserName+"&type=fzvode");
//	        article4.setPicUrl(global_url+"weixin/images/fz-zf.jpg");
//	        articleList.add(article4);
//	        Article article5 = new Article();
//	        article5.setTitle("绿色方舟第3季半决赛有奖竞猜-北区");
//	        article5.setDescription("");
//	        article5.setUrl(global_url+"wxEven/auth.action?brandId="+toUserName+"&type=fzvodebq");
//	        article5.setPicUrl(global_url+"weixin/images/fz-zf.jpg");
//	        articleList.add(article5);
	        
	        
//	        Article article2 = new Article();
//	        article2.setTitle("客服电话：4008554120");
//	        article2.setDescription("");
//	        article2.setUrl(global_url+"wxEven/auth.action?brandId="+toUserName+"&type=email");
//	        article2.setPicUrl(global_url+"weixin/images/phone.png");
//	        articleList.add(article2);
	        
	        // 设置图文消息个数
	        newsMessage.setArticleCount(articleList.size());
	        // 设置图文消息包含的图文集合
	        newsMessage.setArticles(articleList);
	        // 将图文消息对象转换成xml字符串
	        return MessageUtil.newsMessageToXml(newsMessage);
	    }
	 /**
	  * 征稿活动关注
	  */
	 public String eventzghd(String fromUserName,String toUserName,String title,String picUrl ,String url){
	    	NewsMessageRes newsMessage = new NewsMessageRes();
	        newsMessage.setToUserName(fromUserName);
	        newsMessage.setFromUserName(toUserName);
	        newsMessage.setCreateTime(new Date().getTime());
	        newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
	        newsMessage.setFuncFlag(0);
	        List articleList  = new ArrayList();
	        Article article2 = new Article();
	        article2.setTitle("云ICU平台介绍");
	        article2.setDescription("");
	        article2.setUrl("http://mp.weixin.qq.com/s?__biz=MzAxODU0MzM0MA==&mid=401440685&idx=1&sn=c7a6725edf2ce11972f8615f747a2043&scene=1&srcid=0321zbhb3Npwi7rpva4CGhRs#rd");
	        article2.setPicUrl(global_url+"weixin/images/app.jpg");
	        articleList.add(article2);
	        
	        Article article3 = new Article();
	        article3.setTitle("“我的ICU”微小说大赛通知");
	        article3.setDescription("");
	        article3.setUrl("http://r.xiumi.us/board/v5/22U0a/11128741");
//	        article3.setUrl(global_url+"wxEven/auth.action?brandId="+toUserName+"&type=register");
	        article3.setPicUrl(global_url+"weixin/images/app.jpg");
	        articleList.add(article3);
	        
//	        Article article = new Article();
//	        article.setTitle("点击进入“我的ICU”微小说投稿");
//	        article.setDescription("");
//	        article.setPicUrl(global_url+"weixin/images/app.jpg");
//	        article.setUrl(global_url+"wxEven/auth.action?brandId="+toUserName+"&type=zghd");
//	        articleList.add(article);
	        
	        
	        
	        // 设置图文消息个数
	        newsMessage.setArticleCount(articleList.size());
	        // 设置图文消息包含的图文集合
	        newsMessage.setArticles(articleList);
	        // 将图文消息对象转换成xml字符串
	        return MessageUtil.newsMessageToXml(newsMessage);
	    }
	 
	 public String eventzgtg(String fromUserName,String toUserName,String title,String picUrl ,String url){
	    	NewsMessageRes newsMessage = new NewsMessageRes();
	        newsMessage.setToUserName(fromUserName);
	        newsMessage.setFromUserName(toUserName);
	        newsMessage.setCreateTime(new Date().getTime());
	        newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
	        newsMessage.setFuncFlag(0);
	        List articleList  = new ArrayList();
	        Article article1 = new Article();
	        article1.setTitle("云ICU平台介绍");
	        article1.setDescription("");
	        article1.setUrl("http://mp.weixin.qq.com/s?__biz=MzAxODU0MzM0MA==&mid=401440685&idx=1&sn=c7a6725edf2ce11972f8615f747a2043&scene=1&srcid=0321zbhb3Npwi7rpva4CGhRs#rd");
	        article1.setPicUrl(global_url+"weixin/images/app.jpg");
	        articleList.add(article1);
	        
	        Article article2 = new Article();
	        article2.setTitle("微小说投票");
	        article2.setDescription("");
	       // article2.setUrl(global_url+"wxEven/auth.action?brandId="+toUserName+"&type=vote");
	        article2.setUrl("http://mp.weixin.qq.com/s?__biz=MjM5NTEwNDE4OA==&mid=502951234&idx=1&sn=3dd646159ae9f7554cedbab24fe52671&scene=1&srcid=0523b1qZPowquZE8X8aryKz6#rd");
	        article2.setPicUrl(global_url+"weixin/images/app.jpg");
	        articleList.add(article2);
	        
	        Article article3 = new Article();
	        article3.setTitle("微小说公告——终止网络投票评审活动");
	        article3.setDescription("");
	        article3.setUrl("http://mp.weixin.qq.com/s?__biz=MjM5NTEwNDE4OA==&mid=502951234&idx=1&sn=3dd646159ae9f7554cedbab24fe52671&scene=1&srcid=0523b1qZPowquZE8X8aryKz6#rd");
	        article3.setPicUrl(global_url+"weixin/images/app.jpg");
	        articleList.add(article3);
	        
//	        Article article3 = new Article();
//	        article3.setTitle("“我的ICU”微小说大赛作品秀-第5期");
//	        article3.setDescription("");
//	        article3.setUrl("http://mp.weixin.qq.com/s?__biz=MzAxODU0MzM0MA==&mid=502323370&idx=2&sn=c5744157300ee12ebe60103cf43eb36b#rd");
//	        article3.setPicUrl(global_url+"weixin/images/app.jpg");
//	        articleList.add(article3);
//	        
//	        Article article4 = new Article();
//	        article4.setTitle("“我的ICU”微小说大赛作品秀-第4期");
//	        article4.setDescription("");
//	        article4.setUrl("http://mp.weixin.qq.com/s?__biz=MzAxODU0MzM0MA==&mid=502323367&idx=2&sn=2b9e41fbd305d4b4d580cc3a04b3c95e#rd");
//	        article4.setPicUrl(global_url+"weixin/images/app.jpg");
//	        articleList.add(article4);
//	        
//	        Article article5 = new Article();
//	        article5.setTitle("“我的ICU”微小说大赛作品秀-第3期");
//	        article5.setDescription("");
//	        article5.setUrl("http://mp.weixin.qq.com/s?__biz=MzAxODU0MzM0MA==&mid=502323364&idx=2&sn=392efacb362fda795814abefe5ef9dd8#rd");
//	        article5.setPicUrl(global_url+"weixin/images/app.jpg");
//	        articleList.add(article5);
//	        
//	        Article article6 = new Article();
//	        article6.setTitle("“我的ICU”微小说大赛作品秀-第2期");
//	        article6.setDescription("");
//	        article6.setUrl("http://mp.weixin.qq.com/s?__biz=MzAxODU0MzM0MA==&mid=402322576&idx=2&sn=7756bdc1e93a7d3c57fdb4378852c56c#rd");
//	        article6.setPicUrl(global_url+"weixin/images/app.jpg");
//	        articleList.add(article6);
//	        
//	        Article article7 = new Article();
//	        article7.setTitle("“我的ICU”微小说大赛作品秀-第1期");
//	        article7.setDescription("");
//	        article7.setUrl("http://mp.weixin.qq.com/s?__biz=MzAxODU0MzM0MA==&mid=402261812&idx=2&sn=7c8aa5e80917651e3999bdaac462c82e#rd");
//	        article7.setPicUrl(global_url+"weixin/images/app.jpg");
//	        articleList.add(article7);
	        
//	        Article article8 = new Article();
//	        article8.setTitle("重磅！“我的ICU”微小说大赛正式开始啦！");
//	        article8.setDescription("");
//	        article8.setUrl("http://mp.weixin.qq.com/s?__biz=MzAxODU0MzM0MA==&mid=402087763&idx=1&sn=7b8dfaedb60c8f2999a835b7838f165a&scene=1&srcid=0506eJ9zFbKpJ74t046mJNdI#rd");
//	        article8.setPicUrl(global_url+"weixin/images/app.jpg");
//	        articleList.add(article8);
	        
//	        Article article2 = new Article();
//	        article2.setTitle("客服电话：4008554120");
//	        article2.setDescription("");
//	       // article2.setUrl(global_url+"wxEven/auth.action?brandId="+toUserName+"&type=email");
//	        article2.setPicUrl(global_url+"weixin/images/phone.png");
//	        articleList.add(article2);
	        
	        // 设置图文消息个数
	        newsMessage.setArticleCount(articleList.size());
	        // 设置图文消息包含的图文集合
	        newsMessage.setArticles(articleList);
	        // 将图文消息对象转换成xml字符串
	        return MessageUtil.newsMessageToXml(newsMessage);
	    }
	 public String eventfztg(String fromUserName,String toUserName,String title,String picUrl ,String url){
	    	NewsMessageRes newsMessage = new NewsMessageRes();
	        newsMessage.setToUserName(fromUserName);
	        newsMessage.setFromUserName(toUserName);
	        newsMessage.setCreateTime(new Date().getTime());
	        newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
	        newsMessage.setFuncFlag(0);
	        List articleList  = new ArrayList();
	        Article article = new Article();
	        article.setTitle("云ICU平台简介");
	        article.setDescription("");
	        article.setPicUrl(global_url+"weixin/images/app.jpg");
	        article.setUrl("http://mp.weixin.qq.com/s?__biz=MjM5NTEwNDE4OA==&mid=401641167&idx=1&sn=d36a1224e28b5fb38a05543741f578cf&scene=0&previewkey=PFoH3nxSCgm4B%2FMYg5CawsNS9bJajjJKzz%2F0By7ITJA%3D#rd");
	        articleList.add(article);
	        
//	        Article article4 = new Article();
//	        article4.setTitle("绿色方舟第3季半决赛有奖竞猜-南区");
//	        article4.setDescription("");
//	        article4.setUrl(global_url+"wxEven/auth.action?brandId="+toUserName+"&type=fzvode");
//	        article4.setPicUrl(global_url+"weixin/images/fz-zf.jpg");
//	        articleList.add(article4);
//	        Article article5 = new Article();
//	        article5.setTitle("绿色方舟第3季半决赛有奖竞猜-北区");
//	        article5.setDescription("");
//	        article5.setUrl(global_url+"wxEven/auth.action?brandId="+toUserName+"&type=fzvodebq");
//	        article5.setPicUrl(global_url+"weixin/images/fz-zf.jpg");
//	        articleList.add(article5);
	        
	        Article article2 = new Article();
	        article2.setTitle("我要注册");
	        article2.setDescription("");
	        article2.setUrl(global_url+"wxEven/auth.action?brandId="+toUserName+"&type=info");
	        article2.setPicUrl(global_url+"weixin/images/register.png");
	        articleList.add(article2);
	        
//	        Article article2 = new Article();
//	        article2.setTitle("客服电话：4008554120");
//	        article2.setDescription("");
//	       // article2.setUrl(global_url+"wxEven/auth.action?brandId="+toUserName+"&type=email");
//	        article2.setPicUrl(global_url+"weixin/images/phone.png");
//	        articleList.add(article2);
	        
	        // 设置图文消息个数
	        newsMessage.setArticleCount(articleList.size());
	        // 设置图文消息包含的图文集合
	        newsMessage.setArticles(articleList);
	        // 将图文消息对象转换成xml字符串
	        return MessageUtil.newsMessageToXml(newsMessage);
	    }
	 
	 @RequestMapping("/auth")
	 public ModelAndView auth(String brandId,String type,HttpServletRequest request,HttpServletResponse response) throws IOException{
		global_url =ToolUtil.getValue("/config.properties", "S4S_SERVER_URL");
        String returnUrl = "";
        String wxLoginUrl = "weixin/login";
        String authUrl = global_url+"wxEven/oauth.action";
		 if ("new".equals(type)) {//新闻资讯
            returnUrl = "weixin/zx/news";   
         }else if("information".equals(type)){//资讯
        	 returnUrl = "weixin/zx/information";
         }else if("pay".equals(type)){//会议缴费
//        	 returnUrl = "weixin/meet_wechat/index";
        	 returnUrl ="redirect:"+global_url+"member.action?isregister&type=index&land=meet_wechat";
         }else if("notice".equals(type)){//系统公告
        	 returnUrl = "weixin/zx/notice";
         }else if("checkExpert".equals(type)){//专家介绍
        	// returnUrl = "redirect:"+global_url+"wxUsers.action?expertOrder"; 
        	 returnUrl = "weixin/hy/checkExpert";
//        	 returnUrl = "redirect:"+global_url+"member.action?isregister&type=checkExpert";
         }else if("onLineClass".equals(type)){//在线课程
//        	 returnUrl = "redirect:"+global_url+"member.action?isregister&type=onLineClass";
        	 returnUrl = "weixin/hy/onLineClass";
         }else if("mySignLog".equals(type)){//报名记录
//        	 returnUrl = "weixin/hy/mySignLog";
        	 returnUrl = "redirect:"+global_url+"member.action?isregister&type=mySignLog&land=hy";
         }else if("callkf".equals(type)){//联系客服
        	 returnUrl = "weixin/kf/callkf";
         }else if("register".equals(type)){//注册
        	 returnUrl = "weixin/register/register";
        	// returnUrl = "redirect:"+global_url+"member.action?registerDetail";
         }else if("yyy".equals(type)){//摇一摇
        	 returnUrl = "weixin/shake/shake";
         }
         else if("videoClass".equals(type)){//点播课程
        	 returnUrl = "weixin/hy/videoClass";
//        	 returnUrl = "redirect:"+global_url+"member.action?isregister&type=videoClass";
         }else if("myCollectLog".equals(type)){//收藏记录
        	 //returnUrl = "weixin/hy/myCollectLog";
        	 returnUrl = "redirect:"+global_url+"member.action?isregister&type=myCollectLog&land=hy";
         }else if("yczx".equals(type)){//远程咨询
//        	 returnUrl = "weixin/hy/yczx";
        	 returnUrl = "redirect:"+global_url+"member.action?isregister&type=yczx&land=hy";
         }else if("email".equals(type)){//发送邮件
        	 returnUrl = "weixin/kf/email";
         }else if("orderList".equals(type)){//预约记录
        	 returnUrl = "redirect:"+global_url+"member.action?isregister&type=memberOrderList&land=hy";
         }else if("feedBack".equals(type)){//预约记录
//        	 returnUrl = "weixin/hy/feedbackList";
        	 returnUrl = "redirect:"+global_url+"member.action?isregister&type=feedbackList&land=hy";
         }else if("zjmemberOrder".equals(type)){
        	 returnUrl = "weixin/zj/memberOrder";
         }else if("orderExpert".equals(type)){//预约专家
        	 returnUrl="redirect:"+global_url+"member.action?isregister&type=addOrder&land=order";
         }else if("downloadApp".equals(type)){
        	 returnUrl="weixin/a.html";
         }else if("orderRecord".equals(type)){//我的预约
        	 returnUrl="redirect:"+global_url+"member.action?isregister&type=listOrderDoctor&land=order";
         }else if("info".equals(type)){
        	 returnUrl="redirect:"+global_url+"member.action?isregister&type=Info&land=register";
         }else if("mdm".equals(type)){//注册
        	 returnUrl = "weixin/huodong/ask";
          }
//         else if("zghd".equals(type)){//征稿活動
//        	 //returnUrl = "weixin/event/zhenggao";
//        	  returnUrl="redirect:"+global_url+"member.action?isregister&type=zhenggao&land=event";
//          }else if("vote".equals(type)){//投票
//        	 //returnUrl = "weixin/event/vote";
//        	  returnUrl="redirect:"+global_url+"eventvote.action?isvote&type=vote&land=event";
//          }else if("fzvode".equals(type)){
//        	  returnUrl="redirect:"+global_url+"eventgavote.action?isvote&type=vote&land=tp_fz";
//          }else if("fzvodebq".equals(type)){
//        	  returnUrl="redirect:"+global_url+"eventgavote.action?isvote&type=votebq&land=tp_fz";
//          }
		 HttpSession session = request.getSession(false);
        JSONObject customer = null;
        WxPublic us1 = null;
        if (session != null) {
            customer = (JSONObject) session.getAttribute("userInfo");
            us1 = (WxPublic) session.getAttribute("aboutUs");
            if (us1 != null && !us1.getPublicNo().equals(brandId)){
                session.setAttribute("userInfo",null);
                us1 = null;
            }
        }
        if (session == null || customer == null || us1 == null){
            session = request.getSession(true);
            Map queryMap = new HashMap();
            queryMap.put("publicNo",brandId);
            List<WxPublic> list = wxPublicDao.get(queryMap);
            if (list.size() > 0 ){
            	WxPublic us = list.get(0);
            	session.setAttribute("authReturnUrl",returnUrl);
                session.setAttribute("aboutUs",us);
                session.setMaxInactiveInterval(60*60);
                return new ModelAndView("redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid="+us.getAppId()+"&redirect_uri="+authUrl+"&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect",null);
            }else{
                return new ModelAndView("weixin/error",null);
            }
        }else{
            //如果session存在的情况下 就直接访问
            //根据客户的不同，确保进入对应的页面
            Map paraMap = new HashMap();
            paraMap.put("publicNo",brandId);
            return new ModelAndView(returnUrl,paraMap);
        }
	 }
	 
	 /**
	     * @title OA授权认证页面
	     * @return 返回要授权前要访问的页面
	     * */
	     @RequestMapping("/oauth")
	     public ModelAndView oauth(HttpServletRequest request){
	        String code = request.getParameter("code");
	        if(code == null || "authdeny".equals(code)){
	            return new ModelAndView("weixin/error",null);
	        }
	        HttpSession session = request.getSession(false);

	        JSONObject customer = null;
	        if (session != null) {
	            customer = (JSONObject)session.getAttribute("userInfo");
	            if (customer != null){
	                String returnUrl = (String)session.getAttribute("authReturnUrl");
	                return new ModelAndView(returnUrl,null);
	            }else{
	                if (code == null || "authdeny".equals(code)){
	                    return new ModelAndView("weixin/error",null);
	                }else{
	                    WxPublic us = (WxPublic) session.getAttribute("aboutUs");
	                    if(us != null){
	                        OAuth20 auth = new OAuth20(us.getAppId(),us.getAppSecret(),code);
	                        auth.getAccessToken();
	                        JSONObject object = auth.getUserInfo();
	                        String openid = object.getString("openid");
	                        if(openid == null || "".equals(openid)){
	                            return new ModelAndView("weixin/error",null);
	                        }

	                        Map queryMap = new HashMap();
	                        queryMap.put("openId",openid);
	                        List<Member> list = memberDao.get(queryMap);
	                        session.setAttribute("userInfo",object);
	                        if(list.size()>0){
 	                        	session.setAttribute("memberId",list.get(0).getId());
	                        	session.setAttribute("memberName",list.get(0).getName());
	                        	session.setAttribute("type",list.get(0).getType());
	                        }
	                        
	                        String returnUrl = (String)session.getAttribute("authReturnUrl");
	                        return new ModelAndView(returnUrl,null);
	                    }else {
	                        return new ModelAndView("weixin/error",null);
	                    }
	                }
	            }
	        }else{
	            return new ModelAndView("weixin/error",null);
	        }
	     }
	 
	 

	/**
	 * 向请求端发送返回数据
	 * @param content
	 */
	public void print(String content) {
		try {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(content);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (Exception e) {
		}
	}
	 
	/**
	 * 回复文本消息
	 * @param content
	 * @param openId
	 * @param wxId
	 * @return
	 */
	 public TextMessageRes replyText(String content,String openId,String wxId){
		 TextMessageRes  textMessage= new TextMessageRes();
         textMessage.setToUserName(openId);//接收方帐号（收到的OpenID）
         textMessage.setFromUserName(wxId);//开发者微信号
         textMessage.setCreateTime(new Date().getTime());//消息创建时间 （整型）
         textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
         textMessage.setContent(content);
         textMessage.setFuncFlag(0);
         return textMessage;
	 }
	 

	public static void main(String args[]) throws JSONException {
//		WxEventController ut=new WxEventController();
//      Map<String, String> paramMap = new HashMap<String, String>();
//      paramMap.put("location", "40.048809,116.297264");
//      paramMap.put("pois", "1");
//      paramMap.put("output", "json");
//		String suibian=ut.baidu("http://api.map.baidu.com/geocoder/v2/",paramMap);
//		JSONObject object=JSONObject.parseObject(suibian);
//		JSONArray jsonArray = new JSONArray(object.get("result").toString());
//    	int iSize = jsonArray.length();
//    	System.out.println(iSize);
		
	}

}
