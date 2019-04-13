package site.xinghui.pblog_sb.service;

import java.util.List;

import site.xinghui.pblog_sb.pojo.LoginHistory;

public interface LoginHistoryService extends BaseService<LoginHistory> {
	/* 批量操作 */

	List<Integer> batchInsert(List<LoginHistory> loginHistorys);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<LoginHistory> loginHistorys);

	/* 动态操作 */

	Integer dynamicInsert(LoginHistory loginHistory);

	void dynamicUpdate(LoginHistory loginHistory);

	/* 动态批量操作 */

	// void dynamicBatchInsert(List<LoginHistory> loginHistorys);

	// void dynamicBatchUpdate(List<LoginHistory> loginHistorys);

	/* 查询获取 */

	List<LoginHistory> listByUser(Integer uid);

	/* isLogin 为1[登陆成功]或0[登陆失败] */
	List<LoginHistory> listByUserAndIsLogin(Integer uid, Integer isLogin);

	Integer count();
}
