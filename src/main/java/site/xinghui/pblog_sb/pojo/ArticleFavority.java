package site.xinghui.pblog_sb.pojo;

import java.time.LocalDateTime;

//@Alias("articleFavority")
public class ArticleFavority {
	private Integer id;
	private Integer aid;
	private Integer gid;
	private LocalDateTime createTime;

	/* 非数据字段 */
	private User author;
	private Article article;
	private Group group;

	public ArticleFavority() {
	}

	public ArticleFavority(Integer aid, Integer gid) {
		super();
		this.aid = aid;
		this.gid = gid;
	}

	public ArticleFavority(Integer id, Integer aid, Integer gid) {
		super();
		this.id = id;
		this.aid = aid;
		this.gid = gid;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public LocalDateTime getCreateTime() {
		return createTime;
	}

	public void setCreateTime(LocalDateTime createTime) {
		this.createTime = createTime;
	}

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	@Override
	public String toString() {
		return "ArticleFavority [id=" + id + ", aid=" + aid + ", gid=" + gid + ", createTime=" + createTime
				+ ", author=" + author + ", article=" + article + ", group=" + group + "]";
	}

}
