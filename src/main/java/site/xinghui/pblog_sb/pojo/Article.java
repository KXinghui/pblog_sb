package site.xinghui.pblog_sb.pojo;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import site.xinghui.pblog_sb.enums.ArticleStatu;
import site.xinghui.pblog_sb.validator.Delete;
import site.xinghui.pblog_sb.validator.Insert;
import site.xinghui.pblog_sb.validator.Update;

//@Alias("article")
public class Article {
	@NotNull(groups = { Update.class, Delete.class })
	private Integer id;
	@NotBlank(groups = Insert.class)
	@Size(min = 5, max = 25)
	private String title;
	@NotBlank(groups = { Insert.class, Update.class })
	@Size(min = 5, max = 60, groups = { Insert.class, Update.class })
	private String subTitle;
	private Integer clickNum;
	private Integer viewNum;
	// private Integer visible;
	private ArticleStatu articleStatu;
	private LocalDateTime createDate;
	private LocalDateTime updateDate;
	private Integer uid;
	@NotNull(groups = { Insert.class, Update.class })
	private Integer cid;
	// id INT(11) NOT NULL AUTO_INCREMENT,
	// title VARCHAR(255) DEFAULT NULL,
	// subTitle VARCHAR(255) DEFAULT NULL,
	// clickNum INT DEFAULT NULL COMMENT '点击量',
	// viewNum INT DEFAULT NULL COMMENT '浏览量',
	// visible TINYINT DEFAULT NULL COMMENT '显示/隐藏',
	// createDate TIMESTAMP,
	// cid INT(11) DEFAULT NULL,

	/* 非数据库字段 */
	private User user;
	private Category category;
	private List<ArticleImage> articleImages;
	private ArticleContent articleContent;
	// 收藏量
	private Integer collectNum;

	public Article() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public Integer getClickNum() {
		return clickNum;
	}

	public void setClickNum(Integer clickNum) {
		this.clickNum = clickNum;
	}

	public Integer getViewNum() {
		return viewNum;
	}

	public void setViewNum(Integer viewNum) {
		this.viewNum = viewNum;
	}

	public ArticleStatu getArticleStatu() {
		return articleStatu;
	}

	public void setArticleStatu(ArticleStatu articleStatu) {
		this.articleStatu = articleStatu;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public LocalDateTime getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(LocalDateTime updateDate) {
		this.updateDate = updateDate;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<ArticleImage> getArticleImages() {
		return articleImages;
	}

	public void setArticleImages(List<ArticleImage> articleImages) {
		this.articleImages = articleImages;
	}

	public ArticleContent getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(ArticleContent articleContent) {
		this.articleContent = articleContent;
	}

	public Integer getCollectNum() {
		return collectNum;
	}

	public void setCollectNum(Integer collectNum) {
		this.collectNum = collectNum;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", subTitle=" + subTitle + ", clickNum=" + clickNum
				+ ", viewNum=" + viewNum + ", articleStatu=" + articleStatu + ", createDate=" + createDate
				+ ", updateDate=" + updateDate + ", uid=" + uid + ", cid=" + cid + ", user=" + user + ", category="
				+ category + ", articleImages=" + articleImages + ", articleContent=" + articleContent + ", collectNum="
				+ collectNum + "]";
	}

	public static void main(String[] args) {
		String[] browserIconAuthSuffix = { "icon" };
		System.out.println(Arrays.asList(browserIconAuthSuffix).toString());
	}

}
