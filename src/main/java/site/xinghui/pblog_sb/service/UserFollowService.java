package site.xinghui.pblog_sb.service;

import java.util.List;

import site.xinghui.pblog_sb.pojo.User;
import site.xinghui.pblog_sb.pojo.UserFollow;

public interface UserFollowService extends BaseService<UserFollow> {
	void delete2(UserFollow userFollow);
	/* 批量操作 */

	List<Integer> batchInsert(List<UserFollow> userFollows);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<UserFollow> userFollows);

	/* 动态操作 */

	void dynamicInsert(UserFollow userFollow);

	void dynamicUpdate(UserFollow userFollow);

	/* 动态批量操作 */

	void dynamicBatchInsert(List<UserFollow> userFollows);

	void dynamicBatchUpdate(List<UserFollow> userFollows);

	/* 查询获取 */

	UserFollow getByUserAndGroup(Integer uid, Integer gid);

	List<UserFollow> listByGroup(Integer gid);

	Integer countByGroup(Integer gid);

	// Map<String, Map<String,Integer>> countByGroups(List<Integer> gids);
	/* 个人关注用户数 */
	Integer countFollowUserNumByUser(Integer uid);

	/* 个人粉丝数 */
	Integer countFansNumByUser(Integer uid);

	List<User> listFollowUserByUser(Integer uid);

	List<User> listFansByUser(Integer uid);

	List<UserFollow> listByFollowerAndUser(Integer followerid, Integer uid);

	/* 个人每组关注用户数 */
	// Map<String, Map<String, Integer>> countFollowUserByUserGroupByGroup(Integer
	// uid);

}
