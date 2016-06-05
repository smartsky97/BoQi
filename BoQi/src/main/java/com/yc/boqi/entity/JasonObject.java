package com.yc.boqi.entity;

import java.util.List;

public class JasonObject<T> {
	private List<T> rows;
	private Object data;
	private int result;
	
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "JasonObject [rows=" + rows + ", data=" + data + ", result="
				+ result + "]";
	}
	
	
}
