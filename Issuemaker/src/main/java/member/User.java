package member;

import java.time.LocalDate;

public class User {
	
	private String userId;
	private String userName;
	private LocalDate userBirth;
	private String userPhone;
	private String userEmail;
	private String userAddress;
	
	public User(String userId, String userName, LocalDate userBirth, String userPhone, String userEmail,
			String userAddress) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
	}

	public String getUserID() {
		return userId;
	}

	public void setUserID(String userID) {
		this.userId = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public LocalDate getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(LocalDate userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	@Override
	public String toString() {
		return "User [userID=" + userId + ", userName=" + userName + ", userBirth=" + userBirth + ", userPhone="
				+ userPhone + ", userEmail=" + userEmail + ", userAddress=" + userAddress + "]";
	}
	
	
	
}
