package site.xinghui.pblog_sb.service.impl;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.xinghui.pblog_sb.enums.ArticleStatu;
import site.xinghui.pblog_sb.mapper.ArticleHistoryMapper;
import site.xinghui.pblog_sb.pojo.Article;
import site.xinghui.pblog_sb.pojo.ArticleHistory;
import site.xinghui.pblog_sb.pojo.User;
import site.xinghui.pblog_sb.service.ArticleHistoryService;
import site.xinghui.pblog_sb.service.ArticleService;
import site.xinghui.pblog_sb.service.UserService;

@Service
@Transactional
public class ArticleHistoryServiceImpl implements ArticleHistoryService {
	@Autowired
	ArticleHistoryMapper articleHistoryMapper;

	@Autowired
	UserService userService;
	@Autowired
	ArticleService articleService;

	@Override
	public Integer insert(ArticleHistory t) {
		articleHistoryMapper.insert(t);
		return t.getId();
	}

	@Override
	public void delete(Integer id) {
		articleHistoryMapper.delete(id);
	}

	@Override
	public void update(ArticleHistory t) {
		articleHistoryMapper.update(t);
	}

	@Override
	public ArticleHistory get(Integer id) {
		return articleHistoryMapper.get(id);
	}

	@Override
	public List<ArticleHistory> list() {
		return articleHistoryMapper.list();
	}

	@Override
	public Integer count() {
		return articleHistoryMapper.count();
	}

	@Override
	public void delete2(ArticleHistory articleHistory) {
		articleHistoryMapper.delete2(articleHistory);
	}

	@Override
	public List<Integer> batchInsert(List<ArticleHistory> articleHistorys) {
		List<Integer> ids = new ArrayList<>();
		articleHistoryMapper.batchInsert(articleHistorys);
		for (ArticleHistory articleHistory : articleHistorys) {
			ids.add(articleHistory.getId());
		}
		return ids;
	}

	@Override
	public void batchDelete(List<Integer> ids) {
		articleHistoryMapper.batchDelete(ids);
	}

	@Override
	public void dynamicInsert(ArticleHistory articleHistory) {
		articleHistoryMapper.dynamicInsert(articleHistory);
	}

	@Override
	public void dynamicUpdate(ArticleHistory articleHistory) {
		articleHistoryMapper.dynamicUpdate(articleHistory);
	}

	@Override
	public List<ArticleHistory> listByUser(Integer uid) {
		List<ArticleHistory> ahs = articleHistoryMapper.listByUser(uid);
		setArticleHistorys(ahs);
		return ahs;
	}

	@Override
	public List<Integer> listIdByUser(Integer uid) {
		return articleHistoryMapper.listIdByUser(uid);
	}

	@Override
	public Integer countByUser(Integer uid) {
		return articleHistoryMapper.countByUser(uid);
	}

	@Override
	public ArticleHistory getByArticleHistory(ArticleHistory articleHistory) {
		return articleHistoryMapper.getByArticleHistory(articleHistory);
	}

	public void setArticleHistorys(List<ArticleHistory> articleHistorys) {
		for (ArticleHistory articleHistory : articleHistorys) {
			setArticleHistory(articleHistory);
		}
	}

	public void setArticleHistory(ArticleHistory articleHistory) {
		Article article = articleService.get(articleHistory.getAid());
		if (null != article && article.getArticleStatu().equals(ArticleStatu.PUBLISH)) {
			User author = userService.get(article.getUid());
			author.setPassword(null);
			article.setUser(author);
			articleHistory.setArticle(article);
		}
	}

	public static void main(String[] args) {

	}

}
