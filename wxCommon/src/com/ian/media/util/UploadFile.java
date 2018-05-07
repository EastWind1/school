package com.ian.media.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import com.cloopen.rest.sdk.utils.PropertiesUtil;

public class UploadFile {
	@SuppressWarnings("unchecked")
	public  static String uploadFile(MultipartFile file,String realpath,String FileName)
	{
		File savefile = new File(new File(realpath), FileName);
	      if (!savefile.getParentFile().exists()){
	    	  savefile.getParentFile().mkdirs();
	      }
	      try {
	     	 //上传
	    	  //	file.transferTo(savefile);
	    	  InputStream in=file.getInputStream();
	    	  FileOutputStream fos=new FileOutputStream(savefile);
	    	  BufferedOutputStream bos=new BufferedOutputStream(fos);
	    	  int b=-1;
	    	  byte[] buffer=new byte[150];
	    	  while((b=in.read(buffer))!= -1){
	    		  bos.write(buffer,0,b);
	    	  }
	    	  bos.flush();
	    	  bos.close();
	    	  fos.close();
	    	  in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		return null;
	}
	public  static String uploadFile(String directFileUrl,String realpath,String FileName)
	{
		
		File uploadFile=new File(directFileUrl);
		File savefile = new File(new File(realpath), FileName);
	      if (!savefile.getParentFile().exists()){
	    	  savefile.getParentFile().mkdirs();
	      }
	      try {
	     	 //上传
				FileUtils.copyFile(uploadFile, savefile);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return null;
	}


    /**
     * 删除单个文件
     * @param   path    被删除的图片的途径
     * @param  imageName  图片名称
     * @return 单个文件删除成功返回true,否则返回false
     */
    public static boolean deleteFile(String path,String FileName){
        File file = new File(path+FileName);
        if(file.exists()){
            return file.delete();
        }else{
            return true;
        }
    }

}
