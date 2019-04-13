package site.xinghui.pblog_sb.pojo;

import java.time.LocalDate;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import site.xinghui.pblog_sb.enums.Gender;

//@Alias("userInfo")
public class UserInfo {
	private Integer id;
	@NotBlank
	private String realName;
	private Gender gender;
	@NotBlank
	@Size(min = 11, max = 11)
	private String mobile;
	@NotBlank
	@Email /* (message = "邮箱格式必须是合法的") */
	private String email;
	@Past /* (message = "生日日期必须是当前过去的") */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birthday;
	@NotBlank
	private String address;
	@NotBlank
	private String dictum;
	private String browserIcon;
	private String headImg;
	private String backgroundImg;
	private String wnMaxCard;
	private Integer uid;

	// id INT AUTO_INCREMENT NOT NULL,
	// realName VARCHAR(255) DEFAULT NULL COMMENT '真实姓名',
	// gender VARCHAR(255) DEFAULT NULL COMMENT '性别',
	// mobile VARCHAR(255) DEFAULT NULL COMMENT '手机号码',
	// email VARCHAR(255) DEFAULT NULL COMMENT '邮箱',
	// birthday DATE DEFAULT NULL COMMENT '生日',
	// address VARCHAR(255) DEFAULT NULL COMMENT '地址',
	// dictum VARCHAR(255) DEFAULT NULL COMMENT '名言',
	// browserIcon VARCHAR(255) DEFAULT NULL COMMENT '浏览器图标',
	// headImg VARCHAR(255) DEFAULT NULL COMMENT '头像',
	// backgroundImg VARCHAR(255) DEFAULT NULL COMMENT '背景图片',
	// wnMaxCard VARCHAR(255) DEFAULT NULL COMMENT '微信二维码名片',
	// uid INT DEFAULT NULL COMMENT '用户',

	/* 非数据库字段 */
	private User user;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDictum() {
		return dictum;
	}

	public void setDictum(String dictum) {
		this.dictum = dictum;
	}

	public String getBrowserIcon() {
		return browserIcon;
	}

	public void setBrowserIcon(String browserIcon) {
		this.browserIcon = browserIcon;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public String getBackgroundImg() {
		return backgroundImg;
	}

	public void setBackgroundImg(String backgroundImg) {
		this.backgroundImg = backgroundImg;
	}

	public String getWnMaxCard() {
		return wnMaxCard;
	}

	public void setWnMaxCard(String wnMaxCard) {
		this.wnMaxCard = wnMaxCard;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", realName=" + realName + ", gender=" + gender + ", mobile=" + mobile
				+ ", email=" + email + ", birthday=" + birthday + ", address=" + address + ", dictum=" + dictum
				+ ", browserIcon=" + browserIcon + ", headImg=" + headImg + ", backgroundImg=" + backgroundImg
				+ ", wnMaxCard=" + wnMaxCard + ", uid=" + uid + ", user=" + user + "]";
	}

}
