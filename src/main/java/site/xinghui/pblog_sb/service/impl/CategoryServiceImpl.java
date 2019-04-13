package site.xinghui.pblog_sb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.xinghui.pblog_sb.mapper.CategoryMapper;
import site.xinghui.pblog_sb.pojo.Category;
import site.xinghui.pblog_sb.service.CategoryService;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryMapper categoryMapper;

	@Override
	public Integer insert(Category t) {
		categoryMapper.insert(t);
		return t.getId();
	}

	@Override
	public void delete(Integer id) {
		categoryMapper.delete(id);
	}

	@Override
	public void update(Category t) {
		categoryMapper.update(t);
	}

	@Override
	public Category get(Integer id) {
		return categoryMapper.get(id);
	}

	@Override
	public List<Category> list() {
		return categoryMapper.list();
	}

	@Override
	public List<Integer> batchInsert(List<Category> categorys) {
		List<Integer> ids = new ArrayList<>();
		categoryMapper.batchInsert(categorys);
		for (Category c : categorys) {
			ids.add(c.getId());
		}
		return ids;
	}

	@Override
	public void batchDelete(List<Integer> ids) {
		categoryMapper.batchDelete(ids);
	}

	@Override
	public Integer dynamicInsert(Category category) {
		categoryMapper.dynamicInsert(category);
		return category.getId();
	}

	@Override
	public void dynamicUpdate(Category category) {
		categoryMapper.dynamicUpdate(category);
	}

	@Override
	public Category getByName(String name) {
		return categoryMapper.getByName(name);
	}

	@Override
	public List<Category> listFuzzyByName(String name) {
		return categoryMapper.listFuzzyByName(name);
	}

	@Override
	public Integer count() {
		return categoryMapper.count();
	}

	public static void main(String[] args) {

	}

}
