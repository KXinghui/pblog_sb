package site.xinghui.pblog_sb.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.xinghui.pblog_sb.mapper.UserMapper;
import site.xinghui.pblog_sb.pojo.User;
import site.xinghui.pblog_sb.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;

	@Override
	public Integer insert(User user) {
		// SqlSession sqlSession = MyBatisUtil.getSqlSession(ENV);
		// userMapper = sqlSession.getMapper(UserMapper.class);
		userMapper.insert(user);
		// MyBatisUtil.closeSqlSession();
		return user.getId();
	}

	@Override
	public void update(User user) {
		userMapper.update(user);
	}

	@Override
	public void delete(Integer id) {
		userMapper.delete(id);
	}

	public void delete2(User user) {
		userMapper.delete2(user);
	}

	@Override
	public User get(Integer id) {
		User user = userMapper.get(id);
		return user;
	}

	@Override
	public List<User> list() {
		List<User> users = userMapper.list();
		return users;
	}

	@Override
	public Integer count() {
		return userMapper.count();
	}

	/* 非常规操作 */

	/* 批量操作 */
	@Override
	public List<Integer> batchInsert(List<User> users) {
		List<Integer> ids = new ArrayList<>();
		userMapper.batchInsert(users);
		for (User user : users) {
			ids.add(user.getId());
		}
		return ids;
	}

	@Override
	public void batchDelete(List<Integer> ids) {
		userMapper.batchDelete(ids);
	}

	// @Override
	// public void batchUpdate(List<User> users) {
	// userMapper.batchUpdate(users);
	// }

	/* 动态操作 */
	@Override
	public Integer dynamicInsert(User user) {
		userMapper.dynamicInsert(user);
		return user.getId();
	}

	@Override
	public void dynamicUpdate(User user) {
		userMapper.dynamicUpdate(user);
	}

	/* 动态批量操作 */
	// @Override
	// public List<Integer> dynamicBatchInsert(List<User> users) {
	// List<Integer> ids = new ArrayList<>();
	// userMapper.dynamicBatchInsert(users);
	// for (User user : users) {
	// ids.add(user.getId());
	// }
	// return ids;
	// }

	/* 查询获取 */

	@Override
	public User getByName(String name) {
		User user = userMapper.getByName(name);
		return user;
	}

	@Override
	public User getByNameAndPass(User user) {
		User realUser = userMapper.getByNameAndPass(user);
		return realUser;
	}

	/* 模糊查询 */
	@Override
	public List<User> listFuzzyByName(String name) {
		List<User> users = userMapper.listFuzzyByName(name);
		return users;
	}

	/* 多条件查询 */
	@Override
	public List<User> listMulConditionByIdAndName(Map<String, Object> params) {
		List<User> users = userMapper.listMulConditionByIdAndName(params);
		return users;
	}
	/* 业务逻辑方法 */

	@SuppressWarnings("resource")
	public static void main(String[] args) {
		// ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
		// "classpath:config/applicationContext.xml");
		// UserService service = context.getBean(UserService.class);

	}

}
