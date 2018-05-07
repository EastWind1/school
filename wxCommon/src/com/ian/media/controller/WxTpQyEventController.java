package com.ian.media.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpClientParams;
import org.apache.commons.httpclient.util.URIUtil;
import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.json.JSONArray;
import org.json.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.ian.media.dao.InformationMapper;
import com.ian.media.dao.MemberMapper;
import com.ian.media.dao.WxPublicMapper;
import com.ian.media.dao.WxSignatureMapper;
import com.ian.media.dao.WxUsersMapper;
import com.ian.media.model.Information;
import com.ian.media.model.Member;
import com.ian.media.model.WxPublic;
import com.ian.media.model.WxSignature;
import com.ian.media.model.WxUsers;
import com.ian.media.util.IDGenerator;
import com.ian.media.util.MD5;
import com.ian.media.util.OAuth20;
import com.ian.media.util.Time;
import com.ian.media.util.ToolUtil;
import com.ian.media.util.SignUtil;
import com.ian.media.util.MessageUtil;
import com.ian.media.util.WxPublicMethodUtil;
import com.ian.media.util.WxPublicUtil;
import com.ian.media.util.qyOAuth20;
import com.ian.media.model.res.Article;
import com.ian.media.model.res.NewsMessageRes;
import com.ian.media.model.res.TextMessageRes;

import java.io.StringReader;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import javax.xml.parsers.DocumentBuilderFactory;

@Controller("wxTpQyEvenAction")
@Scope("prototype")
@RequestMapping("/wxTpQyEven")
public class WxTpQyEventController extends BaseController<WxPublic> {
	 public WxPublicMapper wxPublicDao; 
	 public WxUsersMapper wxUserDao;
	 public WxSignatureMapper wxSignatureDao;
	 public InformationMapper informationDao;
	 public MemberMapper memberDao;
	 String global_url=null;
//	 private String latitude;//地理位置纬度
//	 private String longitude;//地理位置经度
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
	
