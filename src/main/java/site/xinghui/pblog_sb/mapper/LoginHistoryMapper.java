package site.xinghui.pblog_sb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.xinghui.pblog_sb.pojo.LoginHistory;

public interface LoginHistoryMapper extends BaseMapper<LoginHistory> {
	/* 批量操作 */

	void batchInsert(List<LoginHistory> loginHistorys);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<LoginHistory> loginHistorys);

	/* 动态操作 */

	void dynamicInsert(LoginHistory loginHistory);

	void dynamicUpdate(LoginHistory loginHistory);

	/* 动态批量操作 */

	// void dynamicBatchInsert(List<LoginHistory> loginHistorys);

	// void dynamicBatchUpdate(List<LoginHistory> loginHistorys);

	/* 查询获取 */

	List<LoginHistory> listByUser(Integer uid);

	/* isLogin 为1[登陆成功]或0[登陆失败] */
	List<LoginHistory> listByUserAndIsLogin(@Param("uid") Integer uid, @Param("isLogin") Integer isLogin);

	Integer count();
}
