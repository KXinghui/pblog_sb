package site.xinghui.pblog_sb.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;

import site.xinghui.pblog_sb.enums.ArticleStatu;
import site.xinghui.pblog_sb.enums.GroupType;
import site.xinghui.pblog_sb.enums.Visibility;
import site.xinghui.pblog_sb.exception.CustException;
import site.xinghui.pblog_sb.pojo.Article;
import site.xinghui.pblog_sb.pojo.ArticleContent;
import site.xinghui.pblog_sb.pojo.ArticleFavority;
import site.xinghui.pblog_sb.pojo.ArticleHistory;
import site.xinghui.pblog_sb.pojo.Category;
import site.xinghui.pblog_sb.pojo.Group;
import site.xinghui.pblog_sb.pojo.LoginHistory;
import site.xinghui.pblog_sb.pojo.User;
import site.xinghui.pblog_sb.pojo.UserFollow;
import site.xinghui.pblog_sb.pojo.UserInfo;
import site.xinghui.pblog_sb.pojo.UserSetting;
import site.xinghui.pblog_sb.service.ArticleContentService;
import site.xinghui.pblog_sb.service.ArticleFavorityService;
import site.xinghui.pblog_sb.service.ArticleHistoryService;
import site.xinghui.pblog_sb.service.ArticleService;
import site.xinghui.pblog_sb.service.CategoryService;
import site.xinghui.pblog_sb.service.GroupService;
import site.xinghui.pblog_sb.service.LoginHistoryService;
import site.xinghui.pblog_sb.service.UserFollowService;
import site.xinghui.pblog_sb.service.UserInfoService;
import site.xinghui.pblog_sb.service.UserService;
import site.xinghui.pblog_sb.service.UserSettingService;
import site.xinghui.pblog_sb.util.ForeUtil;
import site.xinghui.pblog_sb.util.Page;
import site.xinghui.pblog_sb.util.PageResult;
import site.xinghui.pblog_sb.validator.Get;
import site.xinghui.pblog_sb.validator.Insert;
import site.xinghui.pblog_sb.validator.Update;

@Controller
public class ForeController {

	@Autowired
	UserService userService;
	@Autowired
	LoginHistoryService loginHistoryService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	ArticleService articleService;
	@Autowired
	ArticleContentService articleContentService;
	@Autowired
	ArticleHistoryService articleHistoryService;

	@Autowired
	UserInfoService userInfoService;
	@Autowired
	UserSettingService userSettingService;

	@Autowired
	GroupService groupService;
	@Autowired
	UserFollowService userFollowService;
	@Autowired
	ArticleFavorityService articleFavorityService;

	/* user userInfo userNum */
	public void preUser(Integer uid, Model model, HttpSession session) {

		User user = (User) session.getAttribute("user");

		// 文章数量
		Integer articleNum = articleService.countByUserAndArticleStatu(uid, ArticleStatu.PUBLISH);
		// 垃圾文章数量
		Integer dustbinNum = articleService.countByUserAndArticleStatu(uid, ArticleStatu.DELETED);
		// 草稿数量
		Integer draftsNum = articleService.countByUserAndArticleStatu(uid, ArticleStatu.WAIT_PUBLISH);
		// 关注用户数量
		Integer followsNum = userFollowService.countFollowUserNumByUser(uid);
		// 粉丝数量
		Integer fansNum = userFollowService.countFansNumByUser(uid);
		/* 点击量、浏览量 */
		Map<String, Integer> userNum = articleService.countNumberOfClickViewByUserAndArticleStatu(uid,
				ArticleStatu.PUBLISH);

		userNum.put("articleNum", articleNum);
		userNum.put("dustbinNum", dustbinNum);
		userNum.put("draftsNum", draftsNum);
		userNum.put("followsNum", followsNum);
		userNum.put("fansNum", fansNum);
		// 登陆了且为其他用户页
		if (ForeUtil.isLogin(user) && !uid.equals(user.getId())) {
			List<UserFollow> ufs = userFollowService.listByFollowerAndUser(user.getId(), uid);
			if (null != ufs && ufs.size() != 0) {
				model.addAttribute("isFollow", true);
			}
		}
		// 登陆了且为自身用户页
		if (ForeUtil.isLoginAndOwnUser(uid, user)) {
			session.setAttribute("userNum", userNum);
			UserInfo ui = userInfoService.getByUser(uid);
			user.setUserInfo(ui);
			user.setUserNum(userNum);
			session.setAttribute("user", user);
			// session.setAttribute("userNum", userNum);
		} else {
			// 其他用户页面
			User otherUser = userService.get(uid);
			if (null == otherUser) {
				throw new CustException("没有此用户");
			}
			otherUser.setPassword(null);
			UserInfo ui = userInfoService.getByUser(uid);
			otherUser.setUserInfo(ui);
			otherUser.setUserNum(userNum);

			model.addAttribute("otherUser", otherUser);
			// model.addAttribute("otherUserNum", userNum);
		}
	}

