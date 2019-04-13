package site.xinghui.pblog_sb.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;

import site.xinghui.pblog_sb.enums.ArticleStatu;
import site.xinghui.pblog_sb.enums.GroupType;
import site.xinghui.pblog_sb.enums.Visibility;
import site.xinghui.pblog_sb.exception.CustException;
import site.xinghui.pblog_sb.pojo.Article;
import site.xinghui.pblog_sb.pojo.ArticleContent;
import site.xinghui.pblog_sb.pojo.ArticleFavority;
import site.xinghui.pblog_sb.pojo.ArticleHistory;
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
import site.xinghui.pblog_sb.service.GroupService;
import site.xinghui.pblog_sb.service.LoginHistoryService;
import site.xinghui.pblog_sb.service.UserFollowService;
import site.xinghui.pblog_sb.service.UserInfoService;
import site.xinghui.pblog_sb.service.UserService;
import site.xinghui.pblog_sb.service.UserSettingService;
import site.xinghui.pblog_sb.util.Page;
import site.xinghui.pblog_sb.util.UpLoadFile;
import site.xinghui.pblog_sb.validator.Get;
import site.xinghui.pblog_sb.validator.Insert;
import site.xinghui.pblog_sb.validator.Update;

@RestController
public class RestForeController {

	@Autowired
	UserService userService;
	@Autowired
	LoginHistoryService loginHistoryService;
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

	/*
	 * images/user/user.id/userInfo images/user/user.id/article/article.id
	 */
	@ModelAttribute
	public void pre(HttpServletRequest request, HttpSession session, Page page) {
		System.out.println("pre：-/" + request.getRequestURI());
		Enumeration<String> parmNames = request.getParameterNames();
		System.out.println("page: " + page);
		System.out.println("|===========|");
		while (parmNames.hasMoreElements()) {
			String parm = parmNames.nextElement();
			System.out.println(parm);
			System.out.println(request.getParameter(parm));
		}
		String uri = request.getRequestURI();
		String contextPath = session.getServletContext().getContextPath();
		uri = StringUtils.remove(uri, contextPath);
		System.out.println(uri);
		String method = uri.split("/fore")[1];
		System.out.println(method);
	}

	/* 公共 */
	/* 检查是否登陆 */
	@RequestMapping("forecheckIsLogin")
	public String checkIsLogin(HttpSession session) {
		User user = (User) session.getAttribute("user");
		String msg = "no";
		if (user != null) {
			msg = "yes";
		}
		return msg;
	}

	/* 异步获取用户头像 */
	@RequestMapping("fore/user/{userName}/headImg")
	public String getUserHeadImgAsync(@PathVariable String userName) {
		User user = userService.getByName(userName);

		if (null == user || null == user.getHeadImg()) {
			return "no";
		}
		return user.getHeadImg();
	}

