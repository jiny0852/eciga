package com.javaex.vo;

public class AskboardVo {
	private int no;
	private String title;
	private int uId;
	private String subDate;
	private String regDate;
	private int status;
	private String uName;
	
	//생성자
	public AskboardVo() {
		super();
	}

	public AskboardVo(int no, String title, int uId, String subDate, String regDate, int status, String uName) {
		super();
		this.no = no;
		this.title = title;
		this.uId = uId;
		this.subDate = subDate;
		this.regDate = regDate;
		this.status = status;
		this.uName = uName;
	}

	//메소드 gs
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public String getSubDate() {
		return subDate;
	}

	public void setSubDate(String subDate) {
		this.subDate = subDate;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	//메소드 일반
	@Override
	public String toString() {
		return "AskboardVo [no=" + no + ", title=" + title + ", uId=" + uId + ", subDate=" + subDate + ", regDate="
				+ regDate + ", status=" + status + ", uName=" + uName + "]";
	}
	

	
	
	

}