	@RequestMapping(value = { "/", "forehome" })
	public String home(Model model) {
		List<Category> categorys = categoryService.list();
		for (Category c : categorys) {
			List<Article> articles = articleService.listByCategoryAndArticleStatu(c.getId(), ArticleStatu.PUBLISH);
			for (Article a : articles) {
				User user = userService.get(a.getUid());
				user.setPassword(null);
				a.setUser(user);
			}
			c.setArticles(articles);
		}
		model.addAttribute("categorys", categorys);

		return "fore/home";
	}

	/* 注册 */
	@RequestMapping("foreregister")
	public String register(@Validated({ Insert.class }) User user, BindingResult bindingResult, Model model,
			RedirectAttributes redirectAttributes) {
		if (bindingResult.hasErrors()) {
			return "fore/register";
		}

		User isExist = userService.getByName(user.getName());
		if (isExist != null) {
			model.addAttribute("msg", "注册失败，用户名重复");
			// redirectAttributes.addFlashAttribute("msg", "注册失败，用户名重复");
			return "fore/register";
		}
		userService.dynamicInsert(user);
		redirectAttributes.addFlashAttribute("successMsg", "注册成功，请登录！！！");
		return "redirect:loginPage";
	}

	/* 登陆 */
	@RequestMapping("forelogin")
	public String login(@Validated({ Get.class }) User user, Errors errors, Model model, HttpServletRequest request,
			HttpSession session) {
		if (errors.hasErrors()) {
			return "fore/login";
		}
		String name = user.getName();
		User isExist = userService.getByName(name);
		if (isExist == null) {
			model.addAttribute("msg", "登陆失败：用户账号 " + name + " 不存在");
			return "fore/login";
		}
		Integer uid = isExist.getId();
		UserSetting userSetting = userSettingService.getByUser(uid);

		if (null == userSetting) {
			userSetting = new UserSetting();
			userSetting.setUid(uid);
			userSettingService.dynamicInsert(userSetting);
		}

		User realUser = userService.getByNameAndPass(user);
		LoginHistory loginHistory = new LoginHistory();
		if (realUser == null) {
			model.addAttribute("msg", "登陆失败：用户密码错误");

			// 记录登陆失败历史
			Integer isRecordLoginFailHistory = userSetting.getIsRecordLoginFailHistory();
			if (null == isRecordLoginFailHistory || isRecordLoginFailHistory == 1) {
				loginHistory.setIp(request.getRemoteAddr());
				loginHistory.setIsLogin(0);
				loginHistory.setUid(uid);
				loginHistoryService.insert(loginHistory);
			}

			return "fore/login";
		}
		// 记录登陆成功历史
		Integer isRecordLoginSuccessHistory = userSetting.getIsRecordLoginSuccessHistory();
		if (null == isRecordLoginSuccessHistory || isRecordLoginSuccessHistory == 1) {
			loginHistory.setIp(request.getRemoteAddr());
			loginHistory.setIsLogin(1);
			loginHistory.setUid(realUser.getId());

			loginHistoryService.insert(loginHistory);
		}

		realUser.setPassword(null);
		Integer realUid = realUser.getId();
		UserInfo ui = userInfoService.getByUser(realUid);

		if (ui != null) {
			realUser.setUserInfo(ui);
		}
		session.setAttribute("user", realUser);
		session.setAttribute("userSetting", userSetting);
		return "redirect:fore/user/" + realUid;
	}

