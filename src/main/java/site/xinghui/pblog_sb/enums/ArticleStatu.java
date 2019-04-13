package site.xinghui.pblog_sb.enums;

import site.xinghui.pblog_sb.pojo.Article;

//@Alias("articleStatu")
public enum ArticleStatu implements BaseEnum {
	WAIT_PUBLISH(0, "待发布"), PUBLISH(1, "已发布"), DELETED(2, "已删除");
	private int id;
	private String value;

	private ArticleStatu(int id, String value) {
		this.id = id;
		this.value = value;
	}

	@Override
	public int getId() {
		return id;
	}

	@Override
	public String getValue() {
		return value;
	}

	public static void main(String[] args) {
		ArticleStatu articleStatu = ArticleStatu.WAIT_PUBLISH;
		String msg = "yes";
		Article article = new Article();

		article.setArticleStatu(ArticleStatu.WAIT_PUBLISH);
		System.out.println(!article.getArticleStatu().equals(ArticleStatu.PUBLISH));
		System.out.println(String.format("%s-%s", msg, articleStatu.toString()));
		System.out.println(articleStatu);

	}
}
