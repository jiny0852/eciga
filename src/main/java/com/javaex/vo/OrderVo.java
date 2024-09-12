package com.javaex.vo;

public class OrderVo {
    private int orderId;
    private int cartId;
    private String paymentStatus;
    private String paymentMethod;
    private String confirmDate;
    private String deliveryStatus;
    private String customerName;
    
    public OrderVo() {
		super();
	}

	public OrderVo(int orderId, int cartId, String paymentStatus, String paymentMethod, String confirmDate, String deliveryStatus, String customerName) {
        this.orderId = orderId;
        this.cartId = cartId;
        this.paymentStatus = paymentStatus;
        this.paymentMethod = paymentMethod;
        this.confirmDate = confirmDate;
        this.deliveryStatus = deliveryStatus;
        this.customerName = customerName;
    }

    // Getters and Setters

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getConfirmDate() {
        return confirmDate;
    }

    public void setConfirmDate(String confirmDate) {
        this.confirmDate = confirmDate;
    }

    public String getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(String deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
}
