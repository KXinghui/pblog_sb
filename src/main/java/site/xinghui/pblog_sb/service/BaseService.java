package site.xinghui.pblog_sb.service;

import java.util.List;

public interface BaseService<T> {
	Integer insert(T t);

	void delete(Integer id);

	void update(T t);

	T get(Integer id);

	List<T> list();

	Integer count();

}
