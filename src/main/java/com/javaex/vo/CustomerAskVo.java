package com.javaex.vo;

public class CustomerAskVo {

    private int inquiryNo;
    private String title;
    private int userId;
    private String userName; // join 결과
    private String regDate;
    private String status;
    private String answerDate;
    private String content; // 문의 내용 추가
    private String answer;
    private String hp;

    public CustomerAskVo() {
        super();
    }

	public CustomerAskVo(int inquiryNo, String title, int userId, String userName, String regDate, String status,
			String answerDate, String content, String answer, String hp) {
		super();
		this.inquiryNo = inquiryNo;
		this.title = title;
		this.userId = userId;
		this.userName = userName;
		this.regDate = regDate;
		this.status = status;
		this.answerDate = answerDate;
		this.content = content;
		this.answer = answer;
		this.hp = hp;
	}

	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	@Override
	public String toString() {
		return "CustomerAskVo [inquiryNo=" + inquiryNo + ", title=" + title + ", userId=" + userId + ", userName="
				+ userName + ", regDate=" + regDate + ", status=" + status + ", answerDate=" + answerDate + ", content="
				+ content + ", answer=" + answer + ", hp=" + hp + "]";
	}

    
    
    
    
    
    
    
    
    
    
    
    
}