	/* 模态窗口异步操作的就配合前端插件验证，后端直接判断是否有误 */
	/* 异步登陆 */
	/* , produces = "text/plain;charset=UTF-8" */
	@RequestMapping(value = "foreloginAsync", produces = "text/plain;charset=UTF-8")
	public String loginAsync(@Validated({ Get.class }) User user, Errors errors, HttpServletRequest request,
			HttpSession session) {
		if (errors.hasErrors()) {
			return "表单有误";
		}

		String name = user.getName();
		User isExist = userService.getByName(name);

		if (isExist == null) {
			return "登陆失败：用户账号 " + name + " 不存在";
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
			// 记录登陆失败历史
			Integer isRecordLoginFailHistory = userSetting.getIsRecordLoginFailHistory();
			if (null == isRecordLoginFailHistory || isRecordLoginFailHistory == 1) {
				loginHistory.setIp(request.getRemoteAddr());
				loginHistory.setIsLogin(0);
				loginHistory.setUid(uid);
				loginHistoryService.insert(loginHistory);
			}

			return "登陆失败：用户密码错误";
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

		return "fore/user/" + uid;
	}

	/* 【文章操作：编辑文章及其内容、保存文章及其内容、删除文章及其内容、改变文章状态】 */
	/* 检查是否自身用户的文章 */
	@RequestMapping("forecheckOwnArticle")
	public String checkOwnArticle(@RequestParam Integer aid, BindingResult bindingResult, HttpServletRequest request,
			HttpSession session) {
		String msg = "no";
		User user = (User) session.getAttribute("user");
		List<Integer> aids = articleService.listArtileIdByUser(user.getId());
		if (null != user && aids.contains(aid)) {
			msg = "yes";
		}
		ArticleStatu articleStatu = articleService.getArticleStatu(aid);
		System.out.println(String.format("%s-%s", msg, articleStatu.toString()));
		return String.format("%s-%s", msg, articleStatu.toString());
	}

	/* 异步改变文章状态 */
	@RequestMapping("forechangeTo{articleStatu}")
	public String changeArticleStatuAsync(@PathVariable String articleStatu, @RequestParam Integer aid,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Integer> aids = articleService.listArtileIdByUser(user.getId());
		if (!aids.contains(aid)) {
			return "失败：你不配改变此文章状态";
		}

		ArticleStatu statu = null;
		switch (articleStatu) {
		case "Article":
			statu = ArticleStatu.PUBLISH;
			break;
		case "Drafts":
			statu = ArticleStatu.WAIT_PUBLISH;
			break;
		case "Dustbin":
			statu = ArticleStatu.DELETED;
			break;
		default:
			break;
		}
		Article article = new Article();
		article.setId(aid);
		article.setArticleStatu(statu);
		articleService.dynamicUpdate(article);
		System.out.println(article);
		return "success";
	}

	/* 异步彻底删除文章【只有当文章在垃圾箱时才能删除】 */
	@RequestMapping(value = "foredeleteArticleAsync", produces = "text/plain;charset=UTF-8")
	public String deleteArticleAsync(@RequestParam Integer aid, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Integer> aids = articleService.listArtileIdByUser(user.getId());
		if (!aids.contains(aid)) {
			return "失败：你不配删除此文章";
		}

		ArticleStatu as = articleService.getArticleStatu(aid);
		if (!ArticleStatu.DELETED.equals(as)) {
			return "不可删除非垃圾箱的文章";
		}
		articleContentService.deleteByArticle(aid);
		articleService.delete(aid);
		return "success";
	}

	/* 异步编辑用户信息【不包含上传图片的字段】 */
	@RequestMapping("foreeditUserInfoAsync")
	public String editUserInfoAsync(@Valid UserInfo userInfo, BindingResult bindingResult, HttpSession session) {
		// FieldErr fieldErr = new FieldErr();
		// if (bindingResult.hasErrors()) {
		// Map<String, String> fieldErrMsgMap = new HashMap<>();
		// for (FieldError fe : bindingResult.getFieldErrors()) {
		// String objFieldName = String.format("%s.%s", fe.getObjectName(),
		// fe.getField());
		// String errMsg = fe.getDefaultMessage();
		// fieldErrMsgMap.put(objFieldName, errMsg);
		// }
		// fieldErr.setFieldErrMsgMap(fieldErrMsgMap);
		// System.out.println(JSONObject.toJSON(fieldErr).toString());
		// return JSONObject.toJSONString(fieldErr);
		// }
		//
		// User user = (User) session.getAttribute("user");
		// Integer uid = user.getId();
		//
		// UserInfo realUserInfo = userInfoService.getByUser(uid);
		// if (realUserInfo != null) {
		// // 更新
		// userInfo.setId(realUserInfo.getId());
		// userInfoService.dynamicUpdate(userInfo);
		// } else {
		// // 增加
		// userInfoService.dynamicInsert(userInfo);
		// }
		return "success";
	}

	/* 异步编辑用户密码 */
	@RequestMapping(value = "foreeditUserAsync", produces = "text/plain;charset=UTF-8")
	public String editUserAsync(@Validated({ Update.class }) User user, BindingResult bindingResult,
			HttpSession session) {
		if (bindingResult.hasErrors()) {
			return "表单有误";
		}
		User realUser = (User) session.getAttribute("user");
		User isExist = userService.get(realUser.getId());
		if (null != isExist) {
			realUser.setPassword(user.getPassword());
			userService.dynamicUpdate(realUser);

		}
		return "success";
	}

	/* 异步上传用户头像 */
	@RequestMapping(value = "foreupLoadUserHeadImgAsync", produces = "text/plain;charset=UTF-8")
	public String upLoadUserHeadImgAsync(@RequestPart Part userHeadImg, HttpServletRequest request, HttpSession session)
			throws IOException {
		User user = (User) session.getAttribute("user");
		long imgMin = 1L, imgMax = 30000000L;
		String[] imgAuthSuffix = { "jpg", "png" };
		if (!UpLoadFile.isEqualsIgnoreCaseSuffix(userHeadImg, imgAuthSuffix)) {
			return String.format("上传文件类型必须是%s(可忽略大小写)", Arrays.asList(imgAuthSuffix).toString());
		}
		if (!UpLoadFile.isSize(userHeadImg, imgMin, imgMax)) {
			return String.format("上传文件大小必须在%d和%d间", imgMin, imgMax);
		}

		Integer uid = user.getId();
		UserInfo realUI = userInfoService.getByUser(uid);
		if (realUI == null) {
			realUI = new UserInfo();
			realUI.setUid(uid);
			userInfoService.dynamicInsert(realUI);
		}

		String fileSuffix = UpLoadFile.getFileSuffix(userHeadImg.getSubmittedFileName());
		String fileNameWithSuffix = String.format("headImg.%s", fileSuffix);
		String custImgFloder = String.format("images/user/%d/userInfo/%s", user.getId(), fileNameWithSuffix);
		String filePath = request.getServletContext().getRealPath(custImgFloder);
		File file = new File(filePath);
		File parentFile = file.getParentFile();
		if (parentFile.exists()) {
			file.getParentFile().mkdirs();
		}
		realUI.setHeadImg(custImgFloder);

		user.setHeadImg(custImgFloder);
		user.setUserInfo(realUI);

		userHeadImg.write(filePath);

		userService.dynamicUpdate(user);
		userInfoService.dynamicUpdate(realUI);

		session.setAttribute("user", user);
		return "success";

	}

	/* 异步上传用户信息图片 */
	@RequestMapping(value = "fore/user/userinfo/{img}", produces = "text/plain;charset=UTF-8")
	public String upLoadUserInfoImg(@PathVariable String img, @RequestPart Part userInfoImg, HttpServletRequest request,
			HttpSession session) throws IOException {

		String[] imgNames = { "browserIcon", "headImg", "backgroundImg", "wnMaxCard" };
		if (!Arrays.asList(imgNames).contains(img)) {
			return "上传文件路径错误";
		}
		if (!UpLoadFile.isImage(userInfoImg)) {
			return "上传文件必须是图片格式";
		}

		User user = (User) session.getAttribute("user");
		Integer uid = user.getId();
		UserInfo realUI = userInfoService.getByUser(uid);
		if (realUI == null) {
			realUI = new UserInfo();
			realUI.setUid(uid);
			userInfoService.dynamicInsert(realUI);
		}
		String[] imgAuthSuffix = { "icon", "jpg", "png" };
		long imgMin = 1L;
		long imgMax = 30000000L;

		String custImgFloder = String.format("images/user/%d/userInfo/", user.getId());
		String fileNameWithSuffix = "";
		String fileSuffix = UpLoadFile.getFileSuffix(userInfoImg.getSubmittedFileName());
		StringBuffer filePath = new StringBuffer(custImgFloder);
		String msg = "";
		switch (img) {
		case "browserIcon":
			String[] browserIconAuthSuffix = { "icon" };
			long bIMin = 1L;
			long bIMax = 100000L;
			if (!UpLoadFile.isEqualsIgnoreCaseSuffix(userInfoImg, browserIconAuthSuffix)) {
				msg = String.format("上传文件类型必须是%s(可忽略大小写)", Arrays.asList(browserIconAuthSuffix).toString());
				break;
			}
			if (!UpLoadFile.isSize(userInfoImg, imgMin, imgMax)) {
				msg = String.format("上传文件大小必须在%d和%d间", bIMin, bIMax);
				break;
			}
			fileNameWithSuffix = String.format("browserIcon.%s", fileSuffix);
			realUI.setBrowserIcon(filePath.toString());
			break;
		case "headImg":
		case "backgroundImg":
		case "wnMaxCard":
			if (!UpLoadFile.isEqualsIgnoreCaseSuffix(userInfoImg, imgAuthSuffix)) {
				msg = String.format("上传文件类型必须是%w(可忽略大小写)", Arrays.asList(imgAuthSuffix).toString());
				break;
			}
			if (!UpLoadFile.isSize(userInfoImg, imgMin, imgMax)) {
				msg = String.format("上传文件大小必须在%d和%d间", imgMin, imgMax);
				break;
			}
			fileNameWithSuffix = String.format("%s.%s", img, fileSuffix);
			// filePath.append(fileNameWithSuffix);
			switch (img) {
			case "headImg":
				realUI.setHeadImg(filePath.toString() + fileNameWithSuffix);
				break;
			case "backgroundImg":
				realUI.setBackgroundImg(filePath.toString() + fileNameWithSuffix);
				break;
			case "wnMaxCard":
				realUI.setWnMaxCard(filePath.toString() + fileNameWithSuffix);
				break;
			}
			break;
		default:

			break;
		}

		if (!"".equals(msg)) {
			return msg;
		}
		String path = request.getServletContext().getRealPath(filePath.toString() + fileNameWithSuffix);
		File file = new File(path);
		if (!file.getParentFile().exists()) {
			file.getParentFile().mkdirs();
		}
		// TODO 更新图片
		userInfoImg.write(path);

		userInfoService.dynamicUpdate(realUI);
		if ("headImg".equals(img)) {
			user.setHeadImg(filePath.toString() + fileNameWithSuffix);
			userService.dynamicUpdate(user);
		}

		System.out.println(filePath.toString());

		user.setUserInfo(realUI);
		session.setAttribute("user", user);

		return "success";
	}

	/* 异步增加文章 */
	@RequestMapping(value = "foreaddArticleAsync", produces = "text/plain;charset=UTF-8")
	public String addArticleAsync(@Validated({ Insert.class }) Article article, BindingResult bindingResult,
			HttpSession session) {
		if (bindingResult.hasErrors()) {
			return "表单有误";
		}
		ArticleStatu articleStatu = article.getArticleStatu();
		if (null == articleStatu) {
			articleStatu = ArticleStatu.PUBLISH;
		}
		if (ArticleStatu.DELETED.equals(articleStatu)) {
			return "增加文章失败(不能写垃圾文章)";
		}
		User user = (User) session.getAttribute("user");
		article.setUid(user.getId());
		article.setCreateDate(LocalDateTime.now());
		articleService.dynamicInsert(article);
		Integer aid = article.getId();
		ArticleContent articleContent = articleContentService.getByArticle(aid);
		if (null == articleContent) {
			articleContent = new ArticleContent();
			articleContent.setAid(aid);
			articleContentService.dynamicUpdate(articleContent);
		}
		System.out.println("foreeditArticle?aid=" + aid);
		return "foreeditArticle?aid=" + aid;
	}

	/* 异步编辑文章 */
	@RequestMapping(value = "foreeditArticleAsync", produces = "text/plain;charset=UTF-8")
	public String editArticleAsync(@Validated(Update.class) Article article, BindingResult bindingResult,
			HttpSession session) {
		if (bindingResult.hasErrors()) {
			return "表单有误";
		}
		Integer aid = article.getId();
		User user = (User) session.getAttribute("user");
		List<Integer> aids = articleService.listArtileIdByUser(user.getId());
		if (!aids.contains(aid)) {
			return "你不配编辑此文章";
		}
		ArticleStatu articleStatu = articleService.getArticleStatu(aid);

		if (ArticleStatu.DELETED.equals(articleStatu)) {
			return "编辑文章失败(不能编辑垃圾文章)";
		}
		// article.setUpdateDate(LocalDateTime.now());

		articleService.dynamicUpdate(article);

		return "foreeditArticle?aid=" + article.getId();
	}

	/* 异步仅编辑文章 */
	@RequestMapping(value = "foreonlyEditArticleAsync", produces = "text/plain;charset=UTF-8")
	public String onlyEditArticleAsync(@Validated(Update.class) Article article, BindingResult bindingResult,
			HttpSession session) {
		if (bindingResult.hasErrors()) {
			return "表单有误";
		}
		Integer aid = article.getId();
		User user = (User) session.getAttribute("user");
		List<Integer> aids = articleService.listArtileIdByUser(user.getId());
		if (!aids.contains(aid)) {
			return "你不配编辑此文章";
		}
		ArticleStatu articleStatu = articleService.getArticleStatu(aid);

		if (ArticleStatu.DELETED.equals(articleStatu)) {
			return "编辑文章失败(不能编辑垃圾文章)";
		}

		articleService.dynamicUpdate(article);

		return "success";
	}

	/* 异步检查文章和文章内容【编辑和删除】 */
	@RequestMapping(value = "forecheckOwnArticleContent", produces = "text/plain;charset=UTF-8")
	public String checkOwnArticleContent(@RequestParam Integer aid, @RequestParam Integer acid, HttpSession session) {
		User user = (User) session.getAttribute("user");
		String isOwn = "no";
		String isMatch = "no";
		if (user != null) {
			List<Integer> aids = articleService.listArtileIdByUser(user.getId());
			if (aids.contains(aid)) {
				isOwn = "yes";
			}
		}
		ArticleContent originArticleContent = articleContentService.getByArticle(aid);
		if (originArticleContent.getAid().equals(aid) && originArticleContent.getId().equals(acid)) {
			isMatch = "yes";
		}
		System.out.println(String.format("%s-%s", isOwn, isMatch));
		return String.format("%s-%s", isOwn, isMatch);
	}

	/* 异步编辑文章内容 */
	@RequestMapping(value = "foreeditArticleContentAsync", produces = "text/plain;charset=UTF-8")
	public String editArticleContentAsync(@Validated(Update.class) ArticleContent articleContent,
			BindingResult bindingResult, HttpSession session) {

		if (bindingResult.hasErrors()) {
			return "表单有误";
		}

		Integer aid = articleContent.getAid();
		User user = (User) session.getAttribute("user");
		List<Integer> aids = articleService.listArtileIdByUser(user.getId());
		if (!aids.contains(aid)) {
			return "你不配编辑此文章内容";
		}
		ArticleStatu articleStatu = articleService.getArticleStatu(aid);

		if (ArticleStatu.DELETED.equals(articleStatu)) {
			return "编辑文章失败(不能编辑垃圾文章)";
		}

		Article article = new Article();
		article.setId(articleContent.getAid());
		article.setUpdateDate(LocalDateTime.now());
		articleService.dynamicUpdate(article);
		// 更新
		articleContentService.dynamicUpdate(articleContent);
		System.out.println(articleContent);

		return "success";

	}

	/* 异步收藏文章 */
	@RequestMapping(value = "forecollectArticleAsync", produces = "text/plain;charset=UTF-8")
	public String collectArticleAsync(@RequestParam(value = "id") Integer aid,
			@RequestParam(value = "gid", required = false) List<Integer> gids, HttpSession session) {
		Article article = articleService.get(aid);
		// 文章不存在或不是发布文章
		if (null == article || !ArticleStatu.PUBLISH.equals(article.getArticleStatu())) {
			return "不能收藏该文章(文章不存在或不是发布文章)";
		}

		User user = (User) session.getAttribute("user");
		Integer uid = user.getId();

		List<ArticleFavority> afs = articleFavorityService.listByUserAndArticle(uid, aid);
		List<Integer> deleteIds = new ArrayList<>();
		if (null == gids) {
			// 批量删除
			for (ArticleFavority af : afs) {
				deleteIds.add(af.getId());
			}
			articleFavorityService.batchDelete(deleteIds);
		} else {
			Map<Integer, Integer> existMap = new HashMap<>();
			for (ArticleFavority af : afs) {
				existMap.put(af.getGid(), af.getId());
			}
			System.out.println(existMap);
			Iterator<Integer> iterator = gids.iterator();
			while (iterator.hasNext()) {
				Integer gid = iterator.next();
				if (existMap.containsKey(gid)) {
					existMap.remove(gid);
					iterator.remove();
				}
			}
			if (!existMap.isEmpty()) {
				for (Integer deleteId : existMap.values()) {
					deleteIds.add(deleteId);
				}
			}

			// 批量删除
			if (deleteIds.size() != 0) {
				articleFavorityService.batchDelete(deleteIds);
			}
			// gids去重
			List<Integer> insertGids = gids.stream().distinct().collect(Collectors.toList());

			if (insertGids.size() != 0) {
				List<ArticleFavority> articleFavorities = new ArrayList<>();
				for (Integer gid : insertGids) {
					ArticleFavority af = new ArticleFavority(aid, gid);

					articleFavorities.add(af);
				}

				// 批量增加
				articleFavorityService.batchInsert(articleFavorities);
			}
		}

		List<ArticleFavority> newafs = articleFavorityService.listByUserAndArticle(uid, aid);

		// 如果为null或长度为0，则没有收藏
		if (null == newafs || newafs.size() == 0) {
			return "no";
		}
		return "yes";
	}

	/* 异步清除组内指定的失效文章【文章为空或文章状态不为PUBLISH】 */
	@RequestMapping(value = "foreclearDsgtInvalidArticleFavorityInGroupAsync", produces = "text/plain;charset=UTF-8")
	public String clearDsgtInvalidArticleFavorityInGroupAsync(@RequestParam Integer afid, HttpSession session) {
		User user = (User) session.getAttribute("user");

		ArticleFavority articleFavority = articleFavorityService.get(afid);
		if (articleFavority == null) {
			return "不能清除组内指定的失效文章(用户压根没收藏)";
		}
		Group g = groupService.get(articleFavority.getGid());
		if (g == null || !g.getUid().equals(user.getId())) {
			return "不能清除组内指定的失效文章(用户没有创建该分组)";
		}
		articleFavorityService.delete(afid);
		return JSONObject.toJSONString(afid);
	}

	/* 异步清除指定组的失效文章【文章为空或文章状态不为PUBLISH】 */
	@RequestMapping(value = "foreclearInvalidArticleFavoritiesInDsgtGroupAsync", produces = "text/plain;charset=UTF-8")
	public String clearInvalidArticleFavoritiesInDsgtGroupAsync(@RequestParam Integer gid, HttpSession session) {
		User user = (User) session.getAttribute("user");

		Group g = groupService.get(gid);
		if (g == null || !g.getUid().equals(user.getId())) {
			return "不能清除指定组的失效文章(用户没有创建该分组)";
		}
		List<Integer> invalidArticleIds = new ArrayList<>();
		List<ArticleFavority> afs = articleFavorityService.listByGroup(gid);
		for (ArticleFavority af : afs) {
			Integer aid = af.getAid();
			Article article = articleService.get(aid);
			if (article == null || article.getArticleStatu() != ArticleStatu.PUBLISH) {
				invalidArticleIds.add(af.getId());
			}
		}
		if (invalidArticleIds.size() != 0) {
			articleFavorityService.batchDelete(invalidArticleIds);
			return "success-" + JSONObject.toJSONString(invalidArticleIds);
		}
		return "失效已经完全清除";
	}

	/* 异步清除全部组的所有失效文章【文章为空或文章状态不为PUBLISH】 */
	@RequestMapping(value = "foreclearInvalidAFInAllGroupsAsync", produces = "text/plain;charset=UTF-8")
	public String clearInvalidArticleFavoritiesInAllGroupsAsync(HttpSession session) {
		User user = (User) session.getAttribute("user");

		List<Integer> invalidArticleIds = new ArrayList<>();
		List<Group> gs = groupService.listByUser(user.getId());
		for (Group g : gs) {
			List<ArticleFavority> afs = articleFavorityService.listByGroup(g.getId());
			for (ArticleFavority af : afs) {
				Integer aid = af.getAid();
				Article article = articleService.get(aid);
				// 若文章为空或不是发布文章
				if (article == null || article.getArticleStatu() != ArticleStatu.PUBLISH) {
					invalidArticleIds.add(af.getId());
				}
			}
		}
		if (invalidArticleIds.size() != 0) {
			articleFavorityService.batchDelete(invalidArticleIds);
			return "success-" + JSONObject.toJSONString(invalidArticleIds);
		}
		return "失效已经完全清除";
	}

	/* 列出对应组 */
	@RequestMapping(value = "forelistGroupAsync", produces = "text/plain;charset=UTF-8")
	public String listGroupAsync(@RequestParam Integer id, @RequestParam GroupType groupType, HttpSession session) {

		System.out.println(groupType);
		System.out.println(id);
		User user = (User) session.getAttribute("user");
		Integer uid = user.getId();
		List<Group> groups = groupService.listByUserAndGroupType(uid, groupType);
		Group defaultGroup = groupService.getByUserNameAndGroupType(uid, "默认", groupType);
		if (null == defaultGroup) {
			Group group = new Group();
			group.setName("默认");
			group.setUid(uid);
			group.setGroupType(groupType);
			group.setVisibility(Visibility.VISIBLE);
			groupService.dynamicInsert(group);
			groups.add(group);
		}

		String groupsJson = JSONObject.toJSONString(groups);
		String aboutsJson = "";
		switch (groupType) {
		case USER_FOLLOW:
			List<UserFollow> ufs = userFollowService.listByFollowerAndUser(uid, id);
			aboutsJson = JSONObject.toJSONString(ufs);
			break;
		case ARTICLE_FAVORITY:
			List<ArticleFavority> afs = articleFavorityService.listByUserAndArticle(uid, id);
			aboutsJson = JSONObject.toJSONString(afs);
			break;
		default:
			break;
		}
		return String.format("%s-%s", groupsJson, aboutsJson);
	}

	/* 异步关注用户 */
	@RequestMapping(value = "forefollowUserAsync", produces = "text/plain;charset=UTF-8")
	public String followUserAsync(@RequestParam(value = "id") Integer uid,
			@RequestParam(value = "gid", required = false) List<Integer> gids, HttpSession session) {
		User follower = userService.get(uid);
		if (follower == null) {
			return "不能关注该用户(该用户不存在)";
		}

		User user = (User) session.getAttribute("user");

		if (user.getId().equals(uid)) {
			return "不能关注该用户(不能关注自己)";
		}

		Integer followerid = user.getId();
		List<UserFollow> ufs = userFollowService.listByFollowerAndUser(followerid, uid);
		List<Integer> deleteIds = new ArrayList<>();
		if (null == gids) {
			// 批量删除
			for (UserFollow uf : ufs) {
				deleteIds.add(uf.getId());
			}
			userFollowService.batchDelete(deleteIds);
		} else {
			Map<Integer, Integer> existMap = new HashMap<>();
			for (UserFollow uf : ufs) {
				existMap.put(uf.getGid(), uf.getId());
			}
			Iterator<Integer> iterator = gids.iterator();
			while (iterator.hasNext()) {
				Integer gid = iterator.next();
				if (existMap.containsKey(gid)) {
					existMap.remove(gid);
					iterator.remove();
				}
			}
			if (!existMap.isEmpty()) {
				for (Integer deleteId : existMap.values()) {
					deleteIds.add(deleteId);
				}
			}
			// 批量删除
			if (deleteIds.size() != 0) {
				userFollowService.batchDelete(deleteIds);
			}

			// gids去重
			List<Integer> insertGids = gids.stream().distinct().collect(Collectors.toList());

			// 组id剩下的
			if (insertGids.size() != 0) {
				List<UserFollow> userFollows = new ArrayList<>();
				for (Integer id : insertGids) {
					UserFollow uf = new UserFollow(uid, id);
					userFollows.add(uf);
				}
				// 批量增加
				userFollowService.batchInsert(userFollows);
			}
		}

		List<UserFollow> newufs = userFollowService.listByFollowerAndUser(followerid, uid);
		// 如果为null或长度为0，则没有收藏
		if (null == newufs || newufs.size() == 0) {
			return "no";
		}
		return "yes";
	}

	/* 异步获取指定其他用户文章 */
	@RequestMapping("fore/user/article/{uid}")
	public String listOtherArticle(@PathVariable Integer uid, HttpSession session, Page page) {
		ArticleStatu articleStatu = ArticleStatu.PUBLISH;
		/* current、pageRecord */
		PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
		List<Article> as = articleService.listByUserAndArticleStatu(uid, articleStatu);
		return JSONObject.toJSONString(as);
	}

	/* 异步获取指定自身用户文章 */
	@RequestMapping("forelistOwnrticle")
	public String listOwnArticle(@RequestParam String articleStatu, HttpSession session, Page page) {
		User user = (User) session.getAttribute("user");
		ArticleStatu asEnum = null;
		switch (articleStatu) {
		case "article":
			asEnum = ArticleStatu.PUBLISH;
			break;
		case "dustbin":
			asEnum = ArticleStatu.DELETED;
			break;
		case "draft":
			asEnum = ArticleStatu.WAIT_PUBLISH;
			break;
		default:
			break;
		}
		/* current、pageRecord */
		PageHelper.startPage(page.getPageFirst(), page.getPageRecord());
		List<Article> as = articleService.listByUserAndArticleStatu(user.getId(), asEnum);
		return JSONObject.toJSONString(as);
	}

	/* 异步新建分组 */
	@RequestMapping(value = "foreaddGroupAsync", produces = "text/plain;charset=UTF-8")
	public String addGroupAsync(@Validated({ Insert.class }) Group group, BindingResult bindingResult,
			HttpSession session) {
		if (bindingResult.hasErrors()) {
			return "表单有误";
		}
		User user = (User) session.getAttribute("user");
		Integer uid = user.getId();
		Group isExist = groupService.getByUserNameAndGroupType(uid, group.getName(), group.getGroupType());
		if (null != isExist) {
			return "分组名重复";
		}

		group.setUid(uid);
		groupService.dynamicInsert(group);

		return "success-" + JSONObject.toJSONString(group);
	}

	/* 异步检查分组【编辑和删除】 */
	@RequestMapping("forecheckOwnGroup")
	public String checkOwnGroup(@RequestParam Integer gid, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			List<Integer> gids = groupService.listGroupIdByUser(user.getId());
			if (gids.contains(gid)) {
				return "yes";
			}
		}
		return "no";
	}

