package com.ian.media.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ian.media.dao.InformationMapper;
import com.ian.media.dao.MaterialMapper;
import com.ian.media.dao.WxPublicMapper;
import com.ian.media.dao.WxUsersMapper;
import com.ian.media.model.Information;
import com.ian.media.model.Material;
import com.ian.media.model.MaterialSub;
import com.ian.media.model.WxUsers;
import com.ian.media.util.IDGenerator;
import com.ian.media.util.Time;
import com.ian.media.util.UploadImage;
import com.ian.media.util.ToolUtil;
import com.ian.media.util.WxInterface;
import com.ian.media.util.WxPublicUtil;
import com.ian.media.model.WeixinMedia;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;

/**
 * 素材管理
 */

@Controller
@RequestMapping("material.action")
public class MaterialController extends BaseController<Material> {
    public MaterialMapper materialDao;
    public InformationMapper informationDao;
    public WxUsersMapper wxUserDao;
    public WxPublicMapper wxPublicDao; 

	@Autowired
    public void setWxPublicMapperDao(WxPublicMapper wxPublicDao) {
        this.wxPublicDao = wxPublicDao;
    }

    @Autowired
    public void setMateriaMapperlDao(MaterialMapper materialDao) {
        this.materialDao = materialDao;
    }

    @Autowired
    public void setInformationMapperDao(InformationMapper informationDao) {
        this.informationDao = informationDao;
    }
    
    @Autowired
    public void setWxUserMapperDao(WxUsersMapper wxUserDao) {
        this.wxUserDao = wxUserDao;
    }

    @PostConstruct
    public void setBaseDao(){
        super.setBaseDao(materialDao);
    }

    /**
     * 单图文消息预览
     * @return
     */
    // 增加方法
    @RequestMapping(params = "add")
    @ResponseBody
    public Map add(Material paramT, HttpServletRequest request,String title,String content1) {
        Map<Object, Object> map = new HashMap<Object, Object>();
        try {
            String pkid = request.getParameter("pkid");
            if(pkid !=null && !"".equals(pkid)){
                materialDao.updateByPrimaryKeySelective(paramT);
            }else{
                //生成ID
                paramT.setPkid(IDGenerator.getID());
                //创建人
                //			paramT.setCreateUser("David");
                //创建时间
                paramT.setCreateTime(Time.nowDateToString());

                materialDao.insertSelective(paramT);
            }

        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg", "失败");
            map.put("success", false);
            return map;
        }
        map.put("msg", "成功");
        map.put("success", true);
        return map;
    }

    /**
     * @Title 改变查询方法 查询出单图文和多图文
     * @param request
     * @return
     */
    @RequestMapping(params = "getAllMaterial")
    @ResponseBody
    public Map getAllMaterial(HttpServletRequest request){
        Map<Object, Object> queryMap = new HashMap<Object, Object>();
        Enumeration en = request.getParameterNames();
        while (en.hasMoreElements()) {
            String paramName = (String) en.nextElement();
            String paramValue = request.getParameter(paramName);
            if (paramValue.equals("")) {

            } else {
                // 形成键值对应的map
                queryMap.put(paramName, paramValue);
            }
        }
        System.out.println(JSON.toJSON(queryMap));
        String page = request.getParameter("page");
        String rows = request.getParameter("rows");
        // 如果没有page和rows则不传到SQL语句中
        if (page != null && rows != null) {
            queryMap.put("index",
                    ((Integer.parseInt(page)) - 1) * (Integer.parseInt(rows)));
            queryMap.put("rows", (Integer.parseInt(rows)));
        }
        List<Material> list = materialDao.getAllMaterial(queryMap);
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("rows", list);
        map.put("total", list.size());
        return map;
    }

