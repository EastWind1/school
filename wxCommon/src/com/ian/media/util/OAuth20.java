package com.ian.media.util;

import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by Administrator on 2014/6/25.
 */
public class OAuth20 {
    private static String appId;
    private static String appSecret;
    private static String code;
    private static String accessToken;
    private static String openid;
    private static Logger log = LoggerFactory.getLogger(OAuth20.class);

    public OAuth20(String appId,String appSecret,String code){
        this.appId = appId;
        this.appSecret = appSecret;
        this.code = code;
    }


    public void getAccessToken(){
        JSONObject object =  WxPublicUtil.httpRequest("https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + appId + "&secret=" + appSecret + "&code=" + code + "&grant_type=authorization_code", "GET", "");
        if(object != null){
            String errmsg = object.getString("errmsg");
            if (null == errmsg){
                accessToken = object.getString("access_token");
                openid = object.getString("openid");
            }else {
                log.error("获取网页授权token失败 errcode:{} errmsg:{}", object.getInteger("errcode"), object.getString("errmsg"));
                accessToken = "";
            }
        }else {
            accessToken = "";
        }
    }
    
    /**
     * 企业号
     * @return
     */
    public void getQYAccessToken(){

        JSONObject object =  WxPublicUtil.httpRequest("https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=" + appId + "&corpsecret=" + appSecret, "GET", "");
        if(object != null){
            String errmsg = object.getString("errmsg");
            if (null == errmsg){
                accessToken = object.getString("access_token");
               // openid = object.getString("openid");
            }else {
                log.error("获取网页授权token失败 errcode:{} errmsg:{}", object.getInteger("errcode"), object.getString("errmsg"));
                accessToken = "";
            }
        }else {
            accessToken = "";
        }
    }
    
    /**
     * 企业号code
     */
//    public void getQYCode(){
//        JSONObject object =  WxPublicUtil.httpRequest("https://api.weixin.qq.com/sns/oauth2/access_token?corpid=" + appId + "&corpsecret=" + appSecret, "GET", "");
//        if(object != null){
//            String errmsg = object.getString("errmsg");
//            if (null == errmsg){
//                accessToken = object.getString("access_token");
//               // openid = object.getString("openid");
//            }else {
//                log.error("获取网页授权token失败 errcode:{} errmsg:{}", object.getInteger("errcode"), object.getString("errmsg"));
//                accessToken = "";
//            }
//        }else {
//            accessToken = "";
//        }
//    }
    
    
    public JSONObject getQYUserInfo(){
        JSONObject object =  WxPublicUtil.httpRequest("https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo?access_token="+accessToken+"&code="+code+"&lang=zh_CN", "GET", "");
        if(object != null){
            String errmsg = object.getString("errmsg");
            if (null == errmsg){
                return object;
            }else {
                log.error("获取用户信息失败 errcode:{} errmsg:{}", object.getInteger("errcode"), object.getString("errmsg"));
                accessToken = "";
                openid = object.getString("UserId");
                return new JSONObject();
            }
        }else{
            return new JSONObject();
        }
    }
    
    

    public JSONObject getUserInfo(){
        JSONObject object =  WxPublicUtil.httpRequest("https://api.weixin.qq.com/sns/userinfo?access_token="+accessToken+"&openid="+openid+"&lang=zh_CN", "GET", "");
        if(object != null){
            String errmsg = object.getString("errmsg");
            if (null == errmsg){
                return object;
            }else {
                log.error("获取用户信息失败 errcode:{} errmsg:{}", object.getInteger("errcode"), object.getString("errmsg"));
                accessToken = "";
                return new JSONObject();
            }
        }else{
            return new JSONObject();
        }
    }

}
