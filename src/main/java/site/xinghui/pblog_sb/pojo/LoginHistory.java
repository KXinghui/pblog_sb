package site.xinghui.pblog_sb.pojo;

import java.time.LocalDateTime;

//@Alias("loginHistory")
public class LoginHistory {
	private Integer id;
	private String ip;
	private Integer isLogin;
	private LocalDateTime loginTime;
	private Integer uid;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Integer getIsLogin() {
		return isLogin;
	}

	public void setIsLogin(Integer isLogin) {
		this.isLogin = isLogin;
	}

	public LocalDateTime getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(LocalDateTime loginTime) {
		this.loginTime = loginTime;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	@Override
	public String toString() {
		return "LoginHistory [id=" + id + ", ip=" + ip + ", isLogin=" + isLogin + ", uid=" + uid + "]";
	}

}
