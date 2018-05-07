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
import com.ian.media.model.QRCodeInfo;
import com.ian.media.model.WxPublic;
import com.ian.media.model.res.TextMessageRes;

@Controller("qrCodeInfoAction")
@Scope("prototype")
@RequestMapping("/qrCodeInfo.action")
public class QRCodeInfoController extends BaseController<QRCodeInfo> {
	public WxPublicMapper wxPublicDao; 

	@Autowired
    public void setWxPublicMapperDao(WxPublicMapper wxPublicDao) {
        this.wxPublicDao = wxPublicDao;
    }
	public QRCodeInfoMapper qrCodeInfoDao;

    @Autowired
    public void setQrCodeInfoDao(QRCodeInfoMapper qrCodeInfoDao) {
        this.qrCodeInfoDao = qrCodeInfoDao;
    }
	
    @PostConstruct
    public void setBaseDao(){
        super.setBaseDao(qrCodeInfoDao);
    }
    
	@RequestMapping(params = "addFromWXWithSceneId")
    @ResponseBody
    public Map addFromWXWithSceneId(QRCodeInfo paramT){
        Map<Object, Object> map = new HashMap<Object, Object>();
        try {
            paramT.setPkid(IDGenerator.getID());
            int type =2;
            String ticket = "";
            if (type == 1){
                ticket = getTicket(paramT.getSceneId(),"1800",paramT.getField1());
            }else if (type == 2){
                ticket = getTicket(paramT.getSceneId(),"",paramT.getField1());
            }
            paramT.setField2(ticket);
            map.put("ticket",ticket);
            paramT.setCreateTime(Time.nowDateToString());
            dao.insertSelective(paramT);

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
	 public String getTicket(String sceneId,String expireSeconds,String publicNo){
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
	

}
