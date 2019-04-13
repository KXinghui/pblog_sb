package site.xinghui.pblog_sb.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.xinghui.pblog_sb.enums.ArticleStatu;
import site.xinghui.pblog_sb.enums.Visibility;
import site.xinghui.pblog_sb.mapper.ArticleFavorityMapper;
import site.xinghui.pblog_sb.pojo.Article;
import site.xinghui.pblog_sb.pojo.ArticleFavority;
import site.xinghui.pblog_sb.pojo.User;
import site.xinghui.pblog_sb.service.ArticleFavorityService;
import site.xinghui.pblog_sb.service.ArticleService;
import site.xinghui.pblog_sb.service.GroupService;
import site.xinghui.pblog_sb.service.UserService;

@Service
@Transactional
public class ArticleFavorityServiceImpl implements ArticleFavorityService {
	@Autowired
	ArticleFavorityMapper articleFavorityMapper;

	@Autowired
	UserService userService;
	@Autowired
	ArticleService articleService;
	@Autowired
	GroupService groupService;

	@Override
	public Integer insert(ArticleFavority t) {
		articleFavorityMapper.insert(t);
		return t.getId();
	}

	@Override
	public void delete(Integer id) {
		articleFavorityMapper.delete(id);
	}

	@Override
	public void update(ArticleFavority t) {
		articleFavorityMapper.update(t);
	}

	@Override
	public ArticleFavority get(Integer id) {
		return articleFavorityMapper.get(id);
	}

	@Override
	public List<ArticleFavority> list() {
		return articleFavorityMapper.list();
	}

	@Override
	public Integer count() {
		return articleFavorityMapper.count();
	}

	@Override
	public void delete2(ArticleFavority articleFavority) {
		articleFavorityMapper.delete2(articleFavority);
	}

	@Override
	public List<Integer> batchInsert(List<ArticleFavority> articleFavoritys) {
		List<Integer> ids = new ArrayList<>();
		articleFavorityMapper.batchInsert(articleFavoritys);
		for (ArticleFavority articleFavority : articleFavoritys) {
			ids.add(articleFavority.getId());
		}
		return ids;
	}

	@Override
	public void batchDelete(List<Integer> ids) {
		articleFavorityMapper.batchDelete(ids);
	}

	@Override
	public void dynamicInsert(ArticleFavority articleFavority) {
		articleFavorityMapper.dynamicInsert(articleFavority);
	}

	@Override
	public void dynamicUpdate(ArticleFavority articleFavority) {
		articleFavorityMapper.dynamicUpdate(articleFavority);
	}

	@Override
	public void dynamicBatchUpdate(List<ArticleFavority> articleFavoritys) {
		articleFavorityMapper.dynamicBatchUpdate(articleFavoritys);
	}

	@Override
	public ArticleFavority getByArticleAndGroup(Integer aid, Integer gid) {
		return articleFavorityMapper.getByArticleAndGroup(aid, gid);
	}

	@Override
	public Integer countByGroup(Integer gid) {
		return articleFavorityMapper.countByGroup(gid);
	}

	@Override
	public List<ArticleFavority> listByGroup(Integer gid) {
		List<ArticleFavority> articleFavoritys = articleFavorityMapper.listByGroup(gid);
		setArticleFavoritys(articleFavoritys, null);
		return articleFavoritys;
	}

	@Override
	public List<ArticleFavority> listByGroupAndArticleStatu(Integer gid, ArticleStatu articleStatu) {
		List<ArticleFavority> articleFavoritys = articleFavorityMapper.listByGroup(gid);

		setArticleFavoritys(articleFavoritys, articleStatu);

		return articleFavoritys;
	}

	@Override
	public List<ArticleFavority> listByUserAndArticle(Integer uid, Integer aid) {
		return articleFavorityMapper.listByUserAndArticle(uid, aid);
	}

	@Override
	public Integer countByArticle(Integer aid) {
		return articleFavorityMapper.countByArticle(aid);
	}

	@Override
	public Integer countByUserAndVisibility(Integer uid, Visibility visibility) {
		return articleFavorityMapper.countByUserAndVisibility(uid, visibility);
	}

	@Override
	public List<Integer> listIdByUserAndVisibility(Integer uid, Visibility visibility) {
		return articleFavorityMapper.listIdByUserAndVisibility(uid, visibility);
	}

	@Override
	public List<ArticleFavority> listByUserAndVisibility(Integer uid, Visibility visibility,
			ArticleStatu articleStatu) {
		List<ArticleFavority> articleFavorities = articleFavorityMapper.listByUserAndVisibility(uid, visibility);
		List<Integer> collectedIds = listIdByUserAndVisibility(uid, visibility);
		Iterator<ArticleFavority> iterator = articleFavorities.iterator();
		while (iterator.hasNext()) {
			ArticleFavority af = iterator.next();
			if (collectedIds.contains(af.getAid())) {
				iterator.remove();
			}
		}
		setArticleFavoritys(articleFavorities, articleStatu);
		return articleFavorities;
	}

	public void setArticleFavoritys(List<ArticleFavority> articleFavoritys, ArticleStatu articleStatu) {
		for (ArticleFavority articleFavority : articleFavoritys) {
			setArticleFavority(articleFavority, articleStatu);
		}
	}

	public void setArticleFavority(ArticleFavority articleFavority, ArticleStatu articleStatu) {
		// articleStatu为空或对应其articleStatu
		if (null == articleStatu || articleStatu.equals(articleService.getArticleStatu(articleFavority.getAid()))) {
			setArticleFavority(articleFavority);
		}
		// 否则 article为null
		else {
			articleFavority.setArticle(null);
		}
	}

	public void setArticleFavority(ArticleFavority articleFavority) {
		Article article = articleService.get(articleFavority.getAid());

		articleFavority.setArticle(article);
		User author = userService.get(article.getUid());
		author.setPassword(null);
		articleFavority.setAuthor(author);
	}

	public static void main(String[] args) {

	}

}
