package com.javaex.vo;

public class BoardVo {
	
	private int bNo;
	private int uId;
	private String title;
	private String content;
	private String regDate;
	private int ansStatus;
	private String answer;
	private String ansDate;
	
	
	
	public BoardVo() {
		super();
	}
	public BoardVo(int bNo, int uId, String title, String content, String regDate, int ansStatus, String answer,
			String ansDate) {
		super();
		this.bNo = bNo;
		this.uId = uId;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.ansStatus = ansStatus;
		this.answer = answer;
		this.ansDate = ansDate;
	}
	
	
	
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getAnsStatus() {
		return ansStatus;
	}
	public void setAnsStatus(int ansStatus) {
		this.ansStatus = ansStatus;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnsDate() {
		return ansDate;
	}
	public void setAnsDate(String ansDate) {
		this.ansDate = ansDate;
	}
	
	
	
	@Override
	public String toString() {
		return "BoardVo [bNo=" + bNo + ", uId=" + uId + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", ansStatus=" + ansStatus + ", answer=" + answer + ", ansDate=" + ansDate + "]";
	}
	
	
	
	
	
	
	
	
	
	
	

}
