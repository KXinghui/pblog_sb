package site.xinghui.pblog_sb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.xinghui.pblog_sb.mapper.LoginHistoryMapper;
import site.xinghui.pblog_sb.pojo.LoginHistory;
import site.xinghui.pblog_sb.service.LoginHistoryService;

@Service
@Transactional
public class LoginHistoryServiceImpl implements LoginHistoryService {

	@Autowired
	LoginHistoryMapper loginHistoryMapper;

	@Override
	public Integer insert(LoginHistory t) {
		loginHistoryMapper.insert(t);
		return t.getId();
	}

	@Override
	public void delete(Integer id) {
		loginHistoryMapper.delete(id);
	}

	@Override
	public void update(LoginHistory t) {
		loginHistoryMapper.update(t);
	}

	@Override
	public LoginHistory get(Integer id) {
		return loginHistoryMapper.get(id);
	}

	@Override
	public List<LoginHistory> list() {
		return loginHistoryMapper.list();
	}

	@Override
	public List<Integer> batchInsert(List<LoginHistory> loginHistorys) {
		List<Integer> ids = new ArrayList<>();
		loginHistoryMapper.batchInsert(loginHistorys);
		for (LoginHistory loginHistory : loginHistorys) {
			ids.add(loginHistory.getId());
		}
		return ids;
	}

	@Override
	public void batchDelete(List<Integer> ids) {
		loginHistoryMapper.batchDelete(ids);
	}

	@Override
	public Integer dynamicInsert(LoginHistory loginHistory) {
		loginHistoryMapper.dynamicInsert(loginHistory);
		return loginHistory.getId();
	}

	@Override
	public void dynamicUpdate(LoginHistory loginHistory) {
		loginHistoryMapper.dynamicUpdate(loginHistory);
	}

	@Override
	public List<LoginHistory> listByUser(Integer uid) {
		return loginHistoryMapper.listByUser(uid);
	}

	@Override
	public List<LoginHistory> listByUserAndIsLogin(Integer uid, Integer isLogin) {
		return loginHistoryMapper.listByUserAndIsLogin(uid, isLogin);
	}

	@Override
	public Integer count() {
		return loginHistoryMapper.count();
	}

}