	/* 退出 */
	@RequestMapping("forelogout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:forehome";
	}

	/* 用户信息页面 */

	/* 自身用户信息 */
	@RequestMapping("foreuserInfo")
	public String userInfo(Model model, HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Integer uid = user.getId();
		// UserInfo ui = userInfoService.getByUser(uid);
		// if (ui != null) {
		// user.setUserInfo(ui);
		// }
		// model.addAttribute("user", user);
		PageHelper.startPage(0, 2, "id DESC");
		List<LoginHistory> loginHistorys = loginHistoryService.listByUser(uid);
		List<LoginHistory> failLoginHistorys = loginHistoryService.listByUserAndIsLogin(uid, 0);

		model.addAttribute("lhs", loginHistorys);
		model.addAttribute("faillhs", failLoginHistorys);
		return "fore/userInfo";
	}

	/* 编辑用户信息【不包含上传图片的字段】 */
	@RequestMapping("foreeditUserInfo")
	public String editUserInfo(@Validated UserInfo userInfo, BindingResult bindingResult, Model model,
			RedirectAttributes redirectAttributes, HttpServletRequest request, HttpSession session) {
		if (bindingResult.hasErrors()) {
			return "fore/editUserInfo";
		}

		User user = (User) session.getAttribute("user");

		// Integer uid = user.getId();
		// UserInfo realUserInfo = userInfoService.getByUser(uid);

		UserInfo realUserInfo = user.getUserInfo();
		if (realUserInfo != null) {
			// 更新
			userInfo.setId(realUserInfo.getId());
			userInfoService.dynamicUpdate(userInfo);
		} else {
			// 增加
			userInfo.setUid(user.getId());
			userInfoService.dynamicInsert(userInfo);
		}

		user.setUserInfo(userInfo);
		session.setAttribute("user", user);
		redirectAttributes.addFlashAttribute("successEditUserInfoMsg", "修改用户信息成功！！！");
		return "redirect:foreuserInfo";
	}

