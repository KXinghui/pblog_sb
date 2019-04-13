package site.xinghui.pblog_sb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import site.xinghui.pblog_sb.pojo.UserInfo;
import site.xinghui.pblog_sb.service.UserInfoService;

@Controller
public class UserInfoController {

	@Autowired
	UserInfoService userInfoService;

	@RequestMapping("admin/user/userinfo/{uid}")
	public String userInfo(@PathVariable Integer uid, Model model) {
		UserInfo ui = userInfoService.getByUser(uid);
		model.addAttribute("ui", ui);
		return "admin/list/oneUserInfo";
	}
}
