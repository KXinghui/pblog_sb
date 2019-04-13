package site.xinghui.pblog_sb.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import site.xinghui.pblog_sb.pojo.User;
import site.xinghui.pblog_sb.pojo.UserFollow;

public interface UserFollowMapper extends BaseMapper<UserFollow> {
	void delete2(UserFollow userFollow);
	/* 批量操作 */

	void batchInsert(List<UserFollow> userFollows);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<UserFollow> userFollows);

	/* 动态操作 */

	void dynamicInsert(UserFollow userFollow);

	void dynamicUpdate(UserFollow userFollow);

	/* 动态批量操作 */

	void dynamicBatchInsert(List<UserFollow> userFollows);

	void dynamicBatchUpdate(List<UserFollow> userFollows);

	/* 查询获取 */

	UserFollow getByUserAndGroup(@Param("uid") Integer uid, @Param("gid") Integer gid);

	List<UserFollow> listByGroup(Integer gid);

	Integer countByGroup(Integer gid);

	/* 个人关注用户数 */
	Integer countFollowUserNumByUser(Integer uid);

	/* 个人粉丝数 */
	Integer countFansNumByUser(Integer uid);

	List<User> listFollowUserByUser(Integer uid);

	List<Integer> listFansIdByUser(Integer uid);

	List<User> listFansByUser(Integer uid);

	List<UserFollow> listByFollowerAndUser(@Param("followerid") Integer followerid, @Param("uid") Integer uid);

	/* 个人每组关注用户数 */
	Map<String, Map<String, Integer>> countFollowUserByUserGroupByGroup(Integer uid);

}
