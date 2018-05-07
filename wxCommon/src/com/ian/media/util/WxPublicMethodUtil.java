package com.ian.media.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.protocol.Protocol;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONException;

import com.alibaba.fastjson.JSONObject;
import com.ian.media.dao.QRCodeInfoMapper;
import com.ian.media.dao.WxPublicMapper;
import com.ian.media.dao.WxUsersMapper;
import com.ian.media.model.QRCodeInfo;
import com.ian.media.model.WxPublic;
import com.ian.media.model.WxUsers;

public class WxPublicMethodUtil {
	private final static Log log = LogFactory.getLog(WxService.class);
	private Cookie[] cookies;
	private String cookiestr;
	private int loginErrCode;
	private String loginErrMsg;
	public boolean isLogin = false;
	public String token;
	
	private static WxPublicMapper wxPublicDao;
	private static WxUsersMapper wxUserDao;
	private static QRCodeInfoMapper qrCodeInfoDao;
	
	/**
	 * 客服接口——发消息
	 */
	public static Map<Object, Object> sendMsg(String body,String publicNo){
		Map<Object, Object> map=new HashMap<Object, Object>();
		String url=WxInterface.kf_send_msg;
		JSONObject jsonObject=httpRequest(url,"GET",body,publicNo);
		if(jsonObject != null){
			try {
				
			} catch (Exception e) {
				// TODO: handle exception
			
			}
		}
		
		return map;
	}
	
	
	/**
	 * 获取用户基本信息
	 */
	public static Map<Object, Object> getUserInfo(String openId,String publicNo){
		Map<Object, Object> map=new HashMap<Object, Object>();
		String url=WxInterface.get_user_info.replace("OPENID", openId);
		JSONObject jsonObject=httpRequest(url,"GET","",publicNo);
		if(jsonObject != null){
			try {
				WxUsers wxUser=new WxUsers();
				wxUser.setOpenId(openId);
				wxUser.setPublicNo(publicNo);
				wxUser.setNickName(jsonObject.getString("nickname"));
				wxUser.setSubscribe(jsonObject.getString("subscribe"));
				wxUser.setSex(jsonObject.getString("sex"));
				wxUser.setLanguage(jsonObject.getString("language"));
				wxUser.setCity(jsonObject.getString("city"));
				wxUser.setProvince(jsonObject.getString("province"));
				wxUser.setCountry(jsonObject.getString("country"));
				wxUser.setHeadImgurl(jsonObject.getString("headimgurl"));
				wxUser.setSubscribeTime(Time.long2Date(jsonObject.getInteger("subscribe_time") * 1000l));
				wxUser.setUnionid(jsonObject.getString("unionid"));
				wxUserDao.insertSelective(wxUser);
			} catch (Exception e) {
				// TODO: handle exception
			
			}
		}
		
		
		return map;
	}
	
	
	/**
	 * 调用公众平台接口
	 * @param requestUrl
	 * @param requestMethod
	 * @param outputStr
	 * @return
	 */
	public static JSONObject httpRequest(String httpUrl, String requestMethod, String outputStr,String publicNo) {  
		Map<Object, Object> map=new HashMap<Object, Object>();
        JSONObject jsonObject = null;  
        StringBuffer buffer = new StringBuffer();  
        try {  
        	//获取token
        	map=getAccessToken(publicNo);
        	if(map.get("success").equals(true)){
        		String token=(String) map.get("accessToken");
        		String requestUrl=httpUrl.replace("ACCESS_TOKEN", token);
        		// 创建SSLContext对象，并使用我们指定的信任管理器初始化  
                TrustManager[] tm = { new MyX509TrustManager() };  
                SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");  
                sslContext.init(null, tm, new java.security.SecureRandom());  
                // 从上述SSLContext对象中得到SSLSocketFactory对象  
                SSLSocketFactory ssf = sslContext.getSocketFactory();  
      
                URL url = new URL(requestUrl);  
                HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();  
                httpUrlConn.setSSLSocketFactory(ssf);  
      
                httpUrlConn.setDoOutput(true);  
                httpUrlConn.setDoInput(true);  
                httpUrlConn.setUseCaches(false);  
                // 设置请求方式（GET/POST）  
                httpUrlConn.setRequestMethod(requestMethod);  
      
                if ("GET".equalsIgnoreCase(requestMethod))  
                    httpUrlConn.connect();  
      
                // 当有数据需要提交时  
                if (null != outputStr) {  
                    OutputStream outputStream = httpUrlConn.getOutputStream();  
                    // 注意编码格式，防止中文乱码  
                    outputStream.write(outputStr.getBytes("UTF-8"));  
                    outputStream.close();  
                }  
      
                // 将返回的输入流转换成字符串  
                InputStream inputStream = httpUrlConn.getInputStream();  
                InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");  
                BufferedReader bufferedReader = new BufferedReader(inputStreamReader);  
      
                String str = null;  
                while ((str = bufferedReader.readLine()) != null) {  
                    buffer.append(str);  
                }  
                bufferedReader.close();  
                inputStreamReader.close();  
                // 释放资源  
                inputStream.close();  
                inputStream = null;  
                httpUrlConn.disconnect();  
                jsonObject = (JSONObject) JSONObject.parse(buffer.toString());
        	}else{
        		log.error("token获取失败");  
        	}
            
        } catch (ConnectException ce) {  
            log.error("服务器异常WxPublicUtil");  
        } catch (Exception e) {  
            log.error("服务器异常WxPublicUtil", e);  
        }
        return jsonObject;
    }
	
