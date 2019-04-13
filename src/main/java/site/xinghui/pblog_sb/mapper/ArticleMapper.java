package site.xinghui.pblog_sb.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import site.xinghui.pblog_sb.enums.ArticleStatu;
import site.xinghui.pblog_sb.pojo.Article;

public interface ArticleMapper extends BaseMapper<Article> {
	void delete2(Article article);
	/* 批量操作 */

	void batchInsert(List<Article> articles);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<Article> articles);

	/* 动态操作 */

	void dynamicInsert(Article article);

	void dynamicUpdate(Article article);

	/* 动态批量操作 */

	// void dynamicBatchInsert(List<Article> articles);

	// void dynamicBatchUpdate(List<Article> articles);

	/* 查询获取 */

	ArticleStatu getArticleStatu(Integer id);

	Article getByTitle(String title);

	Article getBySubTitle(String subTitle);

	List<Article> listFuzzyByTitle(@Param("title") String title);

	List<Article> listFuzzyBySubTitle(@Param("subTitle") String subTitle);

	List<Article> listMulCondition(Map<String, Object> params);

	List<Article> listByCategory(Integer cid);

	List<Article> listByCategoryAndArticleStatu(@Param("cid") Integer cid,
			@Param("articleStatu") ArticleStatu articleStatu);

	List<Article> listByUser(Integer uid);

	List<Integer> listArtileIdByUser(Integer uid);

	List<Article> listByUserAndArticleStatu(@Param("uid") Integer uid,
			@Param("articleStatu") ArticleStatu articleStatu);

	Integer countByCategory(Integer cid);

	Integer countByCategoryAndArticleStatu(@Param("cid") Integer cid, @Param("articleStatu") ArticleStatu articleStatu);

	Map<String, Integer> countNumberOfClickViewByUserAndArticleStatu(@Param("uid") Integer uid,
			@Param("articleStatu") ArticleStatu articleStatu);

	Integer countByUserAndArticleStatu(@Param("uid") Integer uid, @Param("articleStatu") ArticleStatu articleStatu);

	List<Article> listMulConditionByArticle(Article article);

	Integer countMulConditionByArticle(Article article);
}
