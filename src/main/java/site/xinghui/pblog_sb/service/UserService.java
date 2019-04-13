package site.xinghui.pblog_sb.service;

import java.util.List;
import java.util.Map;

import site.xinghui.pblog_sb.pojo.User;

public interface UserService extends BaseService<User> {
	void delete2(User user);
	/* 非常规操作 */

	/* 批量操作 */
	List<Integer> batchInsert(List<User> users);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<User> users);

	/* 动态操作 */
	Integer dynamicInsert(User user);

	void dynamicUpdate(User user);

	/* 动态批量操作 */
	// List<Integer> dynamicBatchInsert(List<User> users);

	// void dynamicBatchUpdate(List<User> users);

	/* 业务逻辑方法 */
	User getByName(String name);

	User getByNameAndPass(User user);

	List<User> listFuzzyByName(String name);

	List<User> listMulConditionByIdAndName(Map<String, Object> params);
}