	/**
	 * 获取Token
	 * @param aboutUs
	 * @return
	 * @throws ParseException 
	 */
	public static Map<Object, Object> getAccessToken(String publicNo) {
		Map<Object, Object> map=new HashMap<Object, Object>();
		String accessToken="";
	    if (publicNo == null){
	    	map.put("msg", "微信公众号id为空");
        	map.put("success",false);
	    }else{
	    	Map<Object, Object> queryMap = new HashMap<Object, Object>();
			queryMap.put("publicNo", publicNo);
			List<WxPublic> list=wxPublicDao.get(queryMap);
	    	WxPublic wxPublic=new WxPublic();
	    	if(list.size()>0){
	    		wxPublic=list.get(0);
	    		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    	long sub = 0;
		        if (wxPublic.getTokenTime() == null || wxPublic.getTokenTime().equals("")){
		        	map=getTokenByUrl(wxPublic.getAppId(),wxPublic.getAppSecret(),wxPublic.getPublicNo());
		        }else {
		        	Date d1 = new Date();
	                Date d2 = null;
					try {
						d2 = df.parse(wxPublic.getTokenTime());
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	                long diff = d1.getTime() - d2.getTime();
	                sub = diff / 1000;
	                if (sub == 0 || sub > 7000){
	                	map=getTokenByUrl(wxPublic.getAppId(),wxPublic.getAppSecret(),wxPublic.getPublicNo());
	                }else{
	                	accessToken=wxPublic.getAccessToken();
	                	map.put("accessToken", accessToken);
	                	map.put("success",true);
	                }
		        }
	    	}else{
	    		map.put("msg", "没有找到公众号");
	        	map.put("success",false);
	    	}
	    }
	    return map;
	}
	
	/**
	 * 调用获取token接口
	 */
	public static Map<Object, Object> getTokenByUrl(String appId,String appSecret,String publicNo){
		Map<Object, Object> map=new HashMap<Object, Object>();
		map.put("success",true);
		String requestUrl = WxInterface.get_token.replace("APPID", appId).replace("APPSECRET", appSecret);
        JSONObject jsonObject = httpRequest(requestUrl, "GET", null);
        String accessToken="";
        // 如果请求成功
        if (jsonObject != null) {
        	accessToken = jsonObject.getString("access_token");
        	map.put("accessToken", accessToken);
        	map.put("success",true);
        }else {
        	map.put("msg", "调用微信接口，获取token失败");
        	map.put("success",false);
        }
        return map;
	}
	
	/**
	 * 接入
	 */
	public Map access(WxPublic paramT, HttpServletRequest request){
		Map loginMap =this.login(paramT.getLoginName(), paramT.getLoginPwd(), request);
		Map map=new HashMap();
        if((Boolean)loginMap.get("success")){
        	System.out.println(paramT.getUrl());
        	map=this.setURLAndToken(paramT.getUrl(), paramT.getWxToken(), request);
    		return map;
        }else{
            map.put("success",false);
            map.put("msg","登陆失败");
            return map;
        }
	}
	
	
	/**
	 * 微信功能平台模拟登录
	 */
	public  Map login(String username, String pwd, HttpServletRequest request) {
        Map returnMap = new HashMap();
		try {

			HttpSession session = request.getSession();
			String url =URLCollect.wx_login_url+"&pwd="+DigestUtils.md5Hex(pwd.getBytes())+"&username="+username;

			Protocol myhttps = new Protocol("https",
					new MySSLProtocolSocketFactory(), 443);
			Protocol.registerProtocol("https", myhttps);

			HttpClient client = new HttpClient();
			PostMethod getMethod = new PostMethod(url);
			getMethod.setRequestHeader("Referer", "https://mp.weixin.qq.com/");
			getMethod.setRequestHeader("Host", "mp.weixin.qq.com");
			client.executeMethod(getMethod);
			Cookie[] cookies = client.getState().getCookies();
			String returnStr = getMethod.getResponseBodyAsString();
			Map reutrnMap = (Map)JSONObject.parse(returnStr);

			Map retMap = (Map) reutrnMap.get("base_resp");

			if (Integer.valueOf(retMap.get("ret").toString()) == 302
					|| Integer.valueOf(retMap.get("ret").toString()) == 0) {

				this.cookies = client.getState().getCookies();

				StringBuffer cookie = new StringBuffer();
				for (Cookie c : client.getState().getCookies()) {
					cookie.append(c.getName()).append("=").append(c.getValue())
							.append(";");
				}
				this.cookiestr = cookie.toString();
				this.isLogin = true;
				this.token = getToken((String) reutrnMap.get("redirect_url"));

                System.out.println(this.cookiestr);
                System.out.println(this.token);
                request.getSession().setAttribute("token", this.token);
                request.getSession().setAttribute("cookie", this.cookiestr);
                returnMap.put("success",true);
                returnMap.put("msg","登陆成功");
                return returnMap;
			}else{
                int errCode =Integer.valueOf(retMap.get("ret").toString());
                this.loginErrCode = errCode;
                switch (errCode) {
                    case -1:
                        this.loginErrMsg = "系统错误";
                        break;
                    case -2:
                        this.loginErrMsg = "帐号或密码错误";
                        break;
                    case -23:
                        this.loginErrMsg = "密码错误";
                        break;
                    case -4:
                        this.loginErrMsg = "不存在该帐户";
                        break;
                    case -5:
                        this.loginErrMsg = "访问受限";
                        break;
                    case -6:
                        this.loginErrMsg = "需要输入验证码";
                        break;
                    case -7:
                        this.loginErrMsg = "此帐号已绑定私人微信号，不可用于公众平台登录";
                        break;
                    case -8:
                        this.loginErrMsg = "邮箱已存在";
                        break;
                    case -32:
                        this.loginErrMsg = "验证码输入错误";
                        break;
                    case -200:
                        this.loginErrMsg = "因频繁提交虚假资料，该帐号被拒绝登录";
                        break;
                    case -94:
                        this.loginErrMsg = "请使用邮箱登陆";
                        break;
                    case 10:
                        this.loginErrMsg = "该公众会议号已经过期，无法再登录使用";
                        break;
                    case 65201:
                    case 65202:
                        this.loginErrMsg = "成功登陆，正在跳转...";
                        break;
                    case 0:
                        this.loginErrMsg = "成功登陆，正在跳转...";
                        break;
                    default:
                        this.loginErrMsg = "未知的返回";
                        break;
                }

                returnMap.put("success",false);
                returnMap.put("msg",this.loginErrMsg);
                return returnMap;
            }

		} catch (Exception e) {
			e.printStackTrace();
            returnMap.put("success",false);
            returnMap.put("msg","服务器异常");
            return returnMap;
		}
	}
	
	
	/**
     * 调用http接口
     */
    public static String httpClient(String openid,String mac,String sn){
    	String success=null;
		try {
			HttpClient client = new HttpClient();
			PostMethod getMethod = new PostMethod("http://218.240.156.141:8888/setOpenID.jsp?sn="+sn+"&mac="+mac+"&openid="+openid+"");
			getMethod.setRequestHeader("Referer", "http://218.240.156.141/");
			getMethod.setRequestHeader("Host", "218.240.156.141");
			client.executeMethod(getMethod);
			String returnStr = getMethod.getResponseBodyAsString();
			Map returnMap = (Map)JSONObject.parse(returnStr);
			success=returnMap.get("success").toString();
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return success;
    }
	
	
	/**
	 * 解析Token
	 * @param s
	 * @return
	 */
	private String getToken(String s) {
		try {
			if (StringUtils.isBlank(s))
				return null;
			String[] ss = StringUtils.split(s, "?");
			String[] params = null;
			if (ss.length == 2) {
				if (!StringUtils.isBlank(ss[1]))
					params = StringUtils.split(ss[1], "&");
			} else if (ss.length == 1) {
				if (!StringUtils.isBlank(ss[0]) && ss[0].indexOf("&") != -1)
					params = StringUtils.split(ss[0], "&");
			} else {
				return null;
			}
			for (String param : params) {
				if (StringUtils.isBlank(param))
					continue;
				String[] p = StringUtils.split(param, "=");
				if (null != p && p.length == 2
						&& StringUtils.equalsIgnoreCase(p[0], "token"))
					return p[1];

			}
		} catch (Exception e) {
			String info = "【解析Token失败】【发生异常：" + e.getMessage() + "】";
			System.err.println(info);
			log.debug(info);
			log.info(info);
			return null;
		}
		return null;
	}
	
	/**
	 * 设置公众平台的服务器连接和token
	 * @param callback_url
	 * @param callback_token
	 * @param request
	 * @return
	 */
	public Map setURLAndToken(String callback_url,String callback_token,HttpServletRequest request){
        Map returnMap= new HashMap();
        try{
            HttpClient client = new HttpClient();
            HttpSession session = request.getSession();
            String token = (String)session.getAttribute("token");
            String cookie = (String)session.getAttribute("cookie");
            String url =  "https://mp.weixin.qq.com/advanced/callbackprofile";
            PostMethod post = new PostMethod(url);
            client.getParams().setCookiePolicy(CookiePolicy.BROWSER_COMPATIBILITY);
            post.setRequestHeader("Referer","https://mp.weixin.qq.com/");
            post.setRequestHeader("Host", "mp.weixin.qq.com");

            NameValuePair[] params = new NameValuePair[]{
                    new NameValuePair("t","ajax-response"),
                    new NameValuePair("token",token),
                    new NameValuePair("lang","zh_CN"),
                    new NameValuePair("url",callback_url),
                    new NameValuePair("callback_token",callback_token)
            };

            Protocol myhttps = new Protocol("https",
                    new MySSLProtocolSocketFactory(), 443);
            Protocol.registerProtocol("https", myhttps);
            post.setQueryString(params);
            post.setRequestHeader("cookie", cookie);

            int status;
            status = client.executeMethod(post);
            if (status == HttpStatus.SC_OK) {
                String text = post.getResponseBodyAsString();
                Map map = (Map)JSONObject.parse(text);
                String ret = (String) map.get("ret");
                if(Integer.parseInt(ret) == 0){
                    returnMap.put("success",true);
                    returnMap.put("msg","设置成功");
                }else{
                    returnMap.put("success",false);
                    returnMap.put("msg","参数错误");
                }
            }
            return returnMap;
        }catch (Exception e){
            e.printStackTrace();
            return returnMap;
        }

    }
	
	public static JSONObject qyhttpRequest(String httpUrl, String requestMethod, String outputStr,String token) {  
		Map<Object, Object> map=new HashMap<Object, Object>();
        JSONObject jsonObject = null;  
        StringBuffer buffer = new StringBuffer();  
        try {  
        	//获取token
        		String requestUrl=httpUrl;
        		// 创建SSLContext对象，并使用我们指定的信任管理器初始化  
                TrustManager[] tm = { new MyX509TrustManager() };  
                SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");  
                sslContext.init(null, tm, new java.security.SecureRandom());  
                // 从上述SSLContext对象中得到SSLSocketFactory对象  
                SSLSocketFactory ssf = sslContext.getSocketFactory();  
      
                URL url = new URL(requestUrl);  
                HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();  
                httpUrlConn.setSSLSocketFactory(ssf);  
      
                httpUrlConn.setDoOutput(true);  
                httpUrlConn.setDoInput(true);  
                httpUrlConn.setUseCaches(false);  
                // 设置请求方式（GET/POST）  
                httpUrlConn.setRequestMethod(requestMethod);  
      
                if ("GET".equalsIgnoreCase(requestMethod))  
                    httpUrlConn.connect();  
      
                // 当有数据需要提交时  
                if (null != outputStr) {  
                    OutputStream outputStream = httpUrlConn.getOutputStream();  
                    // 注意编码格式，防止中文乱码  
                    outputStream.write(outputStr.getBytes("UTF-8"));  
                    outputStream.close();  
                }  
      
                // 将返回的输入流转换成字符串  
                InputStream inputStream = httpUrlConn.getInputStream();  
                InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");  
                BufferedReader bufferedReader = new BufferedReader(inputStreamReader);  
      
                String str = null;  
                while ((str = bufferedReader.readLine()) != null) {  
                    buffer.append(str);  
                }  
                bufferedReader.close();  
                inputStreamReader.close();  
                // 释放资源  
                inputStream.close();  
                inputStream = null;  
                httpUrlConn.disconnect();  
                jsonObject = (JSONObject) JSONObject.parse(buffer.toString());
        } catch (ConnectException ce) {  
            log.error("服务器异常WxPublicUtil");  
        } catch (Exception e) {  
            log.error("服务器异常WxPublicUtil", e);  
        }
        return jsonObject;
    }
	
	
	public static JSONObject httpRequest(String requestUrl, String requestMethod, String outputStr) {
        JSONObject jsonObject = null;
        StringBuffer buffer = new StringBuffer();
        try {
            // 创建SSLContext对象，并使用我们指定的信任管理器初始化  
            TrustManager[] tm = { new MyX509TrustManager() };
            SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
            sslContext.init(null, tm, new java.security.SecureRandom());
            // 从上述SSLContext对象中得到SSLSocketFactory对象  
            SSLSocketFactory ssf = sslContext.getSocketFactory();

            URL url = new URL(requestUrl);
            HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();
            httpUrlConn.setSSLSocketFactory(ssf);

            httpUrlConn.setDoOutput(true);
            httpUrlConn.setDoInput(true);
            httpUrlConn.setUseCaches(false);
            // 设置请求方式（GET/POST）  
            httpUrlConn.setRequestMethod(requestMethod);

            if ("GET".equalsIgnoreCase(requestMethod))
                httpUrlConn.connect();

            // 当有数据需要提交时  
            if (null != outputStr) {
                OutputStream outputStream = httpUrlConn.getOutputStream();
                // 注意编码格式，防止中文乱码  
                outputStream.write(outputStr.getBytes("UTF-8"));
                outputStream.close();
            }

            // 将返回的输入流转换成字符串  
            InputStream inputStream = httpUrlConn.getInputStream();
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

            String str = null;
            while ((str = bufferedReader.readLine()) != null) {
                buffer.append(str);
            }
            bufferedReader.close();
            inputStreamReader.close();
            // 释放资源  
            inputStream.close();
            inputStream = null;
            httpUrlConn.disconnect();
            jsonObject = (JSONObject) JSONObject.parse(buffer.toString());
        } catch (ConnectException ce) {
            log.error("Weixin server connection timed out.");
        } catch (Exception e) {
            log.error("https request error:{}", e);
        }
        return jsonObject;
    }

	public static Map addFromWXWithSceneId(QRCodeInfo paramT){
		Map<Object, Object> map = new HashMap<Object, Object>();
        try {
            paramT.setPkid(IDGenerator.getID());
            int type =paramT.getType();
            String ticket = "";
            if (type == 1){
                ticket = WxPublicUtil.getTicket(paramT.getSceneId(),"1800",paramT.getField1());
            }else if (type == 2){
                ticket = getTicket(paramT.getSceneId(),"",paramT.getField1());
            }
            paramT.setField2(ticket);
            map.put("ticket",ticket);
            paramT.setCreateTime(Time.nowDateToString());
            qrCodeInfoDao.insertSelective(paramT);

        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg", "添加失败");
            map.put("success", false);
            return map;
        }
        map.put("msg", "添加成功");
        map.put("success", true);
        return map;
	}
	
	public static String getTicket(String sceneId,String expireSeconds,String publicNo){
        Map map = new HashMap();
        map.put("pkid",publicNo);
        List<WxPublic> list = wxPublicDao.get(map);
        String token = null;
        String ticket = null;
        if (list.size() > 0 ){
        	WxPublicUtil.setWxPublicDao(wxPublicDao);
        	map=WxPublicUtil.getAccessToken(publicNo);
            token =(String) map.get("accessToken");
        }
        if (null == expireSeconds || expireSeconds.equals("")){
            ticket = CreateQRCode.createPermanentQRCodeString(token, sceneId,publicNo);
        }else {
            ticket = CreateQRCode.createTemporaryQRCode(token,Integer.parseInt(expireSeconds),Long.parseLong(sceneId),publicNo);
        }
        return ticket;
    }
	
	 public static void qysendMessage(String content){
        String accessToken = "83sbq4k6abvJif2NW0-F8fgoiUJKorGuX4slmfHxjYtwkLMd7ADa3ZTjeNwbAbiJ0LI2hwnfjGDQ2Xigd-lxgQ";
        String url = WxInterface.qy_send_message_url.replace("ACCESS_TOKEN", accessToken);
        JSONObject jsonObject = httpRequest(url, "POST", content);
    }
	 
	 
	 public static String getMedia(String publicNo,String mediaId,String savePath) {
		 	String imgName=null;
		 	Map map = new HashMap();
			 map=WxPublicUtil.getAccessToken(publicNo);
	        String accessToken =(String) map.get("accessToken");
			String filePath=null;
			String requestUrl=WxInterface.DOWNLOAD_MEDIA_URL.replace("ACCESS_TOKEN", 
					accessToken).replace("MEDIA_ID", mediaId);
			try {
				URL url=new URL(requestUrl);
				HttpURLConnection conn=(HttpURLConnection)url.openConnection();
				conn.setDoInput(true);
				conn.setRequestMethod("GET");
				if (!savePath.endsWith("/")) {
					savePath +="/";
				}
				// 根据内容类型获取扩展名
				String fileExt=getFileExt(conn.getHeaderField("Content-Type"));
				// 将mediaId作为文件名
				imgName=mediaId+fileExt;
				filePath = savePath+mediaId+fileExt;
				
				BufferedInputStream bis=new BufferedInputStream(conn.getInputStream());
				FileOutputStream fos=new FileOutputStream(new File(filePath));
				byte[] buf=new byte[8096];
				int size=0;
				while ((size=bis.read(buf))!=-1) {
					fos.write(buf,0,size);
				}
				
				fos.close();
				bis.close();
				
				conn.disconnect();
				log.info("下载媒体文件成功,filePath="+filePath);
			} catch (Exception e) {
				filePath=null;
				log.error("下载媒体文件失败:{}",e);
			}
			return imgName;
		}
	 
	 public static String getMediaUplod(String publicNo,String mediaId,String savePath) {
		 	String imgName=null;
		 	Map map = new HashMap();
			 map=WxPublicUtil.getAccessToken(publicNo);
	        String accessToken =(String) map.get("accessToken");
			String filePath=null;
			String requestUrl=WxInterface.DOWNLOAD_MEDIA_URL.replace("ACCESS_TOKEN", 
					accessToken).replace("MEDIA_ID", mediaId);
			try {
				URL url=new URL(requestUrl);
				HttpURLConnection conn=(HttpURLConnection)url.openConnection();
				conn.setDoInput(true);
				conn.setRequestMethod("GET");
				if (!savePath.endsWith("/")) {
					savePath +="/";
				}
				// 根据内容类型获取扩展名
				String fileExt=getFileExt(conn.getHeaderField("Content-Type"));
				// 将mediaId作为文件名
				imgName=IDGenerator.getID()+fileExt;
				filePath = savePath+imgName;
				
				BufferedInputStream bis=new BufferedInputStream(conn.getInputStream());
				FileOutputStream fos=new FileOutputStream(new File(filePath));
				byte[] buf=new byte[8096];
				int size=0;
				while ((size=bis.read(buf))!=-1) {
					fos.write(buf,0,size);
				}
				
				fos.close();
				bis.close();
				
				conn.disconnect();
				log.info("下载媒体文件成功,filePath="+filePath);
			} catch (Exception e) {
				filePath=null;
				log.error("下载媒体文件失败:{}",e);
			}
			return imgName;
		}
	
	
	 public static String getFileExt(String contentType) {
			String fileExt="";
			if ("image/jpeg".equals(contentType)) {
				fileExt=".jpg";
			}else if ("audio/mpeg".equals(contentType)) {
				fileExt=".mp3";
			}else if ("audio/amr".equals(contentType)) {
				fileExt=".amr";
			}else if ("video/mp4".equals(contentType)) {
				fileExt=".mp4";
			}else if ("video/mpeg4".equals(contentType)) {
				fileExt=".mp4";
			}
			return fileExt;
		}

	public Cookie[] getCookies() {
		return cookies;
	}

	public void setCookies(Cookie[] cookies) {
		this.cookies = cookies;
	}

	public String getCookiestr() {
		return cookiestr;
	}

	public void setCookiestr(String cookiestr) {
		this.cookiestr = cookiestr;
	}

	public int getLoginErrCode() {
		return loginErrCode;
	}

	public void setLoginErrCode(int loginErrCode) {
		this.loginErrCode = loginErrCode;
	}

	public String getLoginErrMsg() {
		return loginErrMsg;
	}

	public void setLoginErrMsg(String loginErrMsg) {
		this.loginErrMsg = loginErrMsg;
	}

	public boolean isLogin() {
		return isLogin;
	}

	public void setLogin(boolean isLogin) {
		this.isLogin = isLogin;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public static WxPublicMapper getWxPublicDao() {
		return wxPublicDao;
	}
	public static void setWxPublicDao(WxPublicMapper wxPublicDao) {
		WxPublicMethodUtil.wxPublicDao = wxPublicDao;
	}

	public static WxUsersMapper getWxUserDao() {
		return wxUserDao;
	}

	public static void setWxUserDao(WxUsersMapper wxUserDao) {
		WxPublicMethodUtil.wxUserDao = wxUserDao;
	}


	public static QRCodeInfoMapper getQrCodeInfoDao() {
		return qrCodeInfoDao;
	}


	public static void setQrCodeInfoDao(QRCodeInfoMapper qrCodeInfoDao) {
		WxPublicMethodUtil.qrCodeInfoDao = qrCodeInfoDao;
	}
	
}
