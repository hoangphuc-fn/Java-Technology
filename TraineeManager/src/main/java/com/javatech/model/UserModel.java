package com.javatech.model;

import java.sql.Timestamp;

public class UserModel extends AbstractModel<UserModel> {
	
	private String email;
	private String userName;
	private String password;
	private String phoneNumber;
	private String address;
	private Timestamp DOB;
	private String university;
	private Long roleId;
	private int status;
	private Timestamp deactivedAt;
	private RoleModel role = new RoleModel();
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Timestamp getDOB() {
		return DOB;
	}
	public void setDOB(Timestamp dOB) {
		this.DOB = dOB;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public RoleModel getRole() {
		return role;
	}
	public void setRole(RoleModel role) {
		this.role = role;
	}
	public Timestamp getDeactivedAt() {
		return deactivedAt;
	}
	public void setDeactivedAt(Timestamp deactivedAt) {
		this.deactivedAt = deactivedAt;
	}
	
}