	/* 异步编辑分组 */
	@RequestMapping(value = "foreeditGroupAsync", produces = "text/plain;charset=UTF-8")
	public String editGroupAsync(@Validated({ Update.class }) Group group, BindingResult bindingResult,
			HttpSession session) {
		if (bindingResult.hasErrors()) {
			return "表单有误";
		}
		User user = (User) session.getAttribute("user");
		Integer uid = user.getId();
		Integer gid = group.getId();
		Group defaultGroup = groupService.get(gid);
		if (null == defaultGroup) {
			return "你是沙雕吗？根本就没有此分组";
		}
		if (!defaultGroup.getUid().equals(uid)) {
			return "你太可恶了，竟然想编辑别人的分组";
		}
		if (defaultGroup.getName().equals("默认")) {
			return "不能修改默认分组";
		}

		Group isExist = groupService.getByUserNameAndGroupType(uid, group.getName(), group.getGroupType());
		// 若id不同，则重复
		if (null != isExist && !isExist.getId().equals(gid)) {
			return "分组名重复";
		}
		group.setUid(uid);
		groupService.dynamicUpdate(group);
		return "success";
	}

	/* 异步删除分组 */
	@RequestMapping(value = "foredeleteGroupAsync", produces = "text/plain;charset=UTF-8")
	public String deleteGroupAsync(@RequestParam Integer gid, @RequestParam(required = false) String isSave,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		Integer uid = user.getId();
		// TODO
		// 有一个表单元素记录是否删除分组相关
		// 是：获取对应类型的默认分组下的相关id，要删除分组相关id 相同填到批量删除id 批量删除；剩下的将gid改成默认分组id，批量增加
		// 否：先将分组下的相关批量删除，后删除分组
		Group group = groupService.get(gid);
		if (group == null) {
			return "你是沙雕吗？没有此分组";
		}
		if (!group.getUid().equals(uid)) {
			throw new CustException("你太可恶了！竟然想删别人分组");
		}
		if ("默认".equals(group.getName())) {
			return "不能删除默认分组";
		}
		GroupType groupType = group.getGroupType();
		// delete 删除有的，更新没的;deleteAll 删除全部
		String msg = ("on".equals(isSave)) ? "delete" : "deleteAll";
		System.out.println(msg);

		// 将要删除组的相关添加到默认组
		if ("on".equals(isSave)) {
			Group defaultGroup = groupService.getByUserNameAndGroupType(uid, "默认", groupType);
			if (null == defaultGroup) {
				defaultGroup = new Group("默认", Visibility.VISIBLE, groupType, user.getId());
				groupService.dynamicInsert(defaultGroup);
			}
			Integer defaultGid = defaultGroup.getId();
			System.out.println(defaultGid);
			List<Integer> deleteIds = new ArrayList<>();

			switch (groupType) {
			case USER_FOLLOW:
				List<UserFollow> originUFs = userFollowService.listByGroup(gid);
				// 原组为0则直接删除
				if (null == originUFs || originUFs.size() == 0) {
					break;
				}

				List<Integer> defaultUFUid = new ArrayList<>();
				List<UserFollow> defaultUFs = userFollowService.listByGroup(defaultGid);
				Iterator<UserFollow> iterator = originUFs.iterator();
				if (null == defaultUFs || defaultUFs.size() == 0) {
					while (iterator.hasNext()) {
						UserFollow uf = iterator.next();
						uf.setGid(defaultGid);
					}
				} else {
					for (UserFollow uf : defaultUFs) {
						defaultUFUid.add(uf.getUid());
					}
					while (iterator.hasNext()) {
						UserFollow uf = iterator.next();
						if (defaultUFUid.contains(uf.getUid())) {
							deleteIds.add(uf.getId());
							iterator.remove();
						} else {
							uf.setGid(defaultGid);
						}
					}
				}

				if (originUFs.size() != 0) {
					userFollowService.dynamicBatchUpdate(originUFs);
				}
				if (deleteIds.size() != 0) {
					userFollowService.batchDelete(deleteIds);
				}
				break;
			case ARTICLE_FAVORITY:
				List<ArticleFavority> originAFs = articleFavorityService.listByGroup(gid);
				// 原组为0则直接删除
				if (null == originAFs || originAFs.size() == 0) {
					break;
				}

				List<Integer> defaultAFAid = new ArrayList<>();
				List<ArticleFavority> defaultAFs = articleFavorityService.listByGroup(defaultGid);
				Iterator<ArticleFavority> iterator2 = originAFs.iterator();
				// 若默认组为0，全部改为默认组ID
				if (null == defaultAFs || defaultAFs.size() == 0) {

					while (iterator2.hasNext()) {
						ArticleFavority af = iterator2.next();
						af.setGid(defaultGid);
					}
				} else {
					// 若默认组不为0，默认包含原组相关ID，原组移除，加入删除IDs。否则改为默认组ID
					for (ArticleFavority af : defaultAFs) {
						defaultAFAid.add(af.getAid());
					}
					while (iterator2.hasNext()) {
						ArticleFavority af = iterator2.next();
						if (defaultAFAid.contains(af.getAid())) {
							deleteIds.add(af.getId());
							iterator2.remove();
						} else {
							af.setGid(defaultGid);
						}
					}

				}

				if (originAFs.size() != 0) {
					articleFavorityService.dynamicBatchUpdate(originAFs);
				}

				if (deleteIds.size() != 0) {
					articleFavorityService.batchDelete(deleteIds);
				}
				break;
			}
		} else {
			// 删除全部
			List<Integer> deleteAllIds = new ArrayList<>();
			switch (groupType) {
			case USER_FOLLOW:
				List<UserFollow> originUFs = userFollowService.listByGroup(gid);
				if (null != originUFs && originUFs.size() != 0) {
					for (UserFollow uf : originUFs) {
						deleteAllIds.add(uf.getId());
					}
					if (deleteAllIds.size() != 0) {
						userFollowService.batchDelete(deleteAllIds);
					}
				}
				break;
			case ARTICLE_FAVORITY:
				List<ArticleFavority> originAFs = articleFavorityService.listByGroup(gid);
				if (null != originAFs && originAFs.size() != 0) {
					for (ArticleFavority af : originAFs) {
						deleteAllIds.add(af.getId());
					}
					if (deleteAllIds.size() != 0) {
						articleFavorityService.batchDelete(deleteAllIds);
					}
				}
				break;
			}
		}

		// 最后删除分组
		groupService.delete(gid);
		return msg;
	}

