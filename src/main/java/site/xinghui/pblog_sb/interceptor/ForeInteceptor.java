package site.xinghui.pblog_sb.interceptor;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import site.xinghui.pblog_sb.enums.ArticleStatu;
import site.xinghui.pblog_sb.pojo.Article;
import site.xinghui.pblog_sb.pojo.User;
import site.xinghui.pblog_sb.service.ArticleFavorityService;
import site.xinghui.pblog_sb.service.ArticleService;
import site.xinghui.pblog_sb.service.UserFollowService;
import site.xinghui.pblog_sb.service.UserInfoService;
import site.xinghui.pblog_sb.service.UserService;

public class ForeInteceptor extends HandlerInterceptorAdapter {

	@Autowired
	UserService userService;
	@Autowired
	UserInfoService userInfoService;
	@Autowired
	ArticleService articleService;
	@Autowired
	UserFollowService userFollowService;
	@Autowired
	ArticleFavorityService articleFavorityService;

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

		HttpSession session = request.getSession();
		String[] interceptPage = new String[] { "showArticle" };
		String contextPath = session.getServletContext().getContextPath();
		if (beforePreHandle(request, contextPath, interceptPage)) {
			String uri = request.getRequestURI();
			uri = StringUtils.remove(uri, contextPath);
			String method = uri.split("/fore")[1];
			if ("showArticle".equals(method)) {
				Article article = (Article) request.getAttribute("showArticle");
				if (null != article && ArticleStatu.PUBLISH.equals(article.getArticleStatu())) {
					Article newArtice = new Article();
					newArtice.setId(article.getId());
					Integer viewNum = article.getViewNum();
					if (viewNum == null) {
						viewNum = 0;
					}
					newArtice.setViewNum(viewNum + 1);
					articleService.dynamicUpdate(newArtice);
				}
			}
		}
		// super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		String contextPath = session.getServletContext().getContextPath();
		String[] interceptPage = new String[] { "showArticle" };
		if (beforePreHandle(request, contextPath, interceptPage)) {

		}
		// super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String contextPath = session.getServletContext().getContextPath();
		if (null == session.getAttribute("contextPath")) {
			session.setAttribute("contextPath", contextPath);
		}

		String[] noNeedAuthPage = new String[] { "home", "checkIsLogin", "register", "loginAsync", "login", "category",
				"search", "upLoad", "downLoad", "checkUserName", "getHeadImgPath", "getOwnUserInfoImgPath",
				"checkOwnArticle", "showArticle", "test" };
		if (beforePreHandle(request, contextPath, noNeedAuthPage)) {
			String uri = request.getRequestURI();
			uri = StringUtils.remove(uri, contextPath);
			String method = uri.split("/fore")[1];
			if ("showArticle".equals(method)) {
				Integer aid = Integer.valueOf(request.getParameter("aid"));
				Article article = articleService.get(aid);
				if (null != article) {
					request.setAttribute("showArticle", article);
					if (ArticleStatu.PUBLISH.equals(article.getArticleStatu())) {
						Article newArtice = new Article();
						newArtice.setId(aid);
						Integer clickNum = article.getClickNum();
						if (clickNum == null) {
							clickNum = 0;
						}
						newArtice.setClickNum(clickNum + 1);
						articleService.dynamicUpdate(newArtice);
					}
				}
			}
		} else {
			User user = (User) session.getAttribute("user");
			if (null == user) {
				// 重定向到登录页
				response.sendRedirect(contextPath + "/loginPage");
				return false;
			}
		}
		return true;
	}

	/**
	 * 拦截指定数组里的页面，有返回true，没有返回false
	 * 
	 * uri.startsWith("/fore") && !uri.startsWith("/fore/")
	 * 
	 * @param request
	 * @param session
	 * @param interceptPage
	 *            要拦截的method组成的数组
	 * @return
	 */
	public boolean beforePreHandle(HttpServletRequest request, String contextPath, String[] interceptPage) {
		String uri = request.getRequestURI();
		uri = StringUtils.remove(uri, contextPath);
		if (uri.startsWith("/fore") && !uri.startsWith("/fore/")) {
			String method = uri.split("/fore")[1];
			if (Arrays.asList(interceptPage).contains(method)) {
				return true;
			}

		}
		if (uri.startsWith("/fore/")) {
			return true;
		}
		return false;
	}

}
