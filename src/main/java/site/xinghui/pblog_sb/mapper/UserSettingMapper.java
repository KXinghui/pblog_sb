package site.xinghui.pblog_sb.mapper;

import java.util.List;

import site.xinghui.pblog_sb.pojo.UserSetting;

public interface UserSettingMapper extends BaseMapper<UserSetting> {
	void delete2(UserSetting article);
	/* 批量操作 */

	void batchInsert(List<UserSetting> articles);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<UserSetting> articles);

	/* 动态操作 */

	void dynamicInsert(UserSetting article);

	void dynamicUpdate(UserSetting article);

	/* 动态批量操作 */

	// void dynamicBatchInsert(List<UserSetting> articles);

	// void dynamicBatchUpdate(List<UserSetting> articles);

	/* 查询获取 */
	UserSetting getByUser(Integer uid);

}