	/* 异步上传文章图片 */
	// "editormd-image-file"
	// 上传成功没回显url：success 类型为数字类型，不应为字符串
	// ![万利](/pblog/images/user/1/article/1/1.4.jpg "万利")
	@RequestMapping(value = "foreupLoadArticleImgAsync", produces = "text/plain;charset=UTF-8")
	public String upLoadArticleImgAsync(@RequestPart("editormd-image-file") Part articleImg, @RequestParam Integer aid,
			HttpServletRequest request, HttpSession session) throws IOException {
		JSONObject jsonObject = new JSONObject();

		User user = (User) session.getAttribute("user");
		Integer uid = user.getId();
		List<Integer> aids = articleService.listArtileIdByUser(uid);
		if (!aids.contains(aid)) {
			jsonObject.put("success", 0);
			jsonObject.put("message", "你太可恶了，竟然想上传别人文章的图片");
			return jsonObject.toJSONString();
		}

		if (!UpLoadFile.isImage(articleImg)) {
			jsonObject.put("success", 0);
			jsonObject.put("message", "上传文件必须是图片格式");
			System.out.println(jsonObject);
			return jsonObject.toJSONString();
		}
		long imgMin = 1L, imgMax = 300000L;
		String[] imgAuthSuffix = { "jpg", "png", "jpeg", "gif", "bmp", "webp" };
		if (!UpLoadFile.isEqualsIgnoreCaseSuffix(articleImg, imgAuthSuffix)) {
			jsonObject.put("success", 0);
			jsonObject.put("message", String.format("上传文件类型必须是%s(可忽略大小写)", Arrays.asList(imgAuthSuffix).toString()));
			System.out.println(jsonObject);
			return jsonObject.toJSONString();
		}
		if (!UpLoadFile.isSize(articleImg, imgMin, imgMax)) {
			jsonObject.put("success", 0);
			jsonObject.put("message", String.format("上传文件大小必须在%d和%d间", imgMin, imgMax));
			System.out.println(jsonObject);
			return jsonObject.toJSONString();
		}

		String custImgFloder = String.format("images/user/%d/article/%d/", uid, aid);
		// String fileSuffix =
		// UpLoadFile.getFileSuffix(articleImg.getSubmittedFileName());
		String fileNameWithSuffix = articleImg.getSubmittedFileName();
		String filePath = new String(custImgFloder + fileNameWithSuffix);
		String path = request.getServletContext().getRealPath(filePath);
		File file = new File(path);
		if (!file.getParentFile().exists()) {
			file.getParentFile().mkdirs();
		}

		articleImg.write(path);

		jsonObject.put("success", 1);
		jsonObject.put("message", "上传文章图片成功");
		jsonObject.put("url", request.getContextPath() + "/" + filePath);
		System.out.println(jsonObject);
		return jsonObject.toJSONString();
	}

