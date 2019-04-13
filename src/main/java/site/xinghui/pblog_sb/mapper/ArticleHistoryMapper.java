package site.xinghui.pblog_sb.mapper;

import java.util.List;

import site.xinghui.pblog_sb.pojo.ArticleHistory;

public interface ArticleHistoryMapper extends BaseMapper<ArticleHistory> {
	void delete2(ArticleHistory articleHistory);
	/* 批量操作 */

	void batchInsert(List<ArticleHistory> articleHistorys);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<ArticleHistory> articleHistorys);

	/* 动态操作 */

	void dynamicInsert(ArticleHistory articleHistory);

	void dynamicUpdate(ArticleHistory articleHistory);

	/* 动态批量操作 */

	// void dynamicBatchInsert(List<ArticleHistory> articleHistorys);

	// void dynamicBatchUpdate(List<ArticleHistory> articleHistorys);

	/* 查询获取 */

	List<ArticleHistory> listByUser(Integer uid);

	Integer countByUser(Integer uid);

	List<Integer> listIdByUser(Integer uid);

	ArticleHistory getByArticleHistory(ArticleHistory articleHistory);
}
