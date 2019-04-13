<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:if test="${empty otherUser && !empty user}">

	<c:set value="${user.userInfo}" var="ui"></c:set>
	<c:set value="${user.userNum}" var="un"></c:set>
	<nav id="user-nav"
		class="navbar navbar-default container-fluid center-block"
		role="user-nav">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-usernav-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<a class="navbar-brand nav-slider"
				href="<s:url value="/fore/user/${user.id}" />"><span
				class="glyphicon glyphicon-home"></span></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-usernav-collapse">
			<ul class="nav navbar-nav">
				<li class="nav-slider"><a
					href="<s:url value="/fore/user/${user.id}/articles" />"><span
						class="iconfont icon-svgwrite"></span>文章</a></li>
				<li class="nav-slider"><a
					href="<s:url value="/fore/user/${user.id}/articleFavorities" />"><span
						class="iconfont icon-shoucangjia1"></span>文章收藏</a></li>
				<form id="search-other-article-form" class="navbar-form navbar-left"
					action="<s:url value="/fore/user/${user.id}/search/article/articles"></s:url>"
					role="search-other-article">
					<div class="form-group">
						<input type="text" name="title" class="form-control"
							placeholder="搜索${user.name}文章">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
				<li class="nav-slider"><a
					href="<s:url value="/fore/user/${user.id}/userSettings" />"><span
						class="glyphicon glyphicon-cog"></span>设置</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="nav-slider"><a
					href="<s:url value="/fore/user/${user.id}/userfollow" />"><span
						class="iconfont icon-yonghuzu"></span>关注<span class="badge">${un.followsNum}</span></a></li>
				<li class="nav-slider"><a
					href="<s:url value="/fore/user/${user.id}/userfollow/fans" />"><span
						class="iconfont icon-fensishu"></span>粉丝<span class="badge">${un.fansNum}</span></a></li>
				<li class="dropdown"><a class="dropdown-toggle nav-slider"
					data-toggle="dropdown">相关 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a class="btn"><span class="iconfont icon-dianji"></span>总点击<span
								class="badge">${un.clickNum}</span></a></li>
						<li><a class="btn"><span
								class="glyphicon glyphicon-eye-open"></span>总浏览<span
								class="badge">${un.viewNum}</span></a></li>
					</ul></li>

			</ul>
		</div>
	</nav>
</c:if>


<c:if test="${!empty otherUser}">
	<c:set value="${otherUser.userInfo}" var="oui"></c:set>
	<c:set value="${otherUser.userNum}" var="oun"></c:set>
	<nav id="user-nav"
		class="navbar navbar-default container-fluid center-block"
		role="user-nav">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-usernav-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand nav-slider"
				href="<s:url value="/fore/user/${otherUser.id}" />"><span
				class="glyphicon glyphicon-home"></span></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-usernav-collapse">
			<ul class="nav navbar-nav">
				<li class="nav-slider"><a
					href="<s:url value="/fore/user/${otherUser.id}/articles" />"><span
						class="iconfont icon-svgwrite"></span>文章</a></li>
				<li class="nav-slider"><a
					href="<s:url value="/fore/user/${otherUser.id}/articleFavorities" />"><span
						class="iconfont icon-shoucangjia1"></span>文章收藏</a></li>
				<form id="search-other-article-form" class="navbar-form navbar-left"
					action="<s:url value="/fore/user/${otherUser.id}/search/article/articles"></s:url>"
					role="search-other-article">
					<div class="form-group">
						<input type="text" name="title" class="form-control"
							placeholder="搜索${otherUser.name}文章">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="nav-slider"><a
					href="<s:url value="/fore/user/${otherUser.id}/userfollow" />"><span
						class="iconfont icon-yonghuzu"></span>关注<span class="badge">${oun.followsNum}</span></a></li>
				<li class="nav-slider"><a
					href="<s:url value="/fore/user/${otherUser.id}/userfollow/fans" />"><span
						class="iconfont icon-fensishu"></span>粉丝<span class="badge">${oun.fansNum}</span></a></li>
				<li class="dropdown"><a href="#"
					class="dropdown-toggle nav-slider" data-toggle="dropdown">相关 <b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a class="btn"><span class="iconfont icon-dianji"></span>总点击<span
								class="badge">${oun.clickNum}</span></a></li>
						<li><a class="btn"><span
								class="glyphicon glyphicon-eye-open"></span>总浏览<span
								class="badge">${oun.viewNum}</span></a></li>
					</ul></li>

			</ul>
		</div>
	</nav>
</c:if>