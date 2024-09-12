package com.javaex.vo;

public class PurchaseVo {
	private int order_no; //결재번호 (pNo)
	private String user_name; //유저 아이디
	private int uno;	//유저 번호(auto increment)
	private String address;
	private String delivery_status; //배송중/배송완
	private String payment_status; //결재대기/결재완
	private int fNo; //ex) 1 1 = 하이브리드 빨강; 2 1 = 사이브리드 빨강 ; 1 2 = 하이브리드 파랑
	private String goods_name; 
		/*
		 * SELECT 
    			t1.name AS table1Name,
    			t2.name AS table2Name,
    			t1.age,
    			t2.salary
			FROM 
    			table1 t1
			JOIN 
    			table2 t2 ON t1.id = t2.id;
		*/
	private String color; // Listgoods.color = options.cno 
	private int price; //가격
	
    public PurchaseVo() {}

    // Parameterized constructor
    public PurchaseVo(int order_no, String user_name, int uno, String address, 
                      String delivery_status, String payment_status, int fNo, 
                      String goods_name, String color, int price) {
        this.order_no = order_no;
        this.user_name = user_name;
        this.uno = uno;
        this.address = address;
        this.delivery_status = delivery_status;
        this.payment_status = payment_status;
        this.fNo = fNo;
        this.goods_name = goods_name;
        this.color = color;
        this.price = price;
    }
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getUno() {
		return uno;
	}
	public void setuNo(int uno) {
		this.uno = uno;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "PurchaseVo [order_no=" + order_no + ", user_name=" + user_name + ", uno=" + uno + ", delivery_status="
				+ delivery_status + ", payment_status=" + payment_status + ", fNo=" + fNo + ", goods_name=" + goods_name
				+ ", color=" + color + ", address=" + address +", price=" + price + "]";
	}
	
	
	
	
}