    @RequestMapping(params = "addManyNews")
    @ResponseBody
    public Map addManyNews(HttpServletRequest request) {
        Map<Object, Object> map = new HashMap<Object, Object>();
        try {

            JSONArray object = (JSONArray) JSONObject.parse(request.getParameter("dataList"));
            Map map1 = (Map) object.get(0);
            //map1是第一条主消息
            Material material1 = new Material();
            String pkid = (String)map1.get("pkid");
            String parentId = "";
            if (pkid != null && !"".equals(pkid)){
                //更新
                parentId = pkid;

                material1.setPkid(pkid);
                material1.setField1("0");
                material1.setTitle((String)map1.get("title"));
                material1.setAuthor((String)map1.get("author"));
                material1.setImageUrl((String)map1.get("imageUrl"));
                material1.setContents((String)map1.get("contents"));
                material1.setContentSourceUrl((String)map1.get("contentSourceUrl"));
                material1.setShowCoverPic((String)map1.get("showCoverPic"));
                materialDao.updateByPrimaryKeySelective(material1);
            }else{
                parentId = IDGenerator.getID();

                material1.setPkid(parentId);
                material1.setField1("0");
                material1.setBrandId((String)map1.get("brandId"));
                material1.setTitle((String)map1.get("title"));
                material1.setAuthor((String)map1.get("author"));
                material1.setImageUrl((String)map1.get("imageUrl"));
                material1.setContents((String)map1.get("contents"));
                material1.setContentSourceUrl((String)map1.get("contentSourceUrl"));
                material1.setShowCoverPic((String)map1.get("showCoverPic"));
                material1.setCreateTime(Time.nowDateToString());
                materialDao.insertSelective(material1);
            }

            for(int i = 1;i<object.size();i++){
                Map map2 = (Map)object.get(i);
                Material material = new Material();
                String pkid1 = (String)map2.get("pkid");
                if (pkid1 != null && !"".equals(pkid1)){
                    //更新
                    material.setPkid(pkid1);
                    material.setField1(i+"");
                    material.setTitle((String)map2.get("title"));
                    material.setAuthor((String)map2.get("author"));
                    material.setImageUrl((String)map2.get("imageUrl"));
                    material.setContents((String)map2.get("contents"));
                    material.setContentSourceUrl((String)map2.get("contentSourceUrl"));
                    material.setShowCoverPic((String)map2.get("showCoverPic"));
                    materialDao.updateByPrimaryKeySelective(material);
                }else{
                    material.setPkid(IDGenerator.getID());
                    material.setField1(i+"");
                    material.setBrandId((String)map2.get("brandId"));
                    material.setTitle((String) map2.get("title"));
                    material.setAuthor((String) map2.get("author"));
                    material.setImageUrl((String) map2.get("imageUrl"));
                    material.setContents((String) map2.get("contents"));
                    material.setContentSourceUrl((String) map2.get("contentSourceUrl"));
                    material.setCreateTime(Time.nowDateToString());
                    material.setParentId(parentId);
                    material.setShowCoverPic((String)map2.get("showCoverPic"));
                    materialDao.insertSelective(material);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg", "失败");
            map.put("success", false);
            return map;
        }
        map.put("msg", "成功");
        map.put("success", true);
        return map;
    }


    @RequestMapping(params = "delete")
    @ResponseBody
    public Map delete(String id,HttpServletRequest request) {
        Map<Object, Object> map = new HashMap<Object, Object>();
        try {
            Map queryMap = new HashMap();
            queryMap.put("pkid",id);
            List<Material> informationList = materialDao.get(queryMap);
            if(informationList.size() > 0){
                Material material = informationList.get(0);
                String path = request.getSession().getServletContext().getRealPath(
                        "data/material/")+"\\";
                UploadImage.deleteFile(path, material.getImageUrl());
            }
            materialDao.deleteByPrimaryKey(id);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg", "删除失败");
            map.put("success", false);
            return map;
        }
        map.put("msg", "删除成功");
        map.put("success", true);
        return map;
    }

    @RequestMapping(params = "saveToInformation")
    @ResponseBody
    public Map saveToInformation(String informationId,String newsType,String brandId) {
        Map<Object, Object> map = new HashMap<Object, Object>();
        try {
            Map querymap = new HashMap();
            querymap.put("parentId",informationId);
            querymap.put("brandId",brandId);
            List<Material> list = materialDao.getAllMaterial(querymap);

            if(list.size() > 0){
                Material material = list.get(0);

                Map informationMap = new HashMap();
                informationMap.put("field1",material.getPkid());
                informationMap.put("type",Integer.parseInt(newsType));
                List<Information> informationList = informationDao.get(informationMap);

                Information information = new Information();
                information.setField2("0");

                information.setField1(material.getPkid());
                information.setBrandId(brandId);
                information.setInformationTitle(material.getTitle());
                information.setInformationImage(material.getImageUrl());
                information.setCreateTime(Time.nowDateToString());
                information.setCreateUser(material.getAuthor());
                information.setType(Integer.parseInt(newsType));
                information.setInformationDescription(material.getContents());

                if(informationList.size() == 0){
                    information.setPkid(IDGenerator.getID());
                    informationDao.insertSelective(information);
                }else{
                    information.setPkid(informationList.get(0).getPkid());
                    informationDao.updateByPrimaryKeySelective(information);
                }

                if(material.getMaterialSub().size() > 0){
                    for(int i = 0; i<material.getMaterialSub().size();i++){
                        MaterialSub material1 = material.getMaterialSub().get(i);

                        Map informationMap1 = new HashMap();
                        informationMap1.put("field1",material1.getPkid());
                        informationMap1.put("type",Integer.parseInt(newsType));
                        List<Information> informationList1 = informationDao.get(informationMap1);

                        Information information1 = new Information();
                        information1.setBrandId(brandId);
                        information1.setField2((i+1)+"");
                        information1.setField1(material1.getPkid());
                        information1.setInformationTitle(material1.getTitle());
                        information1.setInformationImage(material1.getImageUrl());
                        information1.setCreateTime(Time.nowDateToString());
                        information1.setCreateUser(material1.getAuthor());
                        information1.setType(Integer.parseInt(newsType));
                        information1.setInformationDescription(material1.getContents());

                        if(informationList1.size() == 0){
                            information1.setPkid(IDGenerator.getID());
                            informationDao.insertSelective(information1);
                        }else{
                            information1.setPkid(informationList1.get(0).getPkid());
                            informationDao.updateByPrimaryKeySelective(information1);
                        }
                    }
                }
            }else{
                map.put("msg", "没有此图文消息");
                map.put("success", false);
                return map;
            }

        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg", "保存失败");
            map.put("success", false);
            return map;
        }
        map.put("msg", "保存成功");
        map.put("success", true);
        return map;
    }
    
 // 查询方法
	@RequestMapping(params = "addInform")
	@ResponseBody
	public Map<Object, Object> addInform(HttpServletRequest request,String brandId,String informationId,String newsType){
		Map<Object, Object> map = new HashMap<Object, Object>();
		try {
			Map<Object, Object> querymap = new HashMap<Object, Object>();
			querymap.put("pkid",informationId);
			querymap.put("brandId",brandId);
			List<Material> list = materialDao.getAllMaterialBypr(querymap);
	        if(list.size() > 0){
	          Material material = list.get(0);
	         this.addInformation(brandId,newsType,material);
	         
	         Map informationMap = new HashMap();
	         informationMap.put("parentId",informationId);
	         informationMap.put("brandId",brandId);
	         List<Material> listmore = materialDao.getAllMaterialBypr(informationMap);
	         if(listmore.size()>0){
	        	 for(int i=0;i<listmore.size();i++){
		        	 this.addInformation(brandId,newsType,listmore.get(i));
		         }
	         }
	         
			}
			map.put("rows", list);
			map.put("success",true);
			map.put("msg","添加成功");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("success",false);
			map.put("msg","添加失败");
			return map;
		}
		return map;
	}
	
	/**
	 * 添加新闻
	 */
	public String addInformation(String brandId,String newsType,Material material){
		 Information information = new Information();
         information.setField1(material.getPkid());
         information.setBrandId(brandId);
         information.setInformationTitle(material.getTitle());
         information.setInformationImage(material.getImageUrl());
         information.setCreateTime(Time.nowDateToString());
         information.setCreateUser(material.getAuthor());
         information.setType(Integer.parseInt(newsType));
         information.setField2("0");
         information.setInformationDescription(material.getContents());
         information.setPkid(IDGenerator.getID());
         informationDao.insertSelective(information);
         return "";
	}
	
    
    
    
    
    /**
     * @title 推送方法 DAVID 重写   根据不同的身份推送消息
     * @param request
     * @param type  推送类型 1:粉丝 2:潜客  3:车主
     * @param brandId   4S店ID
     * @param informationId  消息的ID
     * @return
     */
    @RequestMapping(params = "sendNewsMessageByType")
    @ResponseBody
    public Map sendNewsMessageByType(HttpServletRequest request,String type,String brandId,String informationId,String newsType){
        Map returnMap = new HashMap();
        Map<Object, Object> queryMap = new HashMap<Object, Object>();
        Enumeration en = request.getParameterNames();
        while (en.hasMoreElements()) {
            String paramName = (String) en.nextElement();
            String paramValue = request.getParameter(paramName);
            if (paramValue.equals("")) {

            } else {
                // 形成键值对应的map
                queryMap.put(paramName, paramValue);
            }
        }
        try{
            List<WxUsers> list = wxUserDao.get(queryMap);
            if (list.size() == 0){
                returnMap.put("success",false);
                returnMap.put("msg","未选择客户");
                return returnMap;
            }else{
                List  openids = new ArrayList();

                for(int i=0;i<list.size();i++){
                    openids.add(list.get(i).getOpenId());

                }
                String openidsString = JSONObject.toJSONString(openids);
                returnMap.put("id", openidsString);
                return sendNewsMessage(openidsString,brandId,informationId,type,newsType);

            }
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }
    
    /**
     *  @title 图文消息推送
     *  @param openids 将要推送的用户的ID
     *  @param brandId 4S店ID
     *  @param informationId  图文消息ID
     *  @param type 推送类型 1:粉丝 2:潜客  3:车主
     *  @return Map  返回消息
     */
    @RequestMapping(params = "sendNewsMessage")
    @ResponseBody
    public Map sendNewsMessage(String openids,String brandId,String informationId,String type,String newsType){
    	
        //上传图文消息
        Map returnMap = new HashMap();
        String sendType = "";
        String url = WxInterface.upload_newImg_url;
        if(openids == null || "".equals(openids)){
            returnMap.put("success",false);
            returnMap.put("msg","未选择客户");
            return returnMap;
        }
        if(informationId == null || "".equals(informationId)){
            returnMap.put("success",false);
            returnMap.put("msg","未选择图文消息");
            return returnMap;
        }
        Map querymap = new HashMap();
        querymap.put("parentId",informationId);
        querymap.put("brandId",brandId);
        List<Material> list = materialDao.getAllMaterial(querymap);
        List articles = new ArrayList();
        if(list.size() > 0){
            Material material = list.get(0);
            Map map = new HashMap();

            map.put("author",material.getAuthor());
            map.put("title",material.getTitle());
            map.put("content_source_url",material.getContentSourceUrl());
            //图文消息的内容 支持HTML标签
            map.put("content",material.getContents());
            //图文消息的描述
            map.put("digest",material.getDigest());
            //是否显示封面图片
            map.put("show_cover_pic",material.getShowCoverPic());
            String s4s_url="";
            try{
            	s4s_url=ToolUtil.getValue("/config.properties", "S4S_SERVER_URL");
            	WeixinMedia weixinMedia = this.uploadMedia(
                        WxInterface.upload_img_url, "image", s4s_url
                                + "data/material/" + material.getImageUrl(), brandId);

                if(weixinMedia == null){
                    returnMap.put("success",false);
                    returnMap.put("msg","Token不能使用或者图片不存在");
                    return returnMap;
                }

                map.put("thumb_media_id",weixinMedia.getMediaId());

            }catch (Exception e){
                e.printStackTrace();
                returnMap.put("success",false);
                returnMap.put("msg","图片不存在");
                return returnMap;
            }

            articles.add(map);

            for (int i = 0; i< material.getMaterialSub().size();i++) {
                MaterialSub materialSub = material.getMaterialSub().get(i);
                Map mapSub = new HashMap();

                mapSub.put("author", materialSub.getAuthor());
                mapSub.put("title", materialSub.getTitle());
                mapSub.put("content_source_url", materialSub.getContentSourceUrl());
                //图文消息的内容 支持HTML标签
                mapSub.put("content", materialSub.getContents());
                //图文消息的描述
                mapSub.put("digest", materialSub.getDigest());
                //是否显示封面图片
                mapSub.put("show_cover_pic", materialSub.getShowCoverPic());
                try {
                    WeixinMedia weixinMedia = this.uploadMedia(
                            WxInterface.upload_img_url, "image", s4s_url
                                    + "data/material/" + materialSub.getImageUrl(), brandId
                    );
                    mapSub.put("thumb_media_id", weixinMedia.getMediaId());


                } catch (Exception e) {
                    e.printStackTrace();
                    returnMap.put("success", false);
                    returnMap.put("msg", "图片不存在");
                    return returnMap;
                }
                articles.add(mapSub);
            }

        }else{

            returnMap.put("msg","推送失败,无此图文消息");
            returnMap.put("success",false);
            return  returnMap;
        }

        Map articlesMap = new HashMap();
        articlesMap.put("articles",articles);

        String articlesString = JSONObject.toJSONString(articlesMap).toString();

        JSONObject jsonObject2 = WxPublicUtil.httpRequest(url, "POST", articlesString,brandId);
        String url2 = WxInterface.send_Customer_url;
        String body3 = "{\"touser\":" + openids
                + ",\"mpnews\":{\"media_id\":\""
                + jsonObject2.getString("media_id")
                + "\"},\"msgtype\":\"mpnews\"}";

        JSONObject jsonObject3 = WxPublicUtil.httpRequest(url2, "POST", body3,brandId);

        int errorCode = jsonObject3.getInteger("errcode");


        if(errorCode == 0){
            sendType = "推送成功";

        }else{
            sendType = "推送失败";
            returnMap.put("success",false);
        }

        returnMap.put("msg",sendType);
        return returnMap;
    }
    
    /**
     * 微信公众平台上传图片
     * @param accessToken
     * @param type
     * @param mediaFileUrl
     * @return
     */
    public WeixinMedia uploadMedia(String accessToken,String type,String mediaFileUrl,String brandId) {
    	Map<Object, Object> maptoken=new HashMap<Object, Object>();
    	
    	WeixinMedia weixinMedia=null;
    	WxPublicUtil.setWxPublicDao(wxPublicDao);
    	maptoken=WxPublicUtil.getAccessToken(brandId);
    	String token=(String) maptoken.get("accessToken");
		String uploadMediaUrl=accessToken.replace("ACCESS_TOKEN", token).replace("TYPE", type);
		//定义数据分隔符
		String boundary="------------7da2e536604c8";
		try {
			URL uploadUrl=new URL(uploadMediaUrl);
			HttpURLConnection uploadConn=(HttpURLConnection)uploadUrl.openConnection();
			uploadConn.setDoOutput(true);
			uploadConn.setDoInput(true);
			uploadConn.setRequestMethod("POST");
			// 设置请求头Content-Type
			uploadConn.setRequestProperty("Content-Type", "multipart/form-data;boundary="+boundary);
			// 获取媒体文件上传的输出流（往微信服务器写数据）
			OutputStream outputStream=uploadConn.getOutputStream();
			
			URL mediaUrl=new URL(mediaFileUrl);
			HttpURLConnection mediaConn=(HttpURLConnection) mediaUrl.openConnection();
			mediaConn.setDoOutput(true);
			mediaConn.setRequestMethod("GET");

			// 从请求头获取内容类型
			String contentType=mediaConn.getHeaderField("Content-Type");
			// 根据内容类型判断文件扩展名
			String fileExt=ToolUtil.getFileExt(contentType);
			// 请求体开始
			outputStream.write(("--"+boundary+"\r\n").getBytes());
			outputStream.write(String.format("Content-Disposition: form-data; name=\"media\";filename=\"file1%s\"\r\n", fileExt).getBytes());
			outputStream.write(String.format("Content-Type: %s\r\n\r\n", contentType).getBytes());

			// 获取媒体文件的输入流(读取文件)
			BufferedInputStream bis=new BufferedInputStream(mediaConn.getInputStream());
			byte[] buf=new byte[8096];
			int size=0;
			while((size=bis.read(buf))!=-1){
				// 将媒体文件写到输出流（往微信服务器写数据）
				outputStream.write(buf,0,size);
			}

			// 请求体结束
			outputStream.write(("\r\n--"+boundary+"--\r\n").getBytes());
			outputStream.close();
			bis.close();
			mediaConn.disconnect();

			// 获取媒体文件上传的输入流（从微信服务器读数据）
			InputStream inputStream = uploadConn.getInputStream();
			InputStreamReader inputStreamReader=new InputStreamReader(inputStream,"utf-8");
			BufferedReader bufferedReader=new BufferedReader(inputStreamReader);
			StringBuffer buffer=new StringBuffer();
			String str=null;
			while ((str=bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			// 释放资源
			inputStream.close();
			inputStream=null;
			uploadConn.disconnect();

			// 使用JSON-lib解析返回结果
			JSONObject jsonObject = (JSONObject) JSONObject.parse(buffer.toString());
			weixinMedia=new WeixinMedia();
			weixinMedia.setType(jsonObject.getString("type"));
			// type等于thumb时的返回结果和其他类型不一样
			if ("thumb".equals(type)) {
				weixinMedia.setMediaId(jsonObject.getString("thumb_media_id"));
			}else {
				weixinMedia.setMediaId(jsonObject.getString("media_id"));
				//weixinMedia.setCreatedAt(jsonObject.getInt("created_at"));
			}
		} catch (Exception e) {
			weixinMedia=null;
			System.out.println("上传媒体文件失败:{}"+e);
		}
		return weixinMedia;
    }

}
