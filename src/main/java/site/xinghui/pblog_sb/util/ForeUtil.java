package site.xinghui.pblog_sb.util;

import site.xinghui.pblog_sb.enums.ArticleStatu;
import site.xinghui.pblog_sb.pojo.User;

public class ForeUtil {
	public static boolean isLogin(User user) {
		return null != user;
	}

	public static boolean isLoginAndOwnUser(Integer uid, User user) {
		return null != user && uid.equals(user.getId());
	}

	public static ArticleStatu returnAsArticleStatuStr(String articleStatuStr) {
		/* article/dustbin/drafts */
		if (articleStatuStr == null || articleStatuStr.equals("")) {
			articleStatuStr = "articles";
		}
		ArticleStatu articleStatu = null;
		switch (articleStatuStr) {
		case "articles":
		default:
			articleStatu = ArticleStatu.PUBLISH;
			break;
		case "dustbin":
			articleStatu = ArticleStatu.DELETED;
			break;
		case "drafts":
			articleStatu = ArticleStatu.WAIT_PUBLISH;
			break;
		}
		return articleStatu;
	}

	public static String returnTitleAsArticleStatuStr(String articleStatuStr) {
		/* article/dustbin/drafts */

		if (articleStatuStr == null || articleStatuStr.equals("")) {
			articleStatuStr = "articles";
		}
		String title = "";
		switch (articleStatuStr) {
		case "articles":
			title = "文章箱";
			break;
		case "dustbin":
			title = "垃圾箱";
			break;
		case "drafts":
			title = "草稿箱";
			break;
		}
		return title;
	}

}
