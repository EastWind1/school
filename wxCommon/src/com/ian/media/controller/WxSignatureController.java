package com.ian.media.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Connection.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ian.media.util.CreateQRCode;
import com.ian.media.util.IDGenerator;
import com.ian.media.util.Time;
import com.ian.media.util.ToolUtil;
import com.ian.media.util.SignUtil;
import com.ian.media.util.MessageUtil;
import com.ian.media.util.WxPublicUtil;
import com.ian.media.dao.QRCodeInfoMapper;
import com.ian.media.dao.WxPublicMapper;
import com.ian.media.dao.WxSignatureMapper;
import com.ian.media.model.QRCodeInfo;
import com.ian.media.model.WxPublic;
import com.ian.media.model.WxSignature;
import com.ian.media.model.res.TextMessageRes;

@Controller("wxSignatureAction")
@Scope("prototype")
@RequestMapping("/wxSignature")
public class WxSignatureController extends BaseController<WxSignature> {
	 public WxSignatureMapper wxSignatureDao;
	 public WxPublicMapper wxPublicDao; 

		@Autowired
	    public void setWxPublicMapperDao(WxPublicMapper wxPublicDao) {
	        this.wxPublicDao = wxPublicDao;
	    }
	@Autowired
    public void setWxSignatureMapperDao(WxSignatureMapper wxSignatureDao) {
        this.wxSignatureDao = wxSignatureDao;
    }
	
    @PostConstruct
    public void setBaseDao(){
        super.setBaseDao(wxSignatureDao);
    }
    
    @RequestMapping(params = "getTicket")
	@ResponseBody
	public Map<Object, Object> getTicket(HttpServletRequest request,String timestamp,String nonce,String url){
		Map<Object, Object> queryMap = new HashMap<Object, Object>();
		WxPublicUtil.setWxPublicDao(wxPublicDao);
		String ticket=WxPublicUtil.getTicket("gh_8d5f9c073de7");
		String signature = null;
		try {
			signature = SignUtil.checkSignatureUrl(ticket, timestamp, nonce,url);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		queryMap.put("signature", signature);
		return queryMap;
	}
    
	
}
