package com.ian.media.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ian.media.model.UploadState;
import com.ian.media.util.DeCompressUtil;
import com.ian.media.util.ToolUtil;

@Controller("upload")
@Scope("prototype")
@RequestMapping("upload.action")
public class UploadController {
	 private String uploadpath = "compress";// 文件上传地址
	 private String unpkpath = "data\\pdf";	//压缩路径
	 private long maxSize = 100 * 1024 * 1024;// 最大文件大小100M
	 private String limitfile = "zip,rar";// 限制上传类型doc,docx,xls,xlsx,ppt,htm,html,txt,
//	 private Gson gson = new Gson();
	
//	 @RequestParam(value = "file") MultipartFile file ,
	 
	 @RequestMapping(params="upload")	
	 @ResponseBody
	 protected Map<String,Object> upload(HttpServletRequest request, HttpServletResponse response) {
		 Map<String,Object> map=new HashMap<String,Object>();
		 UploadState state = new UploadState();
		  try {
		   String id=request.getParameter("id");
		   String count=request.getParameter("count");
		   String fileExt=request.getParameter("fileExt");
		   System.out.println(id+"==="+count+"==="+fileExt);
		   boolean ismulti=ServletFileUpload.isMultipartContent(request);//检查一下是否为一个文件上传请求
		   if(ismulti){
		    long length = request.getContentLength();
		    System.out.println("length:"+length);
		    if (length > maxSize) {
		    	  System.out.println("文件上传内容过大");
		    	  map.put("state", state);
		    } else {
		      MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			  MultipartFile file = (MultipartFile) multipartRequest.getFile("file");
			  String fileName=file.getOriginalFilename();
			  String savePath=request.getSession().getServletContext().getRealPath("/")+uploadpath;
			  // 临时文件目录
			  String tempPath = savePath + "/temp";
	//		  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
	//		  String ymd = sdf.format(new Date());
			  String path = savePath + "/pdf/";
			  // 创建文件夹
			  File dirFile = new File(path);
			  if (!dirFile.exists()) {
			   dirFile.mkdirs();
			  }
			  // 创建临时文件夹
			  File dirTempFile = new File(tempPath);
			  if (!dirTempFile.exists()) {
			   dirTempFile.mkdirs();
			  }
			  if(fileName.isEmpty()){
				  System.out.println("上传文件为空");
				
			  	}else{
			      String newFileName = System.currentTimeMillis() + "_" + new Random().nextInt(1000) + "." + fileExt;
			      File uploadedFile = new File(path, newFileName);
			      state.setTargetfile(uploadedFile.getPath());
			       OutputStream os = new FileOutputStream(uploadedFile);
			       InputStream is = file.getInputStream();
			       byte buf[] = new byte[1024];// 可以修改 1024 以提高读取速度
			       int legth = 0;
			       while ((legth = is.read(buf)) > 0) {
			        os.write(buf, 0, legth);
			       }
			       // 关闭流
			       os.flush();
			       os.close();
			       is.close();
			      map.put("msg", "上传成功");
			      map.put("success", true);
			      String zipName =  ToolUtil.downLoadZipName();
			      unpkpath+="\\"+zipName+"_"+count;
			      String unpath=request.getSession().getServletContext().getRealPath("/")+unpkpath;
			      File f=new File(unpath);
			      if(!f.exists()){
			       f.mkdirs();
			      }
			      String fileName1=fileName.substring(0, fileName.lastIndexOf("."));
//			       DeCompressUtil.deCompress(uploadedFile.getPath(), unpath,fileName1);//解压
//			       String unpath1=zipName+"_"+count;
//			       params.setAttachments2(unpath1);
	//		      AntZip.unzip(uploadedFile.getPath(), unpath);//解压
			     }
			   }
			   
		  } 
		  }catch (Exception e) {  
			   e.printStackTrace();
			   map.put("msg", "上传失败");
			   map.put("success", true);
		  }
		  return map;
	 }
	 private UploadState setStatusMsg(HttpServletRequest request, int error,
	   String message) {
	  HttpSession session = request.getSession();
	  UploadState state = (UploadState) session.getAttribute("upstate");
	  state.setState(error);
	  state.setErrormsg(message);
	  return state;
	 }
	
}
