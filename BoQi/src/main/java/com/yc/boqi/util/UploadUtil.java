package com.yc.boqi.util;

import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;


public class UploadUtil {
	public static  String PATH="images";
	private static final String ALLOWED="gif,png,jpg,jpeg";
	private static final String DENIED="exe,bat,jsp,com,jsp";
	private static final int SINGLEFILESIZE=1024*1024;
	private static final int TOTALSIZE=1024*1024*20;
	
	public Map<String,String> upload(PageContext pagecontext) throws Exception{
		Map<String,String> map=new HashMap<String,String>();
		SmartUpload su=new SmartUpload();
		
		//鍒濆鍖�
		su.initialize(pagecontext);
		su.setAllowedFilesList(ALLOWED);
		su.setDeniedFilesList(DENIED);
		su.setMaxFileSize(SINGLEFILESIZE);
		su.setTotalMaxFileSize(TOTALSIZE);
		su.setCharset("utf-8");
		
		su.upload();
		
		Request request=su.getRequest();
		
		//鑾峰彇鎵�湁琛ㄥ崟鍏冪礌鐨勫�
		Enumeration<String> enums=request.getParameterNames();
		String fieldName;
		while(enums.hasMoreElements()){
			fieldName=enums.nextElement();
			map.put(fieldName, request.getParameter(fieldName));
			
		}
		Files files=su.getFiles();//鑾峰彇鎵�湁瑕佷笂浼犵殑鏂囦欢
		String photo="";
		if(files!=null &&files.getCount()>0){
			String fileName;
			Collection<File> list=files.getCollection();
			for(File fl:list){
				if(!fl.isMissing()){
					fileName=PATH+"/"+System.currentTimeMillis()+new Random().nextInt(10000)+"."+fl.getFileExt();
					System.out.println(fileName);
					//淇濆瓨鍒版湇鍔″櫒
					fl.saveAs(fileName,SmartUpload.SAVE_VIRTUAL);
					photo+=fileName+",";
				}
			}
			if(photo.indexOf(",")>=0){
				photo=photo.substring(0,photo.lastIndexOf(","));
			}
		}
		map.put("photo", photo);
		
		return map;
	}
	
}
