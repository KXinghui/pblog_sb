package site.xinghui.pblog_sb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;

import site.xinghui.pblog_sb.pojo.User;
import site.xinghui.pblog_sb.service.UserService;
import site.xinghui.pblog_sb.util.Page;
import site.xinghui.pblog_sb.util.PageResult;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("admin/user")
	public String list(Model model, Page page) {
		Integer total = userService.count();
		PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
		List<User> us = userService.list();
		for (User u : us) {
			u.setPassword(null);
		}
		PageResult<User> pr = new PageResult<>(total, us, page);
		model.addAttribute("pr", pr);
		return "admin/list/listUser";
	}

}
