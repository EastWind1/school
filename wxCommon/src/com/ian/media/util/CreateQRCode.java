package com.ian.media.util;

import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
*
* 项目名称：wechatapi
* 类名称：CreateQRCode
* 类描述：创建二维码工具
* 创建人：Myna Wang
* 创建时间：2014-3-7 下午3:35:29
* @version
*/
public class CreateQRCode{

    private static Logger log = LoggerFactory.getLogger(CreateQRCode.class);
    private final static String TEMPORARY_QRCODE_URL = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=TOKEN";
    private final static String PERMANENT_QRCODE_URL = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=TOKEN";

	/**
	 * 创建临时带参数二维码
	 *
	 * @param accessToken 接口访问凭证
	 * @param expireSeconds 二维码的有效时间，以秒为单位，最大不超过1800秒
	 * @param sceneId 场景值ID，临时二维码时为32位非0整型，永久二维码时最大值为100000（目前参数只支持1--100000）
	 * @return WeixinQRCode
	 */
	public static String createTemporaryQRCode(String accessToken,
			int expireSeconds,Long sceneId,String publicNo) {
        System.out.println("accessToken"+accessToken);
		String requestUrl=TEMPORARY_QRCODE_URL.replace("TOKEN", accessToken);
        System.out.println(requestUrl);
		// 需要提交的json数据
		String jsonMsg="{\"expire_seconds\": %d,\"action_name\": \"QR_SCENE\"," +
				"\"action_info\": {\"scene\": {\"scene_id\": %d}}}";
        System.out.println(String.format(jsonMsg, expireSeconds, sceneId));
		// 创建临时带参数二维码
		JSONObject jsonObject = WxPublicUtil.httpRequest(requestUrl, "POST",
				String.format(jsonMsg, expireSeconds, sceneId),publicNo);
        String ticket =null;

        if (null!=jsonObject) {
			try {
                System.out.println(jsonObject);
                ticket = jsonObject.getString("ticket");
			    int expire_seconds = jsonObject.getInteger("expire_seconds");

				log.info("创建临时带参数二维码成功 ticket:{} expire_seconds:{}",
                        ticket,expire_seconds);
			} catch (Exception e) {

				int errorCode=jsonObject.getInteger("errcode");
				String errorMsg=jsonObject.getString("errmsg");
				log.error("创建临时带参数二维码失败 errCode:{} errormsg:{} ",errorCode,errorMsg);
			}
		}
		return ticket;
	}


	/**
	 * 创建永久带参数二维码
	 *
	 * @param accessToken 接口访问凭证
	 * @param sceneId 场景值ID，临时二维码时为32位非0整型，永久二维码时最大值为100000（目前参数只支持1--100000）
	 * @return String
	 */
	public static String createPermanentQRCode(String accessToken,Long sceneId,String publicNo) {
		String ticket=null;
		String requestUrl=PERMANENT_QRCODE_URL.replace("TOKEN", accessToken);
		// 需要提交的json数据
		String jsonMsg="{\"action_name\": \"QR_LIMIT_SCENE\",\"action_info\": {\"scene\": {\"scene_id\": %d}}}";
		// 创建临时带参数二维码
		JSONObject jsonObject = WxPublicUtil.httpRequest(requestUrl, "POST",String.format(jsonMsg , sceneId),publicNo);
		if (null!=jsonObject) {
			try {
				ticket=jsonObject.getString("ticket");
				log.info("创建永久带参数二维码成功 ticket:{}",ticket);
			} catch (Exception e) {
				int errorCode=jsonObject.getInteger("errcode");
				String errorMsg=jsonObject.getString("errmsg");
				log.error("创建永久带参数二维码失败 errCode:{} errormsg:{} ",errorCode,errorMsg);
			}
		}
		return ticket;
	}
	public static String createPermanentQRCodeString(String accessToken,String sceneId,String publicNo) {
		String ticket=null;
		String requestUrl=PERMANENT_QRCODE_URL.replace("TOKEN", accessToken);
		// 需要提交的json数据
		String jsonMsg="{\"action_name\": \"QR_LIMIT_STR_SCENE\",\"action_info\": {\"scene\": {\"scene_str\": \""+sceneId+"\"}}}";
		// 创建临时带参数二维码
		JSONObject jsonObject = WxPublicUtil.httpRequest(requestUrl, "POST",jsonMsg,publicNo);
		if (null!=jsonObject) {
			try {
				ticket=jsonObject.getString("ticket");
				log.info("创建永久带参数二维码成功 ticket:{}",ticket);
			} catch (Exception e) {
				int errorCode=jsonObject.getInteger("errcode");
				String errorMsg=jsonObject.getString("errmsg");
				log.error("创建永久带参数二维码失败 errCode:{} errormsg:{} ",errorCode,errorMsg);
			}
		}
		return ticket;
	}

}