	public static void main(String[] args) throws Exception {
		
	}
	
	
	@RequestMapping("/receive")
	@ResponseBody
	public void receive(HttpServletRequest request,HttpServletResponse res,HttpSession session) throws IOException{
		response = res;
		String token = "";
		
		String sToken = "wxQyEven";
		String sCorpID = "wx6e78943256c7645f";
		String sEncodingAESKey = "141pAOdhZErOzbNsxkVasXdq3DTwS57OGhcnt8K9V1x";
	
		
		/*
		------------使用示例一：验证回调URL---------------
		*企业开启回调模式时，企业号会向验证url发送一个get请求 
		假设点击验证时，企业收到类似请求：
		* GET /cgi-bin/wxpush?msg_signature=5c45ff5e21c57e6ad56bac8758b79b1d9ac89fd3&timestamp=1409659589&nonce=263014780&echostr=P9nAzCzyDtyTWESHep1vC5X9xho%2FqYX3Zpb4yKa9SKld1DsH3Iyt3tP3zNdtp%2B4RPcs8TgAE7OaBO%2BFZXvnaqQ%3D%3D 
		* HTTP/1.1 Host: qy.weixin.qq.com

		接收到该请求时，企业应		1.解析出Get请求的参数，包括消息体签名(msg_signature)，时间戳(timestamp)，随机数字串(nonce)以及公众平台推送过来的随机加密字符串(echostr),
		这一步注意作URL解码。
		2.验证消息体签名的正确性 
		3. 解密出echostr原文，将原文当作Get请求的response，返回给公众平台
		第2，3步可以用公众平台提供的库函数VerifyURL来实现。

		*/
		// 解析出url上的参数值如下：
//		 String sVerifyMsgSig = HttpUtils.ParseUrl("msg_signature");
//		String sVerifyMsgSig = "5c45ff5e21c57e6ad56bac8758b79b1d9ac89fd3";
//		// String sVerifyTimeStamp = HttpUtils.ParseUrl("timestamp");
//		String sVerifyTimeStamp = "1409659589";
//		// String sVerifyNonce = HttpUtils.ParseUrl("nonce");
//		String sVerifyNonce = "263014780";
//		// String sVerifyEchoStr = HttpUtils.ParseUrl("echostr");
//		String sVerifyEchoStr = "P9nAzCzyDtyTWESHep1vC5X9xho/qYX3Zpb4yKa9SKld1DsH3Iyt3tP3zNdtp+4RPcs8TgAE7OaBO+FZXvnaqQ==";
		
		String sVerifyMsgSig = request.getParameter("msg_signature");
		String sVerifyTimeStamp = request.getParameter("timestamp");
		String sVerifyNonce = request.getParameter("nonce");
		String sVerifyEchoStr = request.getParameter("echostr");
		String sEchoStr; //需要返回的明文
		try {
			if (null == sVerifyEchoStr || sVerifyEchoStr.isEmpty()) {
				String respMessage = this.processRequest(request,session);
				 if (!respMessage.equals("")){ 
	            	//事件返回的结果不是空的时候，则调用print将结果返回到微信
	            	this.print(respMessage);
	            }
			}else{
				WXBizMsgCrypt wxcpt = new WXBizMsgCrypt(sToken, sEncodingAESKey, sCorpID);
				sEchoStr = wxcpt.VerifyURL(sVerifyMsgSig, sVerifyTimeStamp,
						sVerifyNonce, sVerifyEchoStr);
				// 验证URL成功，将sEchoStr返回
//				 HttpUtils.SetResponse(sEchoStr);
				this.print(sEchoStr);
			}
			
		} catch (Exception e) {
			//验证URL失败，错误原因请查看异常
			e.printStackTrace();
		}

	
		
		//接入服务器时，成为开发者echostr是随机字符串，接入之后的事件echostr为null
//		if (null == echostr || echostr.isEmpty()) {
//			//processRequest事件处理方法，将事件需要返回的结果组成字符串
//			String respMessage = this.processRequest(request,session);
//            if (!respMessage.equals("")){ 
//            	//事件返回的结果不是空的时候，则调用print将结果返回到微信
//            	this.print(respMessage);
//            }
//		} else {
//			if (SignUtil.check(request, response ,"weixinreceive")) {
//				this.print(echostr);
//			} else {
//				this.print("error");
//			}
//		}
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
				 String event = requestMap.get("Event");//事件类型
				 /**
				  * 关注事件
				  */
				 if(event.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)){
//					 String content="你好，谢谢关注，<a href=\"http://www.baidu.com\">点击上网</a>";
//					 textMessage=this.replyText(content, openId, wxId);
//					 respMessage = MessageUtil.textMessageToXml(textMessage);
					 String eventKey=requestMap.get("EventKey");
					 WxUsers paramT=new WxUsers();
					 if(eventKey != null && !eventKey.equals("")){
						 String params=eventKey.split("_")[1];
						 String hy=eventKey.split("_")[2];
						 if(hy.equals("hy")){
							 Member member=new Member();
			        		member.setId(params);
			        		member.setOpenId(openId);
			        		memberDao.updateByPrimaryKeySelective(member);
							 String contentmsg="绑定成功！";
							 textMessage=this.replyText(contentmsg, openId, wxId);
							 respMessage = MessageUtil.textMessageToXml(textMessage);
						 }else{
							 paramT.setUserId(params);
							 paramT.setFiled1("2");
							 String contentmsg="你已成为专家！";
							 textMessage=this.replyText(contentmsg, openId, wxId);
							 respMessage = MessageUtil.textMessageToXml(textMessage);
						 }
					 }
					 
					 Map userMap=new HashMap();
					 userMap.put("openId", openId);
					 List<WxUsers> listUser=wxUserDao.get(userMap);
					 if(listUser != null && listUser.size()>0){
						 
						 paramT.setOpenId(openId);
						 paramT.setSubscribe("1");
						 wxUserDao.updateByPrimaryKeySelective(paramT);
					 }else{
						 WxPublicMethodUtil.setWxPublicDao(wxPublicDao);
						 WxPublicMethodUtil.setWxUserDao(wxUserDao);
						 WxPublicMethodUtil.getUserInfo(openId, "gh_8d5f9c073de7");
					 }
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
					 String ticket=requestMap.get("Ticket");
					 String params=eventKey.split("_")[0];
					 String params1=eventKey.split("_")[1];
					 if(eventKey.equals("yyy")){
						 return event(openId,wxId,"摇一摇",global_url+"weixin/images/yyy.jpg",global_url+"weixin/shake/shake.html?openid="+openId+"&brandId="+wxId);
					 }if(params1.equals("hy")){
						 Member member=new Member();
			        		member.setId(params);
			        		member.setOpenId(openId);
			        		memberDao.updateByPrimaryKeySelective(member);
							 String contentmsg="绑定成功！";
							 textMessage=this.replyText(contentmsg, openId, wxId);
							 respMessage = MessageUtil.textMessageToXml(textMessage);
					 }else{
						 WxUsers paramT=new WxUsers();
						 paramT.setOpenId(openId);
						 paramT.setUserId(eventKey);
						 paramT.setFiled1("2");
						 wxUserDao.updateByPrimaryKeySelective(paramT);
						 String contentmsg="你已成为专家！";
						 textMessage=this.replyText(contentmsg, openId, wxId);
						 respMessage = MessageUtil.textMessageToXml(textMessage);
					 }
				 }
				 
