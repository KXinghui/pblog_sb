package site.xinghui.pblog_sb.service;

import java.util.List;

import site.xinghui.pblog_sb.pojo.ArticleContent;

public interface ArticleContentService extends BaseService<ArticleContent> {
	void delete2(ArticleContent articleContent);
	/* 批量操作 */

	List<Integer> batchInsert(List<ArticleContent> articleContents);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<ArticleContent> articleContents);

	/* 动态操作 */

	void dynamicInsert(ArticleContent articleContent);

	void dynamicUpdate(ArticleContent articleContent);

	/* 动态批量操作 */

	// void dynamicBatchInsert(List<ArticleContent> articleContents);

	// void dynamicBatchUpdate(List<ArticleContent> articleContents);
	void updateByArticle(ArticleContent articleContent);

	void deleteByArticle(Integer aid);

	void batchDeleteByArtice(List<Integer> aids);

	/* 查询获取 */

	ArticleContent getByArticle(Integer aid);

	List<ArticleContent> listByArticles(List<Integer> aids);

}
