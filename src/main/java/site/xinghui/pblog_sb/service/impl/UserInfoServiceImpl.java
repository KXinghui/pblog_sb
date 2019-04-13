package site.xinghui.pblog_sb.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.xinghui.pblog_sb.mapper.UserInfoMapper;
import site.xinghui.pblog_sb.pojo.UserInfo;
import site.xinghui.pblog_sb.service.UserInfoService;

@Service
@Transactional
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	UserInfoMapper userInfoMapper;

	@Override
	public Integer insert(UserInfo userInfo) {
		// SqlSession sqlSession = MyBatisUtil.getSqlSession(ENV);
		// userInfoMapper = sqlSession.getMapper(UserInfoMapper.class);
		userInfoMapper.insert(userInfo);
		// MyBatisUtil.closeSqlSession();
		return userInfo.getId();
	}

	@Override
	public void update(UserInfo userInfo) {
		userInfoMapper.update(userInfo);
	}

	@Override
	public void delete(Integer id) {
		userInfoMapper.delete(id);
	}

	public void delete2(UserInfo userInfo) {
		userInfoMapper.delete2(userInfo);
	}

	@Override
	public UserInfo get(Integer id) {
		UserInfo userInfo = userInfoMapper.get(id);
		return userInfo;
	}

	@Override
	public List<UserInfo> list() {
		List<UserInfo> userInfos = userInfoMapper.list();
		return userInfos;
	}

	@Override
	public Integer count() {
		return userInfoMapper.count();
	}

	/* 非常规操作 */

	/* 批量操作 */
	@Override
	public List<Integer> batchInsert(List<UserInfo> userInfos) {
		List<Integer> ids = new ArrayList<>();
		userInfoMapper.batchInsert(userInfos);
		for (UserInfo userInfo : userInfos) {
			ids.add(userInfo.getId());
		}
		return ids;
	}

	@Override
	public void batchDelete(List<Integer> ids) {
		userInfoMapper.batchDelete(ids);
	}

	// @Override
	// public void batchUpdate(List<UserInfo> userInfos) {
	// userInfoMapper.batchUpdate(userInfos);
	// }

	/* 动态操作 */
	@Override
	public Integer dynamicInsert(UserInfo userInfo) {
		userInfoMapper.dynamicInsert(userInfo);
		return userInfo.getId();
	}

	@Override
	public void dynamicUpdate(UserInfo userInfo) {
		userInfoMapper.dynamicUpdate(userInfo);
	}

	/* 动态批量操作 */
	// @Override
	// public List<Integer> dynamicBatchInsert(List<UserInfo> userInfos) {
	// List<Integer> ids = new ArrayList<>();
	// userInfoMapper.dynamicBatchInsert(userInfos);
	// for (UserInfo userInfo : userInfos) {
	// ids.add(userInfo.getId());
	// }
	// return ids;
	// }

	/* 查询获取 */

	@Override
	public UserInfo getByUser(Integer uid) {
		UserInfo userInfo = userInfoMapper.getByUser(uid);
		return userInfo;
	}

	/* 模糊查询 */
	@Override
	public List<UserInfo> listFuzzyByName(String name) {
		List<UserInfo> userInfos = userInfoMapper.listFuzzyByName(name);
		return userInfos;
	}

	/* 多条件查询 */
	@Override
	public List<UserInfo> listMulConditionByIdAndName(Map<String, Object> params) {
		List<UserInfo> userInfos = userInfoMapper.listMulCondition(params);
		return userInfos;
	}
	/* 业务逻辑方法 */

}
