package site.xinghui.pblog_sb.service;

import java.util.List;
import java.util.Map;

import site.xinghui.pblog_sb.enums.ArticleStatu;
import site.xinghui.pblog_sb.pojo.Article;

public interface ArticleService extends BaseService<Article> {
	void delete2(Article article);
	/* 非常规操作 */

	/* 批量操作 */
	List<Integer> batchInsert(List<Article> articles);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<Article> articles);

	/* 动态操作 */
	void dynamicInsert(Article article);

	void dynamicUpdate(Article article);

	/* 动态批量操作 */
	// List<Integer> dynamicBatchInsert(List<Article> articles);

	// void dynamicBatchUpdate(List<Article> articles);

	/* 业务逻辑方法 */

	ArticleStatu getArticleStatu(Integer id);

	Article getByTitle(String title);

	List<Article> listFuzzyByTitle(String title);

	Article getBySubTitle(String subTitle);

	List<Article> listFuzzyBySubTitle(String subTitle);

	List<Article> listMulCondition(Map<String, Object> params);

	List<Article> listByCategory(Integer cid);

	List<Article> listByCategoryAndArticleStatu(Integer cid, ArticleStatu articleStatu);

	List<Article> listByUser(Integer uid);

	List<Integer> listArtileIdByUser(Integer uid);

	List<Article> listByUserAndArticleStatu(Integer uid, ArticleStatu articleStatu);

	Integer countByCategory(Integer cid);

	Integer countByCategoryAndArticleStatu(Integer cid, ArticleStatu articleStatu);

	Integer countByUserAndArticleStatu(Integer uid, ArticleStatu articleStatu);

	Map<String, Integer> countNumberOfClickViewByUserAndArticleStatu(Integer uid, ArticleStatu articleStatu);

	List<Article> listMulConditionByArticle(Article article);

	Integer countMulConditionByArticle(Article article);

}
