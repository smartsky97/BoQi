package com.yc.boqi.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.boqi.entity.Pet;
import com.yc.boqi.mapper.PetMapper;
import com.yc.boqi.service.PetService;

@Service("petService")
public class PetServiceImpl implements PetService{
	
	@Autowired
	private PetMapper petMapper;

	@Override
	public List<Pet> findPetByFamily(int page,int rows,String family) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("one", page*rows);
		map.put("two", (page-1)*rows);
		map.put("family", family);
		return petMapper.findPetByFamily(map);
	}
	@Override
	public Pet findPetByid(int petid) {
		return petMapper.findPetByid(petid);
	}

	@Override
	public int addPet(Pet pet,File[] pictrues,String[] pictruesFileName,String[] pictruesContentType) {
		 String picture="";
		 if(pictruesFileName.length==1){
		    	picture = pictruesFileName[0];
		    }else if(pictruesFileName.length>1){
			    for(String as:pictruesFileName){
			    	picture += as+",";
			    }
			    picture = picture.substring(0, picture.length()-1);
		    }
		    pet.setPetpic(picture);
		int result=petMapper.addPet(pet);
		int currid=pet.getPetid();
		
		if(result>0){
			String path =ServletActionContext.getServletContext().getRealPath("../upload/"+currid+"/");
	        System.out.println("上传的地址："+path);
	       
	       
	        
		    for(int i = 0;i<pictrues.length;i++) {
	    		//要使用绝对地址
	    		try {			
	    			FileUtils.copyFile(pictrues[i], new File(path+"/"+pictruesFileName[i]));//开始上传
	    			//为了方便多次测试，把上传到服务器的文件中，在工程中也传一份，开发完成后在删除
	    			FileUtils.copyFile(pictrues[i], new File("D:\\pictrues"+"/"+pictruesFileName[i]));//开始上传
	    			System.out.println("上传成功！");
	    			
	    			
	    		} catch (IOException e) {
	    			System.out.println("上传失败！");
	    			e.printStackTrace(); 
	    		}
		    }
		   
		    return 1;
		}
		
		
		return 0;
	}

	@Override
	public int updatePet(Pet pet, File[] pictrues, String[] pictruesFileName,String[] pictruesContentType) {
		
		 String picture="";
		 if(pictruesFileName.length==1){
		    	picture = pictruesFileName[0];
		    }else if(pictruesFileName.length>1){
			    for(String as:pictruesFileName){
			    	picture += as+",";
			    }
			    picture = picture.substring(0, picture.length()-1);
		    }
		    pet.setPetpic(picture);
		int result=petMapper.updatePet(pet);
		int currid=pet.getPetid();
		
		if(result>0){
			String path =ServletActionContext.getServletContext().getRealPath("../upload/"+currid+"/");
	        System.out.println("上传的地址："+path);
	       
	       if(rmFile(path)){
	    	   for(int i = 0;i<pictrues.length;i++) {
		    		//要使用绝对地址
		    		try {			
		    			FileUtils.copyFile(pictrues[i], new File(path+"/"+pictruesFileName[i]));//开始上传
		    			//为了方便多次测试，把上传到服务器的文件中，在工程中也传一份，开发完成后在删除
		    			FileUtils.copyFile(pictrues[i], new File("D:\\pictrues"+"/"+pictruesFileName[i]));//开始上传
		    			System.out.println("上传成功！");
		    			
		    			
		    		} catch (IOException e) {
		    			System.out.println("上传失败！");
		    			e.printStackTrace(); 
		    		}
			    } 
	    	   return 1;
	       }
		}
		
		
		return 0;
	}
	
	@Override
	public int deletePet(String petid) {
		if(!petid.contains(",")){
			if(petMapper.deletePet(Integer.valueOf(petid))>0){
				String path =ServletActionContext.getServletContext().getRealPath("../upload/"+petid+"/");
				System.out.println(path);
				rmBolder(path);
				return 1;
			}
		}else{
			String[] id=petid.split(",");
			for(String str:id){
				if(petMapper.deletePet(Integer.valueOf(str))>0){
					String path =ServletActionContext.getServletContext().getRealPath("../upload/"+Integer.valueOf(str)+"/");
					System.out.println(path);
					rmBolder(path);
				}
			}
			return 1;
		}
		
		return 0;
	}
	
	
	public boolean rmFile(String path){
		File file=new File(path);
		if(file.exists() && file.isDirectory()){
			String[] list=file.list();
			for(String str:list){
				File df=new File(path+str);
				df.delete();
			}
			return true;
		}
		return false;
	}
	
	public boolean rmBolder(String path){
		File file=new File(path);
		if(file.exists() && file.isDirectory()){
			String[] list=file.list();
			if(list.length>0){
				for(String str:list){
					File df=new File(path+file.separator+str);
					System.out.println(path+file.separator+str);
					System.out.println(df.delete());
				}
				if(file.delete()){
					System.out.println("删除成功1");
				}
				
				return true;
			}else{
				file.delete();
				System.out.println("删除成功2");
				return true;
			}
			
		}
		return false;
	}
	
}
