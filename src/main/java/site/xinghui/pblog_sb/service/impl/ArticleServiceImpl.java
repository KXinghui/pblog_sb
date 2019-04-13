package site.xinghui.pblog_sb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.xinghui.pblog_sb.enums.ArticleStatu;
import site.xinghui.pblog_sb.mapper.ArticleMapper;
import site.xinghui.pblog_sb.pojo.Article;
import site.xinghui.pblog_sb.pojo.Category;
import site.xinghui.pblog_sb.service.ArticleFavorityService;
import site.xinghui.pblog_sb.service.ArticleService;
import site.xinghui.pblog_sb.service.CategoryService;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {
	@Autowired
	ArticleMapper articleMapper;

	@Autowired
	CategoryService categoryService;
	@Autowired
	ArticleFavorityService articleFavorityService;

	@Override
	public Integer insert(Article t) {
		articleMapper.insert(t);
		return t.getId();
	}

	@Override
	public void delete(Integer id) {
		articleMapper.delete(id);
	}

	@Override
	public void update(Article t) {
		articleMapper.update(t);
	}

	@Override
	public Article get(Integer id) {
		Article article = articleMapper.get(id);
		setArticle(article);
		return article;
	}

	@Override
	public List<Article> list() {
		List<Article> articles = articleMapper.list();
		setArticles(articles);
		return articles;
	}

	@Override
	public void delete2(Article article) {
		articleMapper.delete2(article);
	}

	@Override
	public Integer count() {
		return articleMapper.count();
	}

	@Override
	public List<Integer> batchInsert(List<Article> articles) {
		List<Integer> ids = new ArrayList<>();
		articleMapper.batchInsert(articles);
		for (Article article : articles) {
			ids.add(article.getId());
		}
		return ids;
	}

	@Override
	public void batchDelete(List<Integer> ids) {
		articleMapper.batchDelete(ids);
	}

	@Override
	public void dynamicInsert(Article article) {
		articleMapper.dynamicInsert(article);
	}

	@Override
	public void dynamicUpdate(Article article) {
		articleMapper.dynamicUpdate(article);
	}

	@Override
	public ArticleStatu getArticleStatu(Integer id) {
		return articleMapper.getArticleStatu(id);
	}

	@Override
	public Article getByTitle(String title) {
		Article article = articleMapper.getByTitle(title);
		setArticle(article);
		return article;
	}

	@Override
	public List<Article> listFuzzyByTitle(String title) {
		List<Article> articles = articleMapper.listFuzzyByTitle(title);
		setArticles(articles);
		return articles;
	}

	@Override
	public Article getBySubTitle(String subTitle) {
		Article article = articleMapper.getBySubTitle(subTitle);
		setArticle(article);
		return article;
	}

	@Override
	public List<Article> listFuzzyBySubTitle(String subTitle) {
		List<Article> articles = articleMapper.listFuzzyBySubTitle(subTitle);
		setArticles(articles);
		return articles;
	}

	@Override
	public List<Article> listMulCondition(Map<String, Object> params) {
		return articleMapper.listMulCondition(params);
	}

	@Override
	public List<Article> listByCategory(Integer cid) {
		return articleMapper.listByCategory(cid);
	}

	@Override
	public List<Article> listByCategoryAndArticleStatu(Integer cid, ArticleStatu articleStatu) {
		return articleMapper.listByCategoryAndArticleStatu(cid, articleStatu);
	}

	@Override
	public List<Article> listByUser(Integer uid) {
		List<Article> articles = articleMapper.listByUser(uid);
		setArticles(articles);
		return articles;
	}

	@Override
	public List<Integer> listArtileIdByUser(Integer uid) {
		return articleMapper.listArtileIdByUser(uid);
	}

	@Override
	public List<Article> listByUserAndArticleStatu(Integer uid, ArticleStatu articleStatu) {
		List<Article> articles = articleMapper.listByUserAndArticleStatu(uid, articleStatu);
		setArticles(articles);
		return articles;
	}

	@Override
	public Integer countByCategory(Integer cid) {
		return articleMapper.countByCategory(cid);
	}

	@Override
	public Integer countByCategoryAndArticleStatu(Integer cid, ArticleStatu articleStatu) {
		return articleMapper.countByCategoryAndArticleStatu(cid, articleStatu);
	}

	@Override
	public Integer countByUserAndArticleStatu(Integer uid, ArticleStatu articleStatu) {
		return articleMapper.countByUserAndArticleStatu(uid, articleStatu);
	}

	@Override
	public Map<String, Integer> countNumberOfClickViewByUserAndArticleStatu(Integer uid, ArticleStatu articleStatu) {
		Map<String, Integer> userNum = articleMapper.countNumberOfClickViewByUserAndArticleStatu(uid, articleStatu);
		if (null == userNum) {
			userNum = new HashMap<>();
			userNum.put("clickNum", 0);
			userNum.put("viewNum", 0);
		}
		return userNum;
	}

	@Override
	public List<Article> listMulConditionByArticle(Article article) {
		List<Article> articles = articleMapper.listMulConditionByArticle(article);
		setArticles(articles);
		return articles;
	}

	@Override
	public Integer countMulConditionByArticle(Article article) {
		return articleMapper.countMulConditionByArticle(article);
	}

	public void setArticles(List<Article> articles) {
		for (Article a : articles) {
			setArticle(a);
		}
	}

	public void setArticle(Article article) {
		if (null == article)
			return;
		Category c = categoryService.get(article.getCid());
		Integer collectNum = articleFavorityService.countByArticle(article.getId());
		article.setCategory(c);
		article.setCollectNum(collectNum);
	}

	public static void main(String[] args) {

	}
}
