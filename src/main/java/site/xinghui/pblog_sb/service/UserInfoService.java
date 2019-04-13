package site.xinghui.pblog_sb.service;

import java.util.List;
import java.util.Map;

import site.xinghui.pblog_sb.pojo.UserInfo;

public interface UserInfoService extends BaseService<UserInfo> {
	void delete2(UserInfo userInfo);
	/* 非常规操作 */

	/* 批量操作 */
	List<Integer> batchInsert(List<UserInfo> userInfos);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<UserInfo> userInfos);

	/* 动态操作 */
	Integer dynamicInsert(UserInfo userInfo);

	void dynamicUpdate(UserInfo userInfo);

	/* 动态批量操作 */
	// List<Integer> dynamicBatchInsert(List<UserInfo> userInfos);

	// void dynamicBatchUpdate(List<UserInfo> userInfos);

	/* 业务逻辑方法 */

	UserInfo getByUser(Integer uid);

	List<UserInfo> listFuzzyByName(String name);

	List<UserInfo> listMulConditionByIdAndName(Map<String, Object> params);
}
