package site.xinghui.pblog_sb.pojo;

import java.time.LocalDateTime;

//@Alias("articleHistory")
public class ArticleHistory {
	private Integer id;
	private Integer uid;
	private Integer aid;
	private LocalDateTime createDate;

	/* 非数据库字段 */
	private User user;
	private Article article;

	public ArticleHistory() {
	}

	public ArticleHistory(Integer id, Integer uid, Integer aid) {
		this.id = id;
		this.uid = uid;
		this.aid = aid;
	}

	public ArticleHistory(Integer uid, Integer aid, LocalDateTime createDate) {
		super();
		this.uid = uid;
		this.aid = aid;
		this.createDate = createDate;
	}

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

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	@Override
	public String toString() {
		return "ArticleHistory [id=" + id + ", uid=" + uid + ", aid=" + aid + ", createDate=" + createDate + ", user="
				+ user + ", article=" + article + "]";
	}

}
