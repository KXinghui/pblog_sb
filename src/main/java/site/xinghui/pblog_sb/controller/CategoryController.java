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

import site.xinghui.pblog_sb.pojo.Category;
import site.xinghui.pblog_sb.service.CategoryService;
import site.xinghui.pblog_sb.util.Page;
import site.xinghui.pblog_sb.util.PageResult;

@Controller
public class CategoryController {

	@Autowired
	CategoryService categoryService;

	@GetMapping("admincategory/{cid}")
	public String get(@PathVariable Integer cid, Model model) {

		Category c = categoryService.get(cid);

		model.addAttribute("c", c);
		return "admin/list/listCategory";
	}

	@GetMapping("admincategories")
	public String list(Model model, Page page) {
		Integer total = categoryService.count();

		PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
		List<Category> cs = categoryService.list();

		PageResult<Category> pr = new PageResult<>(total, cs, page);

		model.addAttribute("pr", pr);
		return "admin/list/listCategory";
	}

	@GetMapping("admincategories/search")
	public String search(@RequestParam String name, Model model, Page page) {
		PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
		List<Category> cs = categoryService.listFuzzyByName(name);
		model.addAttribute("cs", cs);
		return "admin/search/searchCategory";
	}

	@PostMapping("admincategory")
	public String insert(@Valid Category category, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "admin/addCategory";
		}
		Category isExist = categoryService.getByName(category.getName());
		if (isExist != null) {
			model.addAttribute("msg", "添加分类失败：分类名重复");
			return "admin/add/addCategory";
		}
		categoryService.insert(category);

		return "redirect:admincategories";
	}

	@PutMapping("admincategory")
	public String update(@Valid Category category, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "admin/update/updateCategory";
		}

		Category isExist = categoryService.getByName(category.getName());
		if (null != isExist) {
			model.addAttribute("msg", "失败：分类名重复");
			return "admin/update/updateCategory";
		}

		categoryService.dynamicUpdate(category);
		return "redirect:admincategories";
	}

	@DeleteMapping("admincategory/{cid}")
	public String delete(@PathVariable Integer cid) {
		categoryService.delete(cid);
		return "redirect:admincategories";
	}

	@DeleteMapping("admincategories")
	public String deleteAll(@RequestParam List<Integer> cid) {
		categoryService.batchDelete(cid);
		return "redirect:admincategories";
	}

	// @PatchMapping("admin/")
	// public String updatePart() {
	// return null;
	//
	// }
}
