package site.xinghui.pblog_sb.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import site.xinghui.pblog_sb.pojo.UserInfo;

public interface UserInfoMapper extends BaseMapper<UserInfo> {
	void delete2(UserInfo userInfo);
	/* 批量操作 */

	void batchInsert(List<UserInfo> userInfos);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<UserInfo> userInfos);

	/* 动态操作 */

	void dynamicInsert(UserInfo userInfo);

	void dynamicUpdate(UserInfo userInfo);

	/* 动态批量操作 */

	// void dynamicBatchInsert(List<UserInfo> userInfos);

	// void dynamicBatchUpdate(List<UserInfo> userInfos);

	/* 查询获取 */

	UserInfo getByUser(Integer uid);

	UserInfo getByNameAndPass(UserInfo userInfo);

	List<UserInfo> listFuzzyByName(@Param("name") String name);

	List<UserInfo> listMulCondition(Map<String, Object> params);
}
