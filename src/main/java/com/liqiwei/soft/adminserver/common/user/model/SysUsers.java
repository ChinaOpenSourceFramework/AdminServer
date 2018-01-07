package com.liqiwei.soft.adminserver.common.user.model;

public class SysUsers {
	private Integer userId;
	private String userName;
	private String password;
	private String salt;
	private String realName;
	private Integer departId;
	private String userPhoto;
	private String userPhone;
	private String userQq;
	private String userEmail;
	private Boolean locked;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName == null ? null : userName.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt == null ? null : salt.trim();
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName == null ? null : realName.trim();
	}

	public Integer getDepartId() {
		return departId;
	}

	public void setDepartId(Integer departId) {
		this.departId = departId;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto == null ? null : userPhoto.trim();
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone == null ? null : userPhone.trim();
	}

	public String getUserQq() {
		return userQq;
	}

	public void setUserQq(String userQq) {
		this.userQq = userQq == null ? null : userQq.trim();
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail == null ? null : userEmail.trim();
	}

	public Boolean getLocked() {
		return locked;
	}

	public void setLocked(Boolean locked) {
		this.locked = locked;
	}

	public String getCredentialsSalt() {
		return userName + salt;
	}

	@Override
	public String toString() {
		return "SysUsers [userId=" + userId + ", userName=" + userName + ", password=" + password + ", salt=" + salt
				+ ", realName=" + realName + ", departId=" + departId + ", userPhoto=" + userPhoto + ", userPhone="
				+ userPhone + ", userQq=" + userQq + ", userEmail=" + userEmail + ", locked=" + locked + "]";
	}

}
