package site.xinghui.pblog_sb.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;

import site.xinghui.pblog_sb.pojo.Article;
import site.xinghui.pblog_sb.pojo.ArticleContent;
import site.xinghui.pblog_sb.service.ArticleContentService;
import site.xinghui.pblog_sb.service.ArticleService;
import site.xinghui.pblog_sb.util.Page;
import site.xinghui.pblog_sb.util.PageResult;

@Controller
public class ArticleController {
	@Autowired
	ArticleService articleService;
	@Autowired
	ArticleContentService articleContentService;

	@GetMapping("adminarticle/{aid}")
	public String get(@PathVariable Integer aid, Model model) {

		Article a = articleService.get(aid);
		ArticleContent ac = articleContentService.getByArticle(aid);

		model.addAttribute("a", a);
		model.addAttribute("ac", ac);
		return "admin/get/getArticle";
	}

	@GetMapping("adminarticles")
	public String list(Model model, Page page) {
		Integer total = articleService.count();

		PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
		List<Article> as = articleService.list();

		PageResult<Article> pr = new PageResult<>(total, as, page);

		model.addAttribute("pr", pr);
		return "admin/list/listCategory";
	}

	@GetMapping("adminarticles/{cid}/aritcles")
	public String listByCategory(@PathVariable Integer cid, Model model, Page page) {
		Integer total = articleService.countByCategory(cid);

		PageHelper.startPage(page.getPageFirst(), page.getPageRecord());

		List<Article> as = articleService.listByCategory(cid);

		PageResult<Article> pr = new PageResult<>(total, as, page);

		model.addAttribute("pr", pr);
		return "admin/list/listCategory";
	}

	@GetMapping("adminarticles/search")
	public String search(@RequestParam String title, Model model) {
		List<Article> as = articleService.listFuzzyByTitle(title);
		model.addAttribute("as", as);
		return "admin/search/searchCategory";
	}

	@PostMapping("adminarticle")
	public String insert(@Valid Article article, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "admin/addArticle";
		}

		articleService.insert(article);

		return "redirect:adminarticles";
	}

	@DeleteMapping("adminarticle/{aid}")
	public String delete(@PathVariable Integer aid) {
		articleService.delete(aid);
		return "redirect:adminarticles";
	}

	@DeleteMapping("adminarticles")
	public String deleteAll(@RequestParam List<Integer> aid) {
		articleService.batchDelete(aid);
		return "redirect:adminarticles";
	}

	@PutMapping("adminarticle")
	public String update(@Valid Article article, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "admin/update/updateCategory";
		}

		articleService.dynamicUpdate(article);

		return "redirect:adminarticles";
	}

}