	/* 编辑用户 */
	@RequestMapping("foreeditUser")
	public String editUser(@Validated({ Update.class }) User user, BindingResult bindingResult, Model model,
			RedirectAttributes redirectAttributes, HttpSession session) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("act", "editUser");
			return "fore/editUserInfo";
		}
		User realUser = (User) session.getAttribute("user");
		User isExist = userService.get(realUser.getId());
		if (null != isExist) {
			realUser.setPassword(user.getPassword());
			userService.dynamicUpdate(realUser);
			session.removeAttribute("user");
		}
		redirectAttributes.addFlashAttribute("successMsg", "修改密码成功，请登录");
		return "redirect:loginPage";
	}

	/* 用户页面 自身 和 其他 */
	@RequestMapping("fore/user/{uid}")
	public String user(@PathVariable Integer uid, Model model, HttpSession session, Page page) {

		preUser(uid, model, session);

		User user = (User) session.getAttribute("user");

		PageHelper.startPage(0, 4);
		List<Article> articles = articleService.listByUserAndArticleStatu(uid, ArticleStatu.PUBLISH);
		/* 文章-文章箱 */
		model.addAttribute("articles", articles);

		if (ForeUtil.isLogin(user)) {
			Integer ouid = user.getId();
			// 已收藏文章的ID
			List<Integer> collectedIds = articleFavorityService.listIdByUserAndVisibility(ouid, null);
			model.addAttribute("collectedIds", collectedIds);
		}

		if (ForeUtil.isLoginAndOwnUser(uid, user)) {
			/* 文章-草稿箱 */
			PageHelper.startPage(0, 4);
			List<Article> drafts = articleService.listByUserAndArticleStatu(uid, ArticleStatu.WAIT_PUBLISH);
			/* 文章-垃圾箱 */
			PageHelper.startPage(0, 4);
			List<Article> dustbin = articleService.listByUserAndArticleStatu(uid, ArticleStatu.DELETED);

			/* 文章收藏-所有组 */
			List<Group> allGroups = groupService.listByUserAndGroupType(uid, GroupType.ARTICLE_FAVORITY);
			ArticleStatu articleStatu = ArticleStatu.PUBLISH;
			for (Group allGroup : allGroups) {

				List<ArticleFavority> afs = articleFavorityService.listByGroupAndArticleStatu(allGroup.getId(),
						articleStatu);

				allGroup.setArticleFavorities(afs);
			}

			model.addAttribute("drafts", drafts);
			model.addAttribute("dustbin", dustbin);
			model.addAttribute("allGroups", allGroups);
		} else {
			/* 文章收藏-显示组 */
			List<Group> visibleGroups = groupService.listByUserGroupTypeAndVisibility(uid, GroupType.ARTICLE_FAVORITY,
					Visibility.VISIBLE);

			ArticleStatu articleStatu = ArticleStatu.PUBLISH;
			for (Group visibleGroup : visibleGroups) {

				PageHelper.startPage(0, 4);
				List<ArticleFavority> afs = articleFavorityService.listByGroupAndArticleStatu(visibleGroup.getId(),
						articleStatu);

				visibleGroup.setArticleFavorities(afs);
			}
			model.addAttribute("visibleGroups", visibleGroups);
		}
		return "fore/user";
	}

	/* 用户/文章页面 */ /* title */
	@RequestMapping(value = { "fore/user/{uid}/articles", "fore/user/{uid}/articles/{articleStatu}" })
	public String userArticle(@PathVariable Integer uid, @PathVariable(required = false) String articleStatu,
			Model model, HttpSession session, Page page) {
		preUser(uid, model, session);

		User user = (User) session.getAttribute("user");
		String title = ForeUtil.returnTitleAsArticleStatuStr(articleStatu);
		ArticleStatu asEnum = ForeUtil.returnAsArticleStatuStr(articleStatu);

		if (!ForeUtil.isLoginAndOwnUser(uid, user) && !ArticleStatu.PUBLISH.equals(asEnum)) {
			throw new CustException("不是当前用户，不可查看用户的" + title);
		}
		PageResult<Article> pr = null;
		if (ForeUtil.isLogin(user)) {
			Integer ouid = user.getId();
			// 已收藏文章的ID
			List<Integer> collectedIds = articleFavorityService.listIdByUserAndVisibility(ouid, null);
			model.addAttribute("collectedIds", collectedIds);
		}

		if (ForeUtil.isLoginAndOwnUser(uid, user)) {
			/* 文章箱、垃圾箱、草稿箱 */
			Integer total = articleService.countByUserAndArticleStatu(uid, asEnum);
			PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
			List<Article> as = articleService.listByUserAndArticleStatu(uid, asEnum);
			pr = new PageResult<>(total, as, page);
		} else {
			Integer total = articleService.countByUserAndArticleStatu(uid, asEnum);
			PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
			List<Article> as = articleService.listByUserAndArticleStatu(uid, asEnum);
			pr = new PageResult<>(total, as, page);
		}

		model.addAttribute("title", title);
		model.addAttribute("pr", pr);
		return "fore/user/article";
	}

	/* 用户/用户关注页面/关注|粉丝 */
	// @RequestMapping("fore/user/{uid}/userfollow/{followersfans}/{gid}")
	@RequestMapping(value = { "fore/user/{uid}/userfollow", "fore/user/{uid}/userfollow/{followsfans}" })
	public String userUserFollow(@PathVariable(required = true) Integer uid,
			@PathVariable(required = false) String followsfans, Model model, HttpSession session, Page page) {

		preUser(uid, model, session);

		User user = (User) session.getAttribute("user");

		// 登陆了
		if (ForeUtil.isLogin(user)) {
			Integer ouid = user.getId();
			// 已关注的用户的用户ID
			List<User> followedUsers = userFollowService.listFollowUserByUser(ouid);
			List<Integer> followedIds = new ArrayList<>();
			for (User followedUser : followedUsers) {
				followedIds.add(followedUser.getId());
			}
			model.addAttribute("followedIds", followedIds);
		}

		boolean isLoginAndOwnUser = ForeUtil.isLoginAndOwnUser(uid, user);
		List<Group> groups = null;
		if (isLoginAndOwnUser) {
			groups = groupService.listByUserAndGroupType(uid, GroupType.USER_FOLLOW);
		} else {
			groups = groupService.listByUserGroupTypeAndVisibility(uid, GroupType.USER_FOLLOW, Visibility.VISIBLE);
		}
		model.addAttribute("groups", groups);
		// 判断字符串是否为空
		// 1 followsfans == null || followsfans.equals("") 直观，效率低
		// 2 "".equals(followsfans) 效率高 最后的方法
		if (followsfans == null || followsfans.equals("")) {
			followsfans = "follows";
		}
		switch (followsfans) {
		case "follows":
			Integer followUserNum = userFollowService.countFollowUserNumByUser(uid);

			PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
			List<User> followUsers = userFollowService.listFollowUserByUser(uid);

			// 全部的关注
			PageResult<User> allFollowsPr = new PageResult<>(followUserNum, followUsers, page);

			model.addAttribute("allFollowsPr", allFollowsPr);
			break;
		case "fans":
			Integer fansNum = userFollowService.countFansNumByUser(uid);
			PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
			List<User> fans = userFollowService.listFansByUser(uid);
			PageResult<User> fansPr = new PageResult<>(fansNum, fans, page);

			model.addAttribute("fansPr", fansPr);
			break;
		}
		return "fore/user/userFollow";
	}

	/* 用户/用户关注页面/对应组 */
	@RequestMapping("fore/user/{uid}/userfollow/{followsfans}/{gid}")
	public String userUserFollowByGroup(@PathVariable(required = true) Integer uid,
			@PathVariable(required = true) String followsfans, @PathVariable(required = true) Integer gid, Model model,
			HttpSession session, Page page) {

		preUser(uid, model, session);

		User user = (User) session.getAttribute("user");

		// 登陆了
		if (ForeUtil.isLogin(user)) {
			Integer ouid = user.getId();
			// 已关注的用户的用户ID
			List<User> followedUsers = userFollowService.listFollowUserByUser(ouid);
			List<Integer> followedIds = new ArrayList<>();
			for (User followedUser : followedUsers) {
				followedIds.add(followedUser.getId());
			}
			model.addAttribute("followedIds", followedIds);
		}

		// 登陆且为自身用户页面
		boolean isLoginAndOwnUser = ForeUtil.isLoginAndOwnUser(uid, user);
		List<Group> groups = null;
		if (isLoginAndOwnUser) {
			groups = groupService.listByUserAndGroupType(uid, GroupType.USER_FOLLOW);
		} else {
			groups = groupService.listByUserGroupTypeAndVisibility(uid, GroupType.USER_FOLLOW, Visibility.VISIBLE);
		}
		model.addAttribute("groups", groups);

		if (followsfans == null || followsfans.equals("")) {
			followsfans = "follows";
		}
		switch (followsfans) {
		case "follows":
			Group group = null;
			if (isLoginAndOwnUser) {
				// 自身用户的全部分组
				group = new Group(null, null, GroupType.USER_FOLLOW, uid);
			} else {
				// 其他用户的显示分组
				group = new Group(null, Visibility.VISIBLE, GroupType.USER_FOLLOW, uid);
			}
			// 多条件查找
			List<Integer> groupIds = groupService.listGroupId(group);
			if (!groupIds.contains(gid)) {
				throw new CustException("目前还没有该分组或该分组不公开");
			}
			group = groupService.get(gid);

			Integer followUsersNum = userFollowService.countByGroup(gid);
			PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
			List<UserFollow> ufs = userFollowService.listByGroup(gid);
			for (UserFollow uf : ufs) {
				User follower = userService.get(uf.getUid());
				Integer followerId = follower.getId();
				follower.setPassword(null);
				Map<String, Integer> userNum = articleService.countNumberOfClickViewByUserAndArticleStatu(uf.getUid(),
						ArticleStatu.PUBLISH);
				Integer fansNum = userFollowService.countFansNumByUser(followerId);
				userNum.put("fansNum", fansNum);
				follower.setUserNum(userNum);
				uf.setUser(follower);
			}

			PageResult<UserFollow> followsPr = new PageResult<>(followUsersNum, ufs, page);
			model.addAttribute("followGroup", group);
			model.addAttribute("followsPr", followsPr);
			break;
		case "fans":
			Integer fansTotal = userFollowService.countFansNumByUser(uid);
			PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
			List<User> fans = userFollowService.listFansByUser(uid);

			PageResult<User> fansPr = new PageResult<>(fansTotal, fans, page);

			model.addAttribute("fansPr", fansPr);
			break;
		}

		return "fore/user/userFollow";
	}

	/* 用户/文章收藏页面/对应组 */
	@RequestMapping(value = { "fore/user/{uid}/articleFavorities", "fore/user/{uid}/articleFavorities/{gid}" })
	public String articleFavority(@PathVariable Integer uid, @PathVariable(required = false) Integer gid, Model model,
			HttpSession session, Page page) {
		preUser(uid, model, session);

		User user = (User) session.getAttribute("user");

		List<Group> groups = null;
		List<ArticleFavority> articleFavorities = null;
		boolean isLoginAndOwnUser = ForeUtil.isLoginAndOwnUser(uid, user);
		if (isLoginAndOwnUser) {
			groups = groupService.listByUserAndGroupType(uid, GroupType.ARTICLE_FAVORITY);
		} else {
			groups = groupService.listByUserGroupTypeAndVisibility(uid, GroupType.ARTICLE_FAVORITY, Visibility.VISIBLE);
		}
		if (null == groups || groups.size() == 0) {
			// 新增默认
			groups = new ArrayList<>();
			Group defaultGroup = new Group("默认", Visibility.VISIBLE, GroupType.ARTICLE_FAVORITY, uid);
			groupService.dynamicInsert(defaultGroup);
			groups.add(defaultGroup);
		}

		/* gid 没有默认为第一个 */
		if (null == gid && groups.size() != 0) {
			gid = groups.get(0).getId();
		}
		// 组ID
		List<Integer> groupIds = new ArrayList<>();
		for (Group g : groups) {
			groupIds.add(g.getId());
		}
		if (!groupIds.contains(gid)) {
			throw new CustException("用户文章收藏页面失败(该用户没有该文章收藏分组或未公开)");
		}

		Group group = groupService.get(gid);

		Integer total = articleFavorityService.countByGroup(gid);
		PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
		articleFavorities = articleFavorityService.listByGroupAndArticleStatu(gid, ArticleStatu.PUBLISH);
		PageResult<ArticleFavority> groupPr = new PageResult<>(total, articleFavorities, page);

		if (ForeUtil.isLogin(user)) {
			Integer ouid = user.getId();
			// 已收藏文章的ID
			List<Integer> collectedIds = articleFavorityService.listIdByUserAndVisibility(ouid, null);
			model.addAttribute("collectedIds", collectedIds);
		}
		model.addAttribute("group", group);
		model.addAttribute("groupPr", groupPr);
		model.addAttribute("groups", groups);

		return "fore/user/articleFavority";
	}

	/* 用户/文章历史页面 */
	@RequestMapping(value = { "fore/user/{uid}/articleHistories" })
	public String articleHistory(@PathVariable Integer uid, @PathVariable(required = false) Integer gid, Model model,
			HttpSession session, Page page) {
		preUser(uid, model, session);

		User user = (User) session.getAttribute("user");

		if (!ForeUtil.isLoginAndOwnUser(uid, user)) {
			throw new CustException("你太可恶了，竟然想看别人的文章历史");
		}
		Integer total = articleHistoryService.countByUser(uid);
		PageHelper.startPage(page.getPageFirst(), page.getPageRecord(), "id DESC");
		List<ArticleHistory> articleHistories = articleHistoryService.listByUser(uid);
		PageResult<ArticleHistory> pr = new PageResult<>(total, articleHistories, page);
		model.addAttribute("pr", pr);

		return "fore/user/articleHistory";
	}

	/* 用户/用户设置页面 */
	@RequestMapping(value = { "fore/user/{uid}/userSettings" })
	public String userSetting(@PathVariable Integer uid, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");

		if (!ForeUtil.isLoginAndOwnUser(uid, user)) {
			throw new CustException("不可以进入别人的用户设置页面");
		}
		UserSetting userSetting = userSettingService.getByUser(uid);

		session.setAttribute("userSetting", userSetting);
		return "fore/user/userSetting";
	}

	/* 分类下的文章 */
	@RequestMapping("fore/category/{cid}/articles")
	public String categoryArticle(@PathVariable Integer cid, Model model, Page page) {
		Category category = categoryService.get(cid);
		if (null == category) {
			throw new CustException("暂时还没有该分类");
		}

		ArticleStatu articleStatu = ArticleStatu.PUBLISH;
		Integer total = articleService.countByCategoryAndArticleStatu(cid, articleStatu);
		PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
		List<Article> articles = articleService.listByCategoryAndArticleStatu(cid, articleStatu);
		for (Article a : articles) {
			User author = userService.get(a.getUid());
			a.setUser(author);
		}
		PageResult<Article> pr = new PageResult<>(total, articles, page);
		model.addAttribute("category", category);
		model.addAttribute("pr", pr);
		return "fore/article/categoryArticle";
	}

	/* 编辑文章内容 */
	@RequestMapping("foreeditArticleContent")
	public String editArticleContent(@Validated({ Update.class }) ArticleContent articleContent,
			BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model, HttpSession session) {
		Integer aid = articleContent.getAid();
		if (bindingResult.hasErrors()) {
			redirectAttributes.addFlashAttribute("msg", "表单有误");
			return "redirect:foreeditArticle?aid=" + aid;
		}
		User user = (User) session.getAttribute("user");
		Article article = articleService.get(articleContent.getAid());
		ArticleContent originArticleContent = articleContentService.get(articleContent.getId());

		if (!article.getUid().equals(user.getId()) || !originArticleContent.getAid().equals(aid)) {
			throw new CustException("你不配编辑此文章内容或文章和文章内容ID不符合");
		}

		// Article newArticle = new Article();
		// newArticle.setId(article.getId());
		// newArticle.setUpdateDate(LocalDateTime.now());
		// articleService.dynamicUpdate(article);

		articleContentService.dynamicUpdate(articleContent);

		ArticleContent newArticleContent = articleContentService.get(articleContent.getId());
		article.setArticleContent(newArticleContent);

		model.addAttribute("article", article);

		return "redirect:foreshowArticle?aid=" + aid;
	}

	/* 跳转到编辑文章 */
	@RequestMapping("foreeditArticle")
	public String editArticle(@RequestParam Integer aid, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");

		List<Integer> aids = articleService.listArtileIdByUser(user.getId());
		if (!aids.contains(aid)) {
			throw new CustException("你不配编辑此文章");
		}
		ArticleStatu articleStatu = articleService.getArticleStatu(aid);
		if (articleStatu.equals(ArticleStatu.DELETED)) {
			throw new CustException("不能编辑垃圾文章");
		}
		Article article = articleService.get(aid);
		ArticleContent articleContent = articleContentService.getByArticle(aid);

		if (null == articleContent) {
			articleContent = new ArticleContent();
			articleContent.setAid(aid);
			articleContentService.dynamicInsert(articleContent);
		}

		article.setArticleContent(articleContent);
		model.addAttribute("article", article);
		return "fore/article/editArticle";
	}

	/* 跳转到展示文章 */
	@RequestMapping("foreshowArticle")
	public String showArticle(@RequestParam Integer aid, Model model, HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Article article = (Article) request.getAttribute("showArticle");

		if (null == article) {
			throw new CustException("不能查看该文章(不存在)");
		}
		Integer uid = article.getUid();
		if (!ForeUtil.isLoginAndOwnUser(uid, user) && !ArticleStatu.PUBLISH.equals(article.getArticleStatu())) {
			throw new CustException("不能查看该文章(不是发布状态)");
		}

		ArticleContent articleContent = articleContentService.getByArticle(aid);
		article.setArticleContent(articleContent);

		preUser(uid, model, session);
		// 类似文章
		PageHelper.startPage(0, 5);
		List<Article> similarArticles = articleService.listFuzzyByTitle(article.getTitle());

		Iterator<Article> iterator = similarArticles.iterator();
		while (iterator.hasNext()) {
			Article a = iterator.next();
			if (a.getId().equals(aid)) {
				iterator.remove();
				continue;
			}
			User similarAuthor = userService.get(a.getUid());
			similarAuthor.setPassword(null);
			a.setUser(similarAuthor);
		}
		System.out.println(similarArticles);
		model.addAttribute("similarArticles", similarArticles);

		if (ForeUtil.isLogin(user)) {
			List<ArticleFavority> afs = articleFavorityService.listByUserAndArticle(user.getId(), aid);
			// 是否收藏
			if (afs != null && afs.size() != 0) {
				model.addAttribute("isCollect", true);
			}
			// 增加观看历史（当天判断重复）
			UserSetting userSetting = (UserSetting) session.getAttribute("userSetting");
			if (null == userSetting || userSetting.getIsRecordShowArticleHistory() == 1) {
				ArticleHistory articleHistory = new ArticleHistory(user.getId(), aid, LocalDateTime.now());
				ArticleHistory originArticleHistory = articleHistoryService.getByArticleHistory(articleHistory);
				if (null == originArticleHistory) {
					articleHistoryService.dynamicInsert(articleHistory);
				} else {
					articleHistoryService.dynamicUpdate(originArticleHistory);
				}
			}
			// 是否已观看 稍后再看（有记录且对应aid的就把是否观看字段改成已观看【未观看 0、已观看 1】）

		}
		model.addAttribute("article", article);
		return "fore/article/showArticle";
	}

	@RequestMapping("foretest")
	public void test(Model model, HttpSession session) {
		throw new CustException("测试异常");
	}

	/* 按用户ID搜索文章[uid、title、articleStatu] */
	// 自身【文章、草稿、垃圾箱】其他【文章箱】
	@RequestMapping("fore/user/{uid}/search/article/{articleStatu}")
	public String searchByUser(@PathVariable Integer uid, @PathVariable(required = false) String articleStatu,
			@RequestParam String title, Model model, HttpSession session, Page page) {

		/* articles、dustbin、drafts */
		ArticleStatu as = ForeUtil.returnAsArticleStatuStr(articleStatu);

		preUser(uid, model, session);

		User user = (User) session.getAttribute("user");

		Article article = new Article();
		article.setUid(uid);
		article.setTitle(title);

		if (ForeUtil.isLoginAndOwnUser(uid, user)) {
			article.setArticleStatu(as);
		} else {
			article.setArticleStatu(ArticleStatu.PUBLISH);
		}

		if (ForeUtil.isLogin(user)) {
			Integer ouid = user.getId();
			// 已收藏文章的ID
			List<Integer> collectedIds = articleFavorityService.listIdByUserAndVisibility(ouid, null);
			model.addAttribute("collectedIds", collectedIds);
		}

		Map<String, String[]> paramMap = new HashMap<>();
		String[] titleVal = { title };
		paramMap.put("title", titleVal);
		page.setParamMap(paramMap);

		Integer total = articleService.countMulConditionByArticle(article);

		PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
		List<Article> articles = articleService.listMulConditionByArticle(article);

		if (!ForeUtil.isLoginAndOwnUser(uid, user)) {
			for (Article a : articles) {
				User author = userService.get(a.getUid());
				author.setPassword(null);
				a.setUser(author);
			}
		}
		PageResult<Article> pr = new PageResult<>(total, articles, page);

		model.addAttribute("keyword", title);
		model.addAttribute("articleStatu", as);
		model.addAttribute("pr", pr);

		return "fore/search/searchByUser";
	}

	/* 按分类ID搜索文章[cid、title、articleStatu] */
	@RequestMapping("fore/category/{cid}/search/article")
	public String searchByCategory(@PathVariable Integer cid, @RequestParam(required = false) String title, Model model,
			HttpSession session, Page page) {

		Category category = categoryService.get(cid);
		if (null == category) {
			throw new CustException("暂时还没有该分类");
		}

		Article article = new Article();
		article.setCid(cid);
		article.setArticleStatu(ArticleStatu.PUBLISH);

		if (null != title) {
			article.setTitle(title);

			Map<String, String[]> paramMap = new HashMap<>();
			String[] titleVal = { title };
			paramMap.put("title", titleVal);
			page.setParamMap(paramMap);
			model.addAttribute("title", title);
		}

		PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
		List<Article> articles = articleService.listMulConditionByArticle(article);
		Integer total = (articles.size() == 0) ? 0 : articleService.countMulConditionByArticle(article);
		PageResult<Article> pr = new PageResult<>(total, articles, page);
		model.addAttribute("category", category);
		model.addAttribute("pr", pr);

		return "fore/article/categoryArticle";
	}

}
