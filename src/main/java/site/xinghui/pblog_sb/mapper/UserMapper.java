package site.xinghui.pblog_sb.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import site.xinghui.pblog_sb.pojo.User;

public interface UserMapper extends BaseMapper<User> {
	void delete2(User user);
	/* 批量操作 */

	void batchInsert(List<User> users);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<User> users);

	/* 动态操作 */

	void dynamicInsert(User user);

	void dynamicUpdate(User user);

	/* 动态批量操作 */

	// void dynamicBatchInsert(List<User> users);

	// void dynamicBatchUpdate(List<User> users);

	/* 查询获取 */

	User getByName(String name);

	User getByNameAndPass(User user);

	List<User> listFuzzyByName(@Param("name") String name);

	List<User> listMulConditionByIdAndName(Map<String, Object> params);

}
