package com.javaex.vo;

public class GoodsVo {
	
	private int gno;
	private int fno;
	private int price;
	private String name;
	private String descript;
	private long imgSize;
	private String imgPath;
	private String imgName;
	//생성자
	public GoodsVo() {
		super();
	}
	
	public GoodsVo(int gno, String name, int price) {
		this.gno = gno;
		this.name = name;
		this.price = price;
	}

	public GoodsVo(int gno, int fno, int price, String name, String descript, long imgSize, String imgPath,
			String imgName) {
		super();
		this.gno = gno;
		this.fno = fno;
		this.price = price;
		this.name = name;
		this.descript = descript;
		this.imgSize = imgSize;
		this.imgPath = imgPath;
		this.imgName = imgName;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public long getImgSize() {
		return imgSize;
	}

	public void setImgSize(long imgSize) {
		this.imgSize = imgSize;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	@Override
	public String toString() {
		return "GoodsVo [gno=" + gno + ", fno=" + fno + ", price=" + price + ", name=" + name + ", descript=" + descript
				+ ", imgSize=" + imgSize + ", imgPath=" + imgPath + ", imgName=" + imgName + "]";
	}
	
	

	
	

}