				 /**
				  * 上报地理位置
				  */
				 else if(event.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)){
					 String latitude=requestMap.get("Latitude");
					 String longitude=requestMap.get("Longitude");
					 Map map = new HashMap();
					 map.put("username", openId);
					
					 
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
		 	NewsMessageRes newsMessage = new NewsMessageRes();
	        newsMessage.setToUserName(fromUserName);
	        newsMessage.setFromUserName(toUserName);
	        newsMessage.setCreateTime(new Date().getTime());
	        newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
	        newsMessage.setFuncFlag(0);
	        List articleList  = new ArrayList();
	        Article article = new Article();
	        article.setTitle("APP下载");
	        article.setDescription("");
	        article.setPicUrl(global_url+"weixin/images/app.jpg");
	        article.setUrl(global_url+"a.html?type=0");
	        articleList.add(article);
	        
	        Article article1 = new Article();
	        article1.setTitle("APP使用帮助");
	        article1.setDescription("");
	        article1.setPicUrl(global_url+"weixin/images/app.jpg");
	        article1.setUrl("");
	        articleList.add(article1);
	        
	        Article article2 = new Article();
	        article2.setTitle("预约专家");
	        article2.setDescription("");
	        article2.setPicUrl(global_url+"weixin/images/app.jpg");
	        article2.setUrl("");
	        articleList.add(article2);
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
//	        article.setUrl(url);
	        articleList.add(article);
	        Article article1 = new Article();
	        article1.setTitle("客服邮箱：4008554120@yunicu.com");
	        article1.setDescription("");
	        article1.setUrl(global_url+"weixin/kf/email.jsp");
	        article1.setPicUrl(global_url+"weixin/images/email.png");
//	        article1.setUrl(url);
	        articleList.add(article1);
	        // 设置图文消息个数
	        newsMessage.setArticleCount(articleList.size());
	        // 设置图文消息包含的图文集合
	        newsMessage.setArticles(articleList);
	        // 将图文消息对象转换成xml字符串
	        return MessageUtil.newsMessageToXml(newsMessage);
	    }
	 
	 
	 public String eventgz(String fromUserName,String toUserName,String title,String picUrl ,String url){
	    	NewsMessageRes newsMessage = new NewsMessageRes();
	        newsMessage.setToUserName(fromUserName);
	        newsMessage.setFromUserName(toUserName);
	        newsMessage.setCreateTime(new Date().getTime());
	        newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
	        newsMessage.setFuncFlag(0);
	        List articleList  = new ArrayList();
	        Article article = new Article();
	        article.setTitle("欢迎关注云ICU微信公众平台，点击下方菜单，我们将为你提供更多服务。");
	        article.setDescription("");
	        article.setPicUrl(global_url+"weixin/images/zb.jpg");
//	        article.setUrl(url);
	        articleList.add(article);
	        
	        Article article3 = new Article();
	        article3.setTitle("我要注册");
	        article3.setDescription("");
	        article3.setUrl(global_url+"wxEven/auth.action?brandId="+toUserName+"&type=register");
	        article3.setPicUrl(global_url+"weixin/images/register.png");
	        articleList.add(article3);
	        
	        Article article1 = new Article();
	        article1.setTitle("上午12点摇一摇活动正式开启，赢小米移动电源哦~");
	        article1.setDescription("");
	        article1.setUrl(global_url+"weixin/shake/shake.html?openid="+fromUserName+"&brandId="+toUserName);
	        article1.setPicUrl(global_url+"weixin/images/yyy.jpg");
	        articleList.add(article1);
	        
	        Article article4 = new Article();
	        article4.setTitle("远程视频APP下载");
	        article4.setDescription("");
	        article4.setUrl(global_url+"a.html?type=0");
	        article4.setPicUrl(global_url+"weixin/images/app.jpg");
	        articleList.add(article4);
	        
			 
	        Article article2 = new Article();
	        article2.setTitle("客服邮箱：4008554120@yunicu.com");
	        article2.setDescription("");
	        article2.setUrl(global_url+"wxEven/auth.action?brandId="+toUserName+"&type=email");
	        article2.setPicUrl(global_url+"weixin/images/email.png");
	        articleList.add(article2);
	        
	        
	        
	        
	        
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
        String authUrl = global_url+"wxQyEven/oauth.action";
		 if ("new".equals(type)) {//新闻资讯
            returnUrl = "weixin/zx/news";   
         }else if("zjorder".equals(type)) {//新闻资讯
            returnUrl = "weixin/zj/memberOrder";   
         }else if("status".equals(type)) {//新闻资讯
            returnUrl = "weixin/zj/setStatus";   
         }
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
                return new ModelAndView("redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxe293e305cbac2df4&redirect_uri="+authUrl+"&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect",null);
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
	                        qyOAuth20 auth = new qyOAuth20(us.getAppId(),us.getAppSecret(),code);
	                        auth.getQYAccessToken();
	                        JSONObject object = auth.getQYUserInfo();
	                        String openid = object.getString("UserId");
	                        if(openid == null || "".equals(openid)){
	                            return new ModelAndView("weixin/error",null);
	                        }


	                        Map queryMap = new HashMap();
	                        queryMap.put("openId",openid);
	                        List<WxUsers> list = wxUserDao.get(queryMap);

	                     

	                        session.setAttribute("userInfo",object);
	                        //session.setAttribute("userType",list.get(0).getFiled1());
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
	 

//	public static void main(String args[]) throws JSONException {
////		WxEventController ut=new WxEventController();
////      Map<String, String> paramMap = new HashMap<String, String>();
////      paramMap.put("location", "40.048809,116.297264");
////      paramMap.put("pois", "1");
////      paramMap.put("output", "json");
////		String suibian=ut.baidu("http://api.map.baidu.com/geocoder/v2/",paramMap);
////		JSONObject object=JSONObject.parseObject(suibian);
////		JSONArray jsonArray = new JSONArray(object.get("result").toString());
////    	int iSize = jsonArray.length();
////    	System.out.println(iSize);
//		
//	}

}
