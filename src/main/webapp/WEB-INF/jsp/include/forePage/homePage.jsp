<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>


<div class="home container-fluid center-block">
	<!-- 悬浮菜单图标 拖拽部件 -->
	<span class="open-suspend-menu suspend-menu-icon drag-part visible-xs">文章分类</span>
	<div class="row">

		<div class="col-xs-12 col-sm-10 col-md-10">

			<c:forEach items="${categorys}" var="category">

				<div id="category-${category.id}" class="category-group">
					<!-- 分类-标题 -->
					<div class="category-title lead">
						<a href="<s:url value="/fore/category/${category.id}/articles" />"
							class="text-muted" target="_blank"><span class="">${category.name}</span></a>
						<span> <a
							href="<s:url value="/fore/category/${category.id}/articles" />"
							class="btn btn-default btn-sm">更多<span
								class="glyphicon glyphicon-chevron-right"></span></a>
						</span>
					</div>
					<!-- 分类-容器 -->
					<div class="category-container">

						<div class="category-head"></div>
						<div class="category-body">
							<c:if
								test="${!empty category.articles|| fn:length(category.articles)!=0}">
								<c:forEach items="${category.articles}" var="carticle">
									<c:set value="${carticle.user}" var="author"></c:set>
									<div class="category-article">
										<div class="article-heaer">

											<span class="createDate" data-toggle="tooltip" title="创建时间">${carticle.createDate}</span>
											<span class="updateDate" data-toggle="tooltip" title="更新时间">${carticle.updateDate}</span>
										</div>
										<div class="article-body">

											<a
												href="<s:url value="/foreshowArticle?aid=${carticle.id}" />"
												class="text-muted"><span class="">${carticle.title}</span></a>
											<a
												href="<s:url value="/foreshowArticle?aid=${carticle.id}" />"
												class="text-muted"><span class="">${carticle.subTitle}</span></a>
											<a href="<s:url value="/fore/user/${author.id}" />"
												class="text-muted"><span
												class="glyphicon glyphicon-user"></span>${author.name}</a>
										</div>
										<div class="article-foot" data-toggle="tooltip"
											data-placement="bottom" title="收藏量、点击量、浏览量">
											<span class="glyphicon glyphicon-star-empty"></span> <span
												class="badge">${carticle.collectNum}</span> <span
												class="iconfont icon-dinaji"></span> <span class="badge">${carticle.clickNum}</span>
											<span class="glyphicon glyphicon-eye-open"></span> <span
												class="badge">${carticle.viewNum}</span>
										</div>
									</div>
								</c:forEach>
							</c:if>

							<c:if
								test="${empty category.articles|| fn:length(category.articles)==0}">
								<div class="jumbotron">
									<h3>${category.name}分类暂时还没有文章，不如。。。</h3>
									<button class="btn btn-default btn-primary write-article-btn"
										articlestatu="article">贡献${category.name}分类文章</button>
								</div>
							</c:if>

						</div>
						<div class="category-foot"></div>
					</div>
				</div>

			</c:forEach>

		</div>


		<div class="col-xs-12 col-sm-2 col-md-1 visible-xs">
			<div class="suspend-menu">
				<!-- 悬浮-菜单-按钮组 -->
				<div class="suspend-menu-btn-group clearfix">
					<span
						class="close-suspend-menu glyphicon glyphicon-remove pull-right visible-xs"></span>
				</div>
				<!-- 悬浮菜单导航 -->
				<div class="suspend-menu-nav">
					<!-- 悬浮菜单导航标题 -->
					<div class="suspend-menu-nav-title visible-xs">
						<span>文章分类</span>
					</div>
					<!-- 悬浮-菜单-导航-列表 -->
					<div class="suspend-menu-nav-list">
						<!-- 菜单导航 -->
						<div class="menu-nav">
							<!-- 菜单列表 -->
							<div class="menu-list">
								<!-- 分类-导航 -->
								<div class="category-nav">
									<div class="category-nav-container">
										<div class="category-list">

											<c:forEach items="${categorys}" var="category">
												<div class="category-item col-xs-12">
													<a href="#category-${category.id}" class="">${category.name}</a>
												</div>
											</c:forEach>

										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<div id="category-nav-bar" class="hidden-xs">
	<div id="category-crollspy" class="category-nav-container">
		<div class="category-list">

			<c:forEach items="${categorys}" var="category">
				<div class="category-item col-xs-12">
					<a href="#category-${category.id}" class="">${category.name}</a>
				</div>
			</c:forEach>

		</div>
	</div>
</div>



