<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>


<c:if test="${articleStatu=='WAIT_PUBLISH'}">
	<c:set value="drafts" var="as"></c:set>
	<c:set value="草稿箱" var="asStr"></c:set>
</c:if>
<c:if test="${articleStatu=='PUBLISH'}">
	<c:set value="articles" var="as"></c:set>
	<c:set value="文章箱" var="asStr"></c:set>
</c:if>
<c:if test="${articleStatu=='DELETED'}">
	<c:set value="dustbin" var="as"></c:set>
	<c:set value="垃圾箱" var="asStr"></c:set>
</c:if>

<c:set var="impParam">
	<c:forEach items="${page.paramMap}" var="map">
		<c:if test="${(fn:length(map.value)) != 1}">
			<c:forEach items="${map.value}" var="v">
           ${map.key}=${v}&
          </c:forEach>
		</c:if>
		<c:if test="${(fn:length(map.value)) == 1}">
          ${map.key}=<c:forEach items="${map.value}" var="v">${v}&</c:forEach>
		</c:if>
	</c:forEach>
</c:set>



<!-- 搜索用户文章 -->
<div class="user-panel search-user-article container-fluid center-block">
	<!-- 悬浮菜单图标 拖拽部件 -->
	<span class="open-suspend-menu suspend-menu-icon drag-part visible-xs">用户文章搜索</span>
	<div class="row">
		<div class="col-xs-9 col-sm-4 col-md-3">
			<div class="suspend-menu">
				<div class="suspend-menu-btn-group clearfix">
					<span
						class="close-suspend-menu glyphicon glyphicon-remove pull-right visible-xs"></span>
				</div>
				<div class="suspend-menu-nav">
					<div class="suspend-menu-nav-title">
						<span>用户文章搜索</span>
					</div>
					<div class="suspend-menu-nav-list">
						<div class="menu-nav">
							<div class="menu-list">
								<div class="menu-title"></div>
								<c:if test="${empty otherUser && !empty user}">
									<div
										class="menu-item <c:if test="${articleStatu=='PUBLISH'}">menu-item-active</c:if>">
										<a
											href="<s:url value="/fore/user/${user.id}/search/article/articles" /><c:if test="${!empty impParam}">?${impParam}</c:if>"
											class="text-muted"><span class="">文章箱</span></a>
									</div>
									<div
										class="menu-item <c:if test="${articleStatu=='WAIT_PUBLISH'}">menu-item-active</c:if>">
										<a
											href="<s:url value="/fore/user/${user.id}/search/article/drafts" /><c:if test="${!empty impParam}">?${impParam}</c:if>"
											class="text-muted"><span class="">草稿箱</span></a>
									</div>
									<div
										class="menu-item <c:if test="${articleStatu=='DELETED'}">menu-item-active</c:if>">
										<a
											href="<s:url value="/fore/user/${user.id}/search/article/dustbin" /><c:if test="${!empty impParam}">?${impParam}</c:if>"
											class="text-muted"><span class="">垃圾箱</span></a>
									</div>
								</c:if>

								<c:if test="${!empty otherUser}">
									<div
										class="menu-item <c:if test="${articleStatu=='PUBLISH'}">menu-item-active</c:if>">
										<a
											href="<s:url value="/fore/user/${otherUser.id}/search/article/articles" /><c:if test='${!empty impParam}'>?${impParam}</c:if>"
											class="text-muted"><span class="">文章箱</span></a>
									</div>
								</c:if>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-8 col-md-9">
			<div class="content-body">
				<div class="container-group">
					<div class="group-title">
						<div class="" data-id="1">
							<div class="search-bar lead">
								<span class="glyphicon glyphicon-search"></span>

								<c:if test="${empty otherUser && !empty user}">

									<form id="search-user-article-form"
										class="navbar-form navbar-left"
										action="<s:url value="/fore/user/${user.id}/search/article/${as}" />"
										role="search-user-article">
										<div class="search-form">
											<input class="" type="text" name="title"
												placeholder="<c:if test="${!empty keyword}">${keyword}</c:if>
                        <c:if test="${keyword}">搜索 ${user.name}的${asStr}文章</c:if>">
											<button type="submit" class="btn btn-default btn-sm">搜索</button>
										</div>
									</form>


								</c:if>

								<c:if test="${!empty otherUser}">
									<form id="search-user-article-form"
										class="navbar-form navbar-left"
										action="<s:url value="/fore/user/${otherUser.id}/search/article/${as}" />"
										role="search-user-article">
										<div class="search-form">
											<input class="" type="text" name="title"
												placeholder="<c:if test="${!empty keyword}">${keyword}</c:if>
                        <c:if test="${empty keyword}">搜索 ${otherUser.name}的${asStr}文章</c:if>">
											<button type="submit" class="btn btn-default btn-sm">搜索</button>
										</div>
									</form>
								</c:if>

							</div>
						</div>
						<div class="btn-group btn-group-sm"></div>
						<!-- <div class="group-name">全部的用户关注</div> -->
					</div>


					<div class="group-content">
						<div class="group-body">
							<ul class="group-ul">
								<c:if test="${fn:length(pr.list)==0}">
									<div class="jumbotron" style="margin-left: -4rem;">
										<img src="<s:url value="/images/1.2.jpg" />"
											style="width: 100%;">
										<h3>
											<c:if test="${empty otherUser && !empty user}">你的</c:if>
											<c:if test="${!empty otherUser}">这个用户的</c:if>${asStr}没有关键词为
											${keyword} 的文章!不如。。。
										</h3>
										<button class="btn btn-primary write-article-btn center-block"
											articlestatu="article">自己编写文章</button>
									</div>
								</c:if>
								<c:if test="${fn:length(pr.list)!=0}">
									<c:if test="${empty otherUser && !empty user}">
										<c:forEach items="${pr.list}" var="article">
											<!-- 文章收藏 -->
											<li class="group-item"><span class="hidden" field="id"
												onlyread="true">${article.id}</span>
												<div class="group-item-header">
													<span class="cid" field="cid">${article.category.name}</span>
													<span class="createDate hidden-xs">${article.createDate}</span>
													<span class="updateDate">${article.updateDate}</span>
												</div>
												<div class="group-item-body">
													<a
														href="<s:url value="/foreshowArticle?aid=${article.id}" />"><span
														class="title" field="title">${article.title}</span></a> <span
														class="subTitle" field="subTitle">${article.subTitle}</span>
												</div>
												<div class="group-item-footer btn-sm">
													<div class="group-item-op btn-group-sm">
														<button data-href="foreeditArticle?aid=${article.id}"
															class="btn btn-default edit-article-link">编辑</button>
														<button data-id="${article.id}"
															class="btn btn-default list-group-btn <c:if test='${fn:contains(collectedIds,article.id)}'>btn-success</c:if>"
															grouptype="articlefavority">收藏</button>
													</div>
													<div class="group-item-info" data-toggle="tooltip"
														title="收藏量、点击量、浏览量">
														<span class="glyphicon glyphicon-star-empty"></span> <span
															class="badge">${article.collectNum}</span> <span
															class="iconfont icon-dianji"></span> <span class="badge">${article.clickNum}</span>
														<span class="glyphicon glyphicon-eye-open"></span> <span
															class="badge">${article.viewNum}</span>
													</div>
												</div></li>
										</c:forEach>
									</c:if>


									<c:if test="${!empty otherUser}">
										<c:forEach items="${pr.list}" var="oarticle">
											<c:if test="${fn:contains(collectedIds, oarticle.id)}">btn-success</c:if>
											<c:set value="${oarticle.user}" var="author"></c:set>
											<!-- 文章收藏 -->
											<li class="group-item"><span class="hidden" field="id"
												onlyread="true">${oarticle.id}</span>
												<div class="group-item-header">
													<span class="cid" field="cid">${oarticle.category.name}</span>
													<span class="createDate hidden-xs">${oarticle.createDate}</span>
													<span class="updateDate">${oarticle.updateDate}</span>
												</div>
												<div class="group-item-body">
													<a
														href="<s:url value="/foreshowArticle?aid=${oarticle.id}" />"><span
														class="title" field="title">${oarticle.title}</span></a> <span
														class="subTitle" field="subTitle">${oarticle.subTitle}</span>
													<a href="<s:url value="/fore/user/${author.id}" />"><span
														class="glyphicon glyphicon-user"></span>${author.name}</a>
												</div>
												<div class="group-item-footer btn-sm">
													<div class="group-item-op btn-group-sm">
														<button data-href="foreeditArticle?aid=${oarticle.id}"
															data-id="${oarticle.id}"
															class="btn btn-default list-group-btn <c:if test='${fn:contains(collectedIds, oarticle.id)}'>btn-success</c:if>"
															grouptype="articlefavority">收藏</button>
													</div>
													<div class="group-item-info" data-toggle="tooltip"
														title="收藏量、点击量、浏览量">
														<span class="glyphicon glyphicon-star-empty"></span> <span
															class="badge">${oarticle.collectNum}</span> <span
															class="iconfont icon-dianji"></span> <span class="badge">${oarticle.clickNum}</span>
														<span class="glyphicon glyphicon-eye-open"></span> <span
															class="badge">${oarticle.viewNum}</span>
													</div>
												</div></li>
										</c:forEach>

									</c:if>

								</c:if>
							</ul>
						</div>
						<div class="group-footer"></div>
					</div>
				</div>
			</div>


			<%@include file="../paging.jsp"%>

		</div>
	</div>
</div>
