package site.xinghui.pblog_sb.pojo;

import java.util.Map;

import javax.validation.constraints.NotBlank;

import site.xinghui.pblog_sb.validator.Get;
import site.xinghui.pblog_sb.validator.Insert;
import site.xinghui.pblog_sb.validator.Update;

//@Alias("user")
public class User {

	private Integer id;
	@NotBlank(groups = { Insert.class, Get.class }) /* (message = "用户名不为空") */
	private String name;
	@NotBlank(groups = { Insert.class, Get.class, Update.class }) /* (message = "密码不为空") */
	private String password;
	@NotBlank(groups = { Insert.class, Update.class })
	private String repassword;
	private String headImg;

	/* 非数据库字段 */
	private UserInfo userInfo;

	private Map<String, Integer> userNum;

	public User() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public Map<String, Integer> getUserNum() {
		return userNum;
	}

	public void setUserNum(Map<String, Integer> userNum) {
		this.userNum = userNum;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", repassword=" + repassword
				+ ", headImg=" + headImg + ", userInfo=" + userInfo + ", userNum=" + userNum + "]";
	}

	public static void main(String[] args) {

	}
}
