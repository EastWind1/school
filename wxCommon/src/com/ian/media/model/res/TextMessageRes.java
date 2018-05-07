package com.ian.media.model.res;

public class TextMessageRes extends BaseMessageRes {
	// 消息内容  
    private String Content; 
    
    private String TransInfo;
  
    public String getContent() {  
        return Content;  
    }  
  
    public void setContent(String content) {  
        Content = content;  
    }


	public String getTransInfo() {
		return TransInfo;
	}

	public void setTransInfo(String transInfo) {
		TransInfo = transInfo;
	}
    
}