	@RequestMapping(value = "foresaveUserSettingOfHistoryAsync", produces = "text/plain;charset=UTF-8")
	public String foresaveUserSettingOfHistoryAsync(@RequestParam(required = false) Integer isRecordLoginSuccessHistory,
			@RequestParam(required = false) Integer isRecordLoginFailHistory,
			@RequestParam(required = false) Integer isRecordShowArticleHistory, HttpSession session) {
		User user = (User) session.getAttribute("user");

		UserSetting userSetting = (UserSetting) session.getAttribute("userSetting");

		UserSetting newUserSetting = new UserSetting();
		newUserSetting.setId(userSetting.getId());
		newUserSetting.setUid(user.getId());
		Integer[] isInteger = { 0, 1 };
		List<Integer> is = Arrays.asList(isInteger);
		String msg = "";

		if (null != isRecordLoginSuccessHistory && is.contains(isRecordLoginSuccessHistory)) {
			userSetting.setIsRecordLoginSuccessHistory(isRecordLoginSuccessHistory);
			newUserSetting.setIsRecordLoginSuccessHistory(isRecordLoginSuccessHistory);
			msg = (isRecordLoginSuccessHistory == 1) ? "设置记录登陆成功历史成功" : "设置不记录登陆成功历史成功";
		} else if (null != isRecordLoginFailHistory && is.contains(isRecordLoginFailHistory)) {
			userSetting.setIsRecordLoginFailHistory(isRecordLoginFailHistory);
			newUserSetting.setIsRecordLoginFailHistory(isRecordLoginFailHistory);
			msg = (isRecordLoginFailHistory == 1) ? "设置记录登陆失败历史成功" : "设置不记录登陆失败历史成功";
		} else if (null != isRecordShowArticleHistory && is.contains(isRecordShowArticleHistory)) {
			userSetting.setIsRecordShowArticleHistory(isRecordShowArticleHistory);
			newUserSetting.setIsRecordShowArticleHistory(isRecordShowArticleHistory);
			msg = (isRecordShowArticleHistory == 1) ? "设置记录展示文章历史成功" : "设置不记录展示文章历史成功";
		}
		if ("".equals(msg)) {
			return "fail";
		}
		userSettingService.dynamicUpdate(newUserSetting);
		session.setAttribute("userSetting", newUserSetting);
		return msg;
	}

