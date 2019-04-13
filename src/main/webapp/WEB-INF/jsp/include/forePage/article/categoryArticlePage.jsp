<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>


<div class="category-well well page-header">
	<h1>${category.name}
		<small>${category.name}</small>
	</h1>
	<div class="search-bar lead">
		<span class="glyphicon glyphicon-search"></span>
		<form id="search-user-article-form" class="navbar-form navbar-left"
			action="<s:url value="/fore/category/${category.id}/search/article" />"
			role="search-user-article">
			<div class="search-form">
				<input class="hidden" type="text" name="cid" placeholder=""
					value="${category.id}"> <input class="" type="text"
					name="title" placeholder="搜索${category.name}分类的文章">
				<button type="submit" class="btn btn-default btn-sm">搜索</button>
			</div>
		</form>
	</div>
</div>


<div class="article-content container-fluid">
	<div class="row">

		<!-- 文章-容器 -->
		<div
			class="article-container col-xs-12 col-sm-8 col-sm-offset-2 col-md-8 col-md-offset-2">
			<div class="article-list">
				<c:if test="${empty pr.list || fn:length(pr.list)==0}">
					<div class="jumbotron">
						<h2>${category.name}分类暂时还没有关键词为 ${title} 的文章，不如。。。</h2>
						<br> <br>
						<button
							class="btn btn-default btn-primary write-article-btn center-block">贡献${category.name}分类的文章</button>
					</div>
				</c:if>

				<c:if test="${!empty pr.list || fn:length(pr.list)!=0}">
					<c:forEach items="${pr.list}" var="article">
						<c:set value="${article.user}" var="author"></c:set>
						<div class="article-item" data-aid=${aid}>
							<div class="first">
								<span field="cid">${article.category.name}</span> <span>${article.createDate}</span>
							</div>
							<div class="second">
								<a href="<s:url value="/foreshowArticle?aid=${article.id}" />"><span
									field="title">${article.title}</span></a> <span field="subTitle">${article.subTitle}</span>
								<a href="<s:url value="/fore/user/${author.id}" />"
									class="text-muted"><span class="glyphicon glyphicon-user"></span><span
									field="title">${author.name}</span></a>
							</div>
							<div class="third">
								<div class="article-foot" data-toggle="tooltip"
									data-placement="bottom" title="收藏量、点击量、浏览量">
									<span class="glyphicon glyphicon-star-empty"></span> <span
										class="badge">${article.collectNum}</span> <span
										class="iconfont icon-dinaji"></span> <span class="badge">${article.clickNum}</span>
									<span class="glyphicon glyphicon-eye-open"></span> <span
										class="badge">${article.viewNum}</span>
								</div>
							</div>
						</div>

					</c:forEach>
				</c:if>
			</div>

			<%@include file="../paging.jsp"%>

		</div>
	</div>
</div>


