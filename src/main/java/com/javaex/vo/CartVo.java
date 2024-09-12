package com.javaex.vo;

public class CartVo {

	private int cNo;
	private int uId;
	private int uNo;
	private int fNo; // 상품색상번호
	private int count;
	private int gNo; // 제품번호
	private String imgName; // 제풍이미지
	private String name; // 제품명
	private int price; // 제품 가격

	public CartVo() {
		super();
	}

	public CartVo(int cNo, int uId, int uNo, int fNo, int count, int gNo, String imgName, String name, int price) {
		super();
		this.cNo = cNo;
		this.uId = uId;
		this.uNo = uNo;
		this.fNo = fNo;
		this.count = count;
		this.gNo = gNo;
		this.imgName = imgName;
		this.name = name;
		this.price = price;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CartVo [cNo=" + cNo + ", uId=" + uId + ", uNo=" + uNo + ", fNo=" + fNo + ", count=" + count + ", gNo="
				+ gNo + ", imgName=" + imgName + ", name=" + name + ", price=" + price + "]";
	}

	
	
	
	
	
	
	
	
	
	
	
	

}
