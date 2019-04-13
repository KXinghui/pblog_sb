package site.xinghui.pblog_sb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.xinghui.pblog_sb.mapper.UserSettingMapper;
import site.xinghui.pblog_sb.pojo.UserSetting;
import site.xinghui.pblog_sb.service.UserSettingService;

@Service
@Transactional
public class UserSettingServiceImpl implements UserSettingService {
	@Autowired
	UserSettingMapper userSettingMapper;

	@Override
	public Integer insert(UserSetting t) {
		userSettingMapper.insert(t);
		return t.getId();
	}

	@Override
	public void delete(Integer id) {
		userSettingMapper.delete(id);
	}

	@Override
	public void update(UserSetting t) {
		userSettingMapper.update(t);
	}

	@Override
	public UserSetting get(Integer id) {
		UserSetting userSetting = userSettingMapper.get(id);
		return userSetting;
	}

	@Override
	public List<UserSetting> list() {
		List<UserSetting> userSettings = userSettingMapper.list();
		return userSettings;
	}

	@Override
	public void delete2(UserSetting userSetting) {
		userSettingMapper.delete2(userSetting);
	}

	@Override
	public Integer count() {
		return userSettingMapper.count();
	}

	@Override
	public List<Integer> batchInsert(List<UserSetting> userSettings) {
		List<Integer> ids = new ArrayList<>();
		userSettingMapper.batchInsert(userSettings);
		for (UserSetting userSetting : userSettings) {
			ids.add(userSetting.getId());
		}
		return ids;
	}

	@Override
	public void batchDelete(List<Integer> ids) {
		userSettingMapper.batchDelete(ids);
	}

	@Override
	public void dynamicInsert(UserSetting userSetting) {
		userSettingMapper.dynamicInsert(userSetting);
	}

	@Override
	public void dynamicUpdate(UserSetting userSetting) {
		userSettingMapper.dynamicUpdate(userSetting);
	}

	@Override
	public UserSetting getByUser(Integer uid) {
		return userSettingMapper.getByUser(uid);
	}

}
