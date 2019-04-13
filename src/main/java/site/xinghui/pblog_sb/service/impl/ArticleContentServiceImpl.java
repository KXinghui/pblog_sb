package site.xinghui.pblog_sb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.xinghui.pblog_sb.mapper.ArticleContentMapper;
import site.xinghui.pblog_sb.pojo.ArticleContent;
import site.xinghui.pblog_sb.service.ArticleContentService;

@Service
@Transactional
public class ArticleContentServiceImpl implements ArticleContentService {
	@Autowired
	ArticleContentMapper articleContentMapper;

	@Override
	public Integer insert(ArticleContent t) {
		articleContentMapper.insert(t);
		return t.getId();
	}

	@Override
	public void delete(Integer id) {
		articleContentMapper.delete(id);
	}

	@Override
	public void update(ArticleContent t) {
		articleContentMapper.update(t);
	}

	@Override
	public ArticleContent get(Integer id) {
		return articleContentMapper.get(id);
	}

	@Override
	public List<ArticleContent> list() {
		return articleContentMapper.list();
	}

	@Override
	public Integer count() {
		return articleContentMapper.count();
	}

	@Override
	public void delete2(ArticleContent articleContent) {
		articleContentMapper.delete2(articleContent);
	}

	@Override
	public List<Integer> batchInsert(List<ArticleContent> articleContents) {
		List<Integer> ids = new ArrayList<>();
		articleContentMapper.batchInsert(articleContents);
		for (ArticleContent articleContent : articleContents) {
			ids.add(articleContent.getId());
		}
		return ids;
	}

	@Override
	public void batchDelete(List<Integer> ids) {
		articleContentMapper.batchDelete(ids);
	}

	@Override
	public void dynamicInsert(ArticleContent articleContent) {
		articleContentMapper.dynamicInsert(articleContent);
	}

	@Override
	public void dynamicUpdate(ArticleContent articleContent) {
		articleContentMapper.dynamicUpdate(articleContent);
	}

	@Override
	public void updateByArticle(ArticleContent articleContent) {
		articleContentMapper.updateByArticle(articleContent);
	}

	@Override
	public void deleteByArticle(Integer aid) {
		articleContentMapper.deleteByArticle(aid);
	}

	@Override
	public void batchDeleteByArtice(List<Integer> aids) {
		articleContentMapper.batchDeleteByArtice(aids);
	}

	@Override
	public ArticleContent getByArticle(Integer aid) {
		return articleContentMapper.getByArticle(aid);
	}

	@Override
	public List<ArticleContent> listByArticles(List<Integer> aids) {
		return articleContentMapper.listByArticles(aids);
	}

}
