package site.xinghui.pblog_sb.pojo;

import java.util.List;

//@Alias("category")
public class Category {
	private Integer id;
	private String name;

	/* 非数据库字段 */
	private List<Article> articles;

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

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
}
