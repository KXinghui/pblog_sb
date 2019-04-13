<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:set value="${user.userInfo.wnMaxCard}" var="wnMaxCard"></c:set>

<c:set value="${otherUser.userInfo.wnMaxCard}" var="otherwnMaxCard"></c:set>


<c:if test="${empty otherwnMaxCard}">
	<!-- 边栏 -->
	<aside class="aside">
		<a class="aaside open-side-menu" title="侧边菜单"> <span
			class="glyphicon glyphicon-align-justify"></span>
		</a> <a class="aaside write-article-btn" title="写文章"
			articlestatu="article"> <span
			class="iconfont icon-tianchongxing-"></span>
		</a>
		<!-- show和edit -->
		<c:if test="${!empty article}">
			<a class="aaside article-nav-btn" title="文章导航"> <span
				class="glyphicon glyphicon-list-alt"></span>
				<div id="article-nav" class=""></div>
			</a>
		</c:if>
		<a class="aaside qrcode" title="二维码图片"> <span
			class="glyphicon glyphicon-qrcode"></span> <img class="codeImg"
			src="<c:if test = "${empty wnMaxCard}"><s:url value="/images/1.4.1.jpg" /></c:if>
          <c:if test = "${!empty wnMaxCard}"><s:url value="/${wnMaxCard}" /></c:if>">
		</a> <a id="hand-up" class="aaside hand-up" title="返回顶部"> <span
			class="glyphicon glyphicon-hand-up"></span>
		</a>
	</aside>
</c:if>

<c:if test="${!empty otherwnMaxCard}">
	<!-- 边栏 -->
	<aside class="aside">
		<a class="aaside write-article-btn" title="写文章"> <span
			class="iconfont icon-tianchongxing-"></span>
		</a>
		<!-- show和edit -->
		<c:if test="${!empty article}">
			<a class="aaside article-nav-btn" title="文章导航"> <span
				class="glyphicon glyphicon-list-alt"></span>
				<div id="article-nav" class=""></div>
			</a>
		</c:if>
		<a class="aaside qrcode" title="二维码图片"> <span
			class="glyphicon glyphicon-qrcode"></span> <img class="codeImg"
			src="<c:if test = "${empty otherwnMaxCard}"><s:url value="/images/1.4.1.jpg"/></c:if>
          <c:if test = "${!empty otherwnMaxCard}"><s:url value="/${otherwnMaxCard}" /></c:if>">
		</a> <a id="hand-up" class="aaside hand-up" title="返回顶部"> <span
			class="glyphicon glyphicon-hand-up"></span>
		</a>
	</aside>
</c:if>

<!-- 底部导航 -->
<nav id="bottom-nav"
	class="navbar navbar-default navbar-fixed-bottom alert alert-info alert-dismissable container-fluid"
	role="navigation">
	<div class="bottom-nav-info hidden-xs">我是谁？你是谁？他是谁？</div>
	<img src="<s:url value="/images/2.jpg" />"
		class="img-responsive hidden-xs">

	<div class="bottom-nav-op">
		<c:if test="${!empty user}">
			<a href="<s:url value="/editUserInfoPage?act=editBrowserIcon"/>"
				class="alert-link"><button class="btn btn-info">自定义图片</button></a>
			<a href="<s:url value="/editUserInfoPage" />" class="alert-link"><button
					class="btn btn-info">填写用户信息</button></a>
		</c:if>

		<c:if test="${empty user}">
			<a href="<s:url value="/loginPage" />" class="alert-link"><button
					class="btn btn-info">登陆</button></a>
			<a href="<s:url value="/registerPage" />" class="alert-link"><button
					class="btn btn-info">注册</button></a>
		</c:if>
		<button type="button" style="font-size: 40px;" class="close"
			data-dismiss="alert" aria-hidden="true">&times;</button>
	</div>
</nav>