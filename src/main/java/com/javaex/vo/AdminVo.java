package com.javaex.vo;

public class AdminVo {
    private int inquiryId;
    private String category;
    private String title;
    private String customerName;
    private String date;
    private String status;
    

    public AdminVo() {
		super();
	}

	public AdminVo(int inquiryId, String category, String title, String customerName, String date, String status) {
        this.inquiryId = inquiryId;
        this.category = category;
        this.title = title;
        this.customerName = customerName;
        this.date = date;
        this.status = status;
    }

    // Getters and Setters

    public int getInquiryId() {
        return inquiryId;
    }

    public void setInquiryId(int inquiryId) {
        this.inquiryId = inquiryId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
