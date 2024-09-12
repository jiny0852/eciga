package com.javaex.vo;

public class UserVo {

	private int uno;
    private String name;
	private String uid;
	private String password;
    private int ssn;
	private String hp;
    private String address;
    private int role;
    private String birth;
    private int status;

    public UserVo() {
		super();
	}

	public UserVo(int uno, String name, String uid, String password, int ssn, String hp, String address, int role,
			String birth, int status) {
		super();
		this.uno = uno;
		this.name = name;
		this.uid = uid;
		this.password = password;
		this.ssn = ssn;
		this.hp = hp;
		this.address = address;
		this.role = role;
		this.birth = birth;
		this.status = status;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getSsn() {
		return ssn;
	}

	public void setSsn(int ssn) {
		this.ssn = ssn;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "UserVo [uno=" + uno + ", name=" + name + ", uid=" + uid + ", password=" + password + ", ssn=" + ssn
				+ ", hp=" + hp + ", address=" + address + ", role=" + role + ", birth=" + birth + ", status=" + status
				+ "]";
	}




    
    


}