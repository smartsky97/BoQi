package com.yc.boqi.util;

public class PageUtil {
	private int pageNo=1;  //当前的页数
	private int pageSize=5;//每页显示的记录数
	private int totalSize=0;//总记录数
	private int totalPage=0;//共多少页
	@Override
	public String toString() {
		return "PageUtil [pageNo=" + pageNo + ", pageSize=" + pageSize
				+ ", totalSize=" + totalSize + ", totalPage=" + totalPage + "]";
	}
	
	//获取下页
	public int getNextPageNo(){
		if(this.pageNo<this.totalPage){
			System.out.println(this.pageNo);
			this.pageNo++;
		}else{
			this.pageNo=this.totalPage;
		}
		return this.pageNo;
	}
	
	public int getProPageNo(){
		System.out.println(this.pageNo);
		if(this.pageNo>1){
			this.pageNo--;
		}else{
			this.pageNo=1;
		}
		return this.pageNo;
	}
	
	
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		if(pageNo<0){
			this.pageNo=1;
		}else if(this.totalPage!=0&& pageNo>totalPage){
			this.pageNo=this.totalPage;
		}else{
			this.pageNo=pageNo;
		}
	}
	public int getPageSize() {
		
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		if(pageSize<=0){
			this.pageSize=5;
		}else{
			this.pageSize=pageSize;
		}
		
		this.pageSize = pageSize;
	}
	public int getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	public int getTotalPage() {
		totalPage =this.totalSize%this.pageSize==0?this.totalSize/this.pageSize:this.totalSize/this.pageSize+1;
		return totalPage;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + pageNo;
		result = prime * result + pageSize;
		result = prime * result + totalPage;
		result = prime * result + totalSize;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PageUtil other = (PageUtil) obj;
		if (pageNo != other.pageNo)
			return false;
		if (pageSize != other.pageSize)
			return false;
		if (totalPage != other.totalPage)
			return false;
		if (totalSize != other.totalSize)
			return false;
		return true;
	}
	
	
	
}
