package site.xinghui.pblog_sb.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.xinghui.pblog_sb.enums.ArticleStatu;
import site.xinghui.pblog_sb.mapper.UserFollowMapper;
import site.xinghui.pblog_sb.pojo.User;
import site.xinghui.pblog_sb.pojo.UserFollow;
import site.xinghui.pblog_sb.service.ArticleService;
import site.xinghui.pblog_sb.service.GroupService;
import site.xinghui.pblog_sb.service.UserFollowService;
import site.xinghui.pblog_sb.service.UserService;

@Service
@Transactional
public class UserFollowServiceImpl implements UserFollowService {
	@Autowired
	UserFollowMapper userFollowMapper;

	@Autowired
	UserService userService;
	@Autowired
	ArticleService articleService;
	@Autowired
	GroupService groupService;

	@Override
	public Integer insert(UserFollow t) {
		userFollowMapper.insert(t);
		return t.getId();
	}

	@Override
	public void delete(Integer id) {
		userFollowMapper.delete(id);
	}

	@Override
	public void update(UserFollow t) {
		userFollowMapper.update(t);
	}

	@Override
	public UserFollow get(Integer id) {
		return userFollowMapper.get(id);
	}

	@Override
	public List<UserFollow> list() {
		return userFollowMapper.list();
	}

	@Override
	public Integer count() {
		return userFollowMapper.count();
	}

	@Override
	public void delete2(UserFollow userFollow) {
		userFollowMapper.delete2(userFollow);
	}

	@Override
	public List<Integer> batchInsert(List<UserFollow> userFollows) {
		List<Integer> ids = new ArrayList<>();
		userFollowMapper.batchInsert(userFollows);
		for (UserFollow userFollow : userFollows) {
			ids.add(userFollow.getId());
		}
		return ids;
	}

	@Override
	public void batchDelete(List<Integer> ids) {
		userFollowMapper.batchDelete(ids);
	}

	@Override
	public void dynamicInsert(UserFollow userFollow) {
		userFollowMapper.dynamicInsert(userFollow);
	}

	@Override
	public void dynamicUpdate(UserFollow userFollow) {
		userFollowMapper.dynamicUpdate(userFollow);
	}

	@Override
	public void dynamicBatchInsert(List<UserFollow> userFollows) {
		userFollowMapper.dynamicBatchInsert(userFollows);
	}

	@Override
	public void dynamicBatchUpdate(List<UserFollow> userFollows) {
		userFollowMapper.dynamicBatchUpdate(userFollows);
	}

	@Override
	public UserFollow getByUserAndGroup(Integer uid, Integer gid) {
		return userFollowMapper.getByUserAndGroup(uid, gid);
	}

	@Override
	public List<UserFollow> listByGroup(Integer gid) {
		List<UserFollow> ufs = userFollowMapper.listByGroup(gid);

		setUserFollows(ufs);

		return userFollowMapper.listByGroup(gid);
	}

	@Override
	public Integer countByGroup(Integer gid) {
		return userFollowMapper.countByGroup(gid);
	}

	// @Override
	// public Map<String, Map<String,Integer>> countByGroups(List<Integer> gids) {
	// return userFollowMapper.countByGroups(gids);
	// }

	/* 个人关注用户数 */
	@Override
	public Integer countFollowUserNumByUser(Integer uid) {
		return userFollowMapper.countFollowUserNumByUser(uid);
	}

	/* 个人粉丝数 */
	@Override
	public Integer countFansNumByUser(Integer uid) {
		return userFollowMapper.countFansNumByUser(uid);
	}

	@Override
	public List<User> listFollowUserByUser(Integer uid) {
		List<User> follows = userFollowMapper.listFollowUserByUser(uid);
		for (User f : follows) {
			Integer fid = f.getId();
			Map<String, Integer> userNum = articleService.countNumberOfClickViewByUserAndArticleStatu(fid,
					ArticleStatu.PUBLISH);
			Integer fansNum = userFollowMapper.countFansNumByUser(fid);
			userNum.put("fansNum", fansNum);
			f.setUserNum(userNum);
		}
		return follows;
	}

	@Override
	public List<User> listFansByUser(Integer uid) {
		List<User> fans = userFollowMapper.listFansByUser(uid);
		for (User f : fans) {
			Integer fid = f.getId();
			Map<String, Integer> userNum = articleService.countNumberOfClickViewByUserAndArticleStatu(fid,
					ArticleStatu.PUBLISH);
			Integer fansNum = userFollowMapper.countFansNumByUser(fid);
			userNum.put("fansNum", fansNum);
			f.setUserNum(userNum);
		}
		return fans;
	}

	@Override
	public List<UserFollow> listByFollowerAndUser(Integer followerid, Integer uid) {
		return userFollowMapper.listByFollowerAndUser(followerid, uid);
	}

	/* 个人每组关注用户数 */
	// @Override
	// public Map<String, Map<String, Integer>>
	// countFollowUserByUserGroupByGroup(Integer uid) {
	// return userFollowMapper.countFollowUserByUserGroupByGroup(uid);
	// }

	public void setUserFollows(List<UserFollow> userFollows) {
		for (UserFollow userFollow : userFollows) {
			setUserFollow(userFollow);
		}
	}

	public void setUserFollow(UserFollow userFollow) {
		User user = userService.get(userFollow.getUid());
		user.setPassword(null);
		userFollow.setUser(user);
	}

	public static void main(String[] args) {

	}

}
