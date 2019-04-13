package site.xinghui.pblog_sb.service;

import java.util.List;

import site.xinghui.pblog_sb.enums.ArticleStatu;
import site.xinghui.pblog_sb.enums.Visibility;
import site.xinghui.pblog_sb.pojo.ArticleFavority;

public interface ArticleFavorityService extends BaseService<ArticleFavority> {
	void delete2(ArticleFavority articleFavority);
	/* 批量操作 */

	List<Integer> batchInsert(List<ArticleFavority> articleFavoritys);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<ArticleFavority> articleFavoritys);

	/* 动态操作 */

	void dynamicInsert(ArticleFavority articleFavority);

	void dynamicUpdate(ArticleFavority articleFavority);

	/* 动态批量操作 */

	// void dynamicBatchInsert(List<ArticleFavority> articleFavoritys);

	void dynamicBatchUpdate(List<ArticleFavority> articleFavoritys);

	/* 查询获取 */
	ArticleFavority getByArticleAndGroup(Integer aid, Integer gid);

	List<ArticleFavority> listByGroup(Integer gid);

	Integer countByGroup(Integer gid);

	List<ArticleFavority> listByGroupAndArticleStatu(Integer gid, ArticleStatu articleStatu);

	List<ArticleFavority> listByUserAndArticle(Integer uid, Integer aid);

	Integer countByArticle(Integer aid);

	Integer countByUserAndVisibility(Integer uid, Visibility visibility);

	List<Integer> listIdByUserAndVisibility(Integer uid, Visibility visibility);

	List<ArticleFavority> listByUserAndVisibility(Integer uid, Visibility visibility, ArticleStatu articleStatu);
}
