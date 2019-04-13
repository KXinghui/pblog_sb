package site.xinghui.pblog_sb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.xinghui.pblog_sb.enums.ArticleStatu;
import site.xinghui.pblog_sb.enums.Visibility;
import site.xinghui.pblog_sb.pojo.ArticleFavority;

public interface ArticleFavorityMapper extends BaseMapper<ArticleFavority> {
	void delete2(ArticleFavority articleFavority);
	/* 批量操作 */

	void batchInsert(List<ArticleFavority> articleFavoritys);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<ArticleFavority> articleFavoritys);

	/* 动态操作 */

	void dynamicInsert(ArticleFavority articleFavority);

	void dynamicUpdate(ArticleFavority articleFavority);

	/* 动态批量操作 */

	// void dynamicBatchInsert(List<ArticleFavority> articleFavoritys);

	void dynamicBatchUpdate(List<ArticleFavority> articleFavoritys);

	/* 查询获取 */

	ArticleFavority getByArticleAndGroup(@Param("aid") Integer aid, @Param("gid") Integer gid);

	Integer countByGroup(Integer gid);

	List<ArticleFavority> listByGroup(Integer gid);

	List<ArticleFavority> listByUserAndArticle(@Param("uid") Integer uid, @Param("aid") Integer aid);

	List<ArticleFavority> listByGroupAndArticleStatu(@Param("gid") Integer gid,
			@Param("articleStatu") ArticleStatu articleStatu);

	Integer countByArticle(Integer aid);

	Integer countByUserAndVisibility(@Param("uid") Integer uid, @Param("visibility") Visibility visibility);

	List<Integer> listIdByUserAndVisibility(@Param("uid") Integer uid, @Param("visibility") Visibility visibility);

	List<ArticleFavority> listByUserAndVisibility(@Param("uid") Integer uid,
			@Param("visibility") Visibility visibility);

}