	/* 清空登陆历史 */
	@RequestMapping(value = "foreclearLoginHistoryAsync", produces = "text/plain;charset=UTF-8")
	public String foreclearLoginHistoryAsync(HttpSession session) {
		User user = (User) session.getAttribute("user");

		List<LoginHistory> loginHistory = loginHistoryService.listByUser(user.getId());
		List<Integer> deleteIds = new ArrayList<>();
		for (LoginHistory lh : loginHistory) {
			deleteIds.add(lh.getId());
		}
		if (deleteIds.size() != 0) {
			loginHistoryService.batchDelete(deleteIds);
			return "success";
		}
		return "没有多余的登陆历史让你清空";
	}

	/* 删除展示文章历史 */
	@RequestMapping(value = "foredeleteArticleHistoryAsync", produces = "text/plain;charset=UTF-8")
	public String foredeleteShowArticleHistoryAsync(@RequestParam Integer ahid, HttpSession session) {
		User user = (User) session.getAttribute("user");

		ArticleHistory articleHistory = articleHistoryService.get(ahid);
		if (null == articleHistory) {
			return "没有此文章历史";
		}
		if (!articleHistory.getUid().equals(user.getId())) {
			return "你太可恶了，竟然想删除别人的文章历史";
		}
		articleHistoryService.delete(ahid);
		return "success";
	}

	/* 清空展示文章历史 */
	@RequestMapping(value = "foreclearArticleHistoryAsync", produces = "text/plain;charset=UTF-8")
	public String foreclearShowArticleHistoryAsync(HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Integer> deleteIds = articleHistoryService.listIdByUser(user.getId());
		if (deleteIds.size() != 0) {
			articleHistoryService.batchDelete(deleteIds);
			return "success";
		}
		return "没有多余的文章历史让你清空";
	}
}
