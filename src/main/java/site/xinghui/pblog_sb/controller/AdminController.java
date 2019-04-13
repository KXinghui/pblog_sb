package site.xinghui.pblog_sb.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import site.xinghui.pblog_sb.enums.ArticleStatu;
import site.xinghui.pblog_sb.pojo.Article;
import site.xinghui.pblog_sb.service.ArticleService;
import site.xinghui.pblog_sb.service.UserService;

@Controller
public class AdminController {

	@Autowired
	UserService userService;

	@Autowired
	ArticleService articleService;

	@RequestMapping("admin")
	public String list(Model model) {
		Map<String, Integer> adminTotal = new HashMap<>();
		Integer userTotal = userService.count();
		Article article = new Article();
		article.setArticleStatu(ArticleStatu.PUBLISH);
		Integer articleTotal = articleService.countMulConditionByArticle(article);

		adminTotal.put("userTotal", userTotal);
		adminTotal.put("articleTotal", articleTotal);

		model.addAttribute("adminTotal", adminTotal);
		return "admin/";
	}
}
