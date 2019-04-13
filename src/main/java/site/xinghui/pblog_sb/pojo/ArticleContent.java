package site.xinghui.pblog_sb.pojo;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import site.xinghui.pblog_sb.validator.Delete;
import site.xinghui.pblog_sb.validator.Update;

//@Alias("articleContent")
public class ArticleContent {
	@NotNull(groups = { Update.class, Delete.class })
	private Integer id;
	@NotBlank(groups = { Update.class })
	private String mdContent;
	private String htmlContent;
	@NotNull(groups = { Update.class, Delete.class })
	private Integer aid;

	/* 非数据库字段 */
	private Article article;
	private List<Article> articles;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMdContent() {
		return mdContent;
	}

	public void setMdContent(String mdContent) {
		this.mdContent = mdContent;
	}

	public String getHtmlContent() {
		return htmlContent;
	}

	public void setHtmlContent(String htmlContent) {
		this.htmlContent = htmlContent;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}

	@Override
	public String toString() {
		return "ArticleContent [id=" + id + ", mdContent=" + mdContent + ", htmlContent=" + htmlContent + ", aid=" + aid
				+ ", article=" + article + ", articles=" + articles + "]";
	}

}
