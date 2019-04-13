<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!-- 用户-关注 -->
<div class="user-follow container-fluid center-block">
	<!-- 悬浮菜单图标 拖拽部件 -->
	<span class="open-suspend-menu suspend-menu-icon drag-part visible-xs">用户文章</span>
	<div class="row">

		<div class="col-xs-9 col-sm-4 col-md-3">
			<!-- 悬浮-菜单 -->
			<div class="suspend-menu">
				<!-- 悬浮-菜单-按钮组 -->
				<div class="suspend-menu-btn-group clearfix">
					<span
						class="close-suspend-menu glyphicon glyphicon-remove pull-right visible-xs"></span>
				</div>
				<!-- 悬浮菜单导航 -->
				<div class="suspend-menu-nav">
					<!-- 悬浮菜单导航标题 -->
					<div class="suspend-menu-nav-title">
						<span>用户文章</span>
						<c:if test="${empty otherUser && !empty user}">
							<button class="btn btn-sm btn-default write-article-btn"
								articlestatu="article">
								<span class="iconfont icon-tianchongxing-"></span>写文章
							</button>
						</c:if>
					</div>
					<!-- 悬浮-菜单-导航-列表 -->
					<div class="suspend-menu-nav-list">
						<!-- 菜单导航 -->
						<div class="menu-nav">
							<!-- 菜单列表 -->
							<div class="menu-list">
								<!-- 自身用户 -->
								<c:if test="${empty otherUser && !empty user}">
									<!-- 菜单列表标题 -->
									<div class="menu-title">自身用户文章</div>
									<!-- 菜单项 -->
									<div
										class="menu-item <c:if test="${title=='文章箱'}">menu-item-active</c:if>">
										<a href="<s:url value="/fore/user/${user.id}/articles" />"
											class=""><span class="">文章箱</span></a>
									</div>
									<div
										class="menu-item <c:if test="${title=='草稿箱'}">menu-item-active</c:if>">
										<a
											href="<s:url value="/fore/user/${user.id}/articles/drafts" />"
											class=""><span class="">草稿箱</span></a>
									</div>
									<div
										class="menu-item <c:if test="${title=='垃圾箱'}">menu-item-active</c:if>">
										<a
											href="<s:url value="/fore/user/${user.id}/articles/dustbin" />"
											class=""><span class="">垃圾箱</span></a>
									</div>
								</c:if>

								<!-- 其他用户 -->
								<c:if test="${!empty otherUser}">
									<!-- 菜单列表标题 -->
									<div class="menu-title">其他用户文章</div>
									<!-- 菜单项 -->
									<div
										class="<c:if test="${!title=='文章箱'}">menu-item</c:if>
                <c:if test="${title=='文章箱'}">menu-item-active</c:if>">
										<a
											href="<s:url value="/fore/user/${otherUser.id}/articles" />"
											class=""><span class="">文章箱</span></a>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div class="col-xs-12 col-sm-8 col-md-9">
			<!-- 内容-主体 -->
			<div class="content-body">
				<!-- 容器-组 -->
				<div class="container-group">
					<!-- 用户关注面板 -->
					<!-- 自身用户文章 -->
					<c:if test="${empty otherUser && !empty user}">

						<c:if test="${!empty pr}">
							<div class="group-title">
								<div class="group-name lead">${title}</div>
							</div>

							<div class="group-content">
								<div class="group-body">
									<ul class="group-ul">
										<c:if test="${empty pr.list || fn:length(pr.list)==0}">
											<div class="jumbotron" style="margin-left: -4rem;">
												<img src="<s:url value="/images/1.2.jpg" />"
													style="width: 100%;">
												<h3>你的 ${title} 啥都没有!不如。。。</h3>
												<button
													class="btn btn-primary write-article-btn center-block"
													articlestatu="article">编写文章</button>
											</div>
										</c:if>

										<c:if test="${!empty pr.list}">
											<c:forEach items="${pr.list}" var="article">

												<li class="group-item"><span class="hidden" field="id"
													onlyread="true">${article.id}</span>
													<div class="group-item-header">
														<span class="cid" field="cid">${article.category.name}</span>
														<span class="createDate">${article.createDate}</span> <span
															class="updateDate">${article.updateDate}</span>
													</div>
													<div class="group-item-body">
														<a
															href="<s:url value="/foreshowArticle?aid=${article.id}" />"><span
															class="title" field="title">${article.title}</span></a> <span
															class="subTitle" field="subTitle">${article.subTitle}</span>
													</div>
													<div class="group-item-footer">
														<div class="group-item-op btn-group-sm">
															<button data-href="foreeditArticle?aid=${article.id}"
																class="btn btn-default edit-article-link">编辑</button>
															<c:if test="${title=='文章箱'}">
																<button
																	class="btn btn-default list-group-btn <c:if test="${fn:contains(collectedIds,article.id)}">btn-success</c:if>"
																	data-id="${article.id}" grouptype="articlefavority">收藏</button>
															</c:if>
															<div class="dropdown">
																<button
																	class="btn btn-default btn-warning btn-sm dropdown-toggle"
																	type="button" id="change-${article.id}-statu"
																	data-toggle="dropdown">
																	转到 <span class="caret"></span>
																</button>
																<ul class="dropdown-menu" role="menu"
																	aria-labelledby="change-${article.id}-statu">
																	<c:if test="${title=='文章箱'}">
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1"
																			data-href="forechangeToDrafts?aid=${article.id}"
																			class="change-articlestatu-link" articlestatu="draft">转到草稿箱</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1"
																			data-href="forechangeToDustbin?aid=${article.id}"
																			class="change-articlestatu-link" articlestatu="trash">转到垃圾箱</a></li>
																	</c:if>
																	<c:if test="${title=='草稿箱'}">
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1"
																			data-href="forechangeToArticle?aid=${article.id}"
																			class="change-articlestatu-link"
																			articlestatu="article">转到文章箱</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1"
																			data-href="forechangeToDustbin?aid=${article.id}"
																			class="change-articlestatu-link" articlestatu="trash">转到垃圾箱</a></li>
																	</c:if>
																	<c:if test="${title=='垃圾箱'}">
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1"
																			data-href="forechangeToArticle?aid=${article.id}"
																			class="change-articlestatu-link"
																			articlestatu="article">转到文章箱</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1"
																			data-href="forechangeToDrafts?aid=${article.id}"
																			class="change-articlestatu-link" articlestatu="draft">转到草稿箱</a></li>
																	</c:if>
																</ul>

															</div>

														</div>
														<div class="group-item-info" data-toggle="tooltip"
															title="收藏量、点击量、浏览量">
															<span class="glyphicon glyphicon-star-empty"></span> <span
																class="badge">${article.collectNum}</span> <span
																class="glyphicon glyphicon-hand-up"></span> <span
																class="badge">${article.clickNum}</span> <span
																class="glyphicon glyphicon-eye-open"></span> <span
																class="badge">${article.viewNum}</span>
														</div>

													</div></li>

											</c:forEach>
										</c:if>
									</ul>
								</div>
							</div>
						</c:if>

					</c:if>

					<!-- 其他用户文章【只有文章箱】 -->
					<c:if test="${!empty otherUser}">
						<c:if test="${!empty pr}">
							<div class="group-title">
								<div class="group-name">${title}</div>
							</div>
							<div class="group-content">
								<div class="group-body">
									<ul class="group-ul">

										<c:if test="${empty pr.list || fn:length(pr.list)==0}">
											<div class="jumbotron" style="margin-left: -4rem;">
												<img src="<s:url value="/images/1.2.jpg" />"
													style="width: 100%;">
												<h3>这个用户的文章箱啥都没有!不如。。。</h3>
											</div>
										</c:if>

										<c:if test="${!empty pr.list}">
											<c:forEach items="${pr.list}" var="article">

												<li class="group-item"><span class="hidden" field="id"
													onlyread="true">102</span>
													<div class="group-item-header">
														<span class="cid" field="cid">${article.category.name}</span>
														<span class="createDate">${article.createDate}</span> <span
															class="updateDate">${article.updateDate}</span>
													</div>
													<div class="group-item-body">
														<a
															href="<s:url value="/foreshowArticle?aid=${article.id}" />"><span
															class="title" field="title">${article.title}</span></a> <span
															class="subTitle" field="subTitle">${article.subTitle}</span>
													</div>
													<div class="group-item-footer">
														<div class="group-item-op btn-group-sm">
															<c:if test="${title=='文章箱'}">
																<button
																	class="btn btn-default list-group-btn <c:if test="${fn:contains(collectedIds,article.id)}">btn-success</c:if>"
																	data-id="${article.id}" grouptype="articlefavority">收藏</button>
															</c:if>

														</div>
														<div class="group-item-info" data-toggle="tooltip"
															title="收藏量、点击量、浏览量">
															<span class="glyphicon glyphicon-star-empty"></span> <span
																class="badge">${article.collectNum}</span> <span
																class="glyphicon glyphicon-hand-up"></span> <span
																class="badge">${article.clickNum}</span> <span
																class="glyphicon glyphicon-eye-open"></span> <span
																class="badge">${article.viewNum}</span>
														</div>
													</div></li>
											</c:forEach>
										</c:if>
									</ul>
								</div>
							</div>
						</c:if>
					</c:if>
				</div>
			</div>

			<%@include file="../paging.jsp"%>

		</div>
	</div>
</div>