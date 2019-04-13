package site.xinghui.pblog_sb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.xinghui.pblog_sb.enums.GroupType;
import site.xinghui.pblog_sb.enums.Visibility;
import site.xinghui.pblog_sb.pojo.Group;

public interface GroupMapper extends BaseMapper<Group> {
	void delete2(Group group);
	/* 批量操作 */

	void batchInsert(List<Group> groups);

	void batchDelete(List<Integer> ids);

	// void batchUpdate(List<Group> groups);

	/* 动态操作 */

	void dynamicInsert(Group group);

	void dynamicUpdate(Group group);

	/* 动态批量操作 */

	// void dynamicBatchInsert(List<Group> groups);

	// void dynamicBatchUpdate(List<Group> groups);

	/* 查询获取 */

	Group getByUserNameAndGroupType(@Param("uid") Integer uid, @Param("name") String name,
			@Param("groupType") GroupType groupType);

	List<Group> listByUser(Integer uid);

	List<Group> listByUserAndGroupType(@Param("uid") Integer uid, @Param("groupType") GroupType groupType);

	List<Group> listByUserGroupTypeAndVisibility(@Param("uid") Integer uid, @Param("groupType") GroupType groupType,
			@Param("visibility") Visibility visibility);

	List<Integer> listGroupIdByUser(Integer uid);

	List<Integer> listGroupId(Group group);
}
