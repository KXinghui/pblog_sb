package site.xinghui.pblog_sb.service;

import java.util.List;

import site.xinghui.pblog_sb.pojo.UserSetting;

public interface UserSettingService extends BaseService<UserSetting> {
	void delete2(UserSetting article);
	/* 非常规操作 */

	/* 批量操作 */
	List<Integer> batchInsert(List<UserSetting> articles);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<UserSetting> articles);

	/* 动态操作 */
	void dynamicInsert(UserSetting article);

	void dynamicUpdate(UserSetting article);

	/* 动态批量操作 */
	// List<Integer> dynamicBatchInsert(List<UserSetting> articles);

	// void dynamicBatchUpdate(List<UserSetting> articles);

	/* 业务逻辑方法 */

	UserSetting getByUser(Integer uid);

}
