package site.xinghui.pblog_sb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.xinghui.pblog_sb.pojo.Category;

public interface CategoryMapper extends BaseMapper<Category> {
	/* 批量操作 */

	void batchInsert(List<Category> categorys);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<Category> categorys);

	/* 动态操作 */

	void dynamicInsert(Category category);

	void dynamicUpdate(Category category);

	/* 动态批量操作 */

	// void dynamicBatchInsert(List<Category> categorys);

	// void dynamicBatchUpdate(List<Category> categorys);

	/* 查询获取 */

	Category getByName(String name);

	List<Category> listFuzzyByName(@Param("name") String name);
}
