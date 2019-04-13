package site.xinghui.pblog_sb.pojo;

//@Alias("userSetting")
public class UserSetting {
	private Integer id;
	private Integer uid;
	private Integer isRecordLoginSuccessHistory;
	private Integer isRecordLoginFailHistory;
	private Integer isRecordShowArticleHistory;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getIsRecordLoginSuccessHistory() {
		return isRecordLoginSuccessHistory;
	}

	public void setIsRecordLoginSuccessHistory(Integer isRecordLoginSuccessHistory) {
		this.isRecordLoginSuccessHistory = isRecordLoginSuccessHistory;
	}

	public Integer getIsRecordLoginFailHistory() {
		return isRecordLoginFailHistory;
	}

	public void setIsRecordLoginFailHistory(Integer isRecordLoginFailHistory) {
		this.isRecordLoginFailHistory = isRecordLoginFailHistory;
	}

	public Integer getIsRecordShowArticleHistory() {
		return isRecordShowArticleHistory;
	}

	public void setIsRecordShowArticleHistory(Integer isRecordShowArticleHistory) {
		this.isRecordShowArticleHistory = isRecordShowArticleHistory;
	}

}
