<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!-- 文章-收藏 -->
<div class="user-follow container-fluid center-block">
	<!-- 悬浮菜单图标 拖拽部件 -->
	<span class="open-suspend-menu suspend-menu-icon drag-part visible-xs">文章收藏</span>
	<div class="row">
		<div class="col-xs-12 col-sm-4 col-md-3">
			<!-- 悬浮-菜单 -->
			<div class="suspend-menu">
				<!-- 悬浮-菜单-按钮组 -->
				<div class="suspend-menu-btn-group clearfix">
					<span
						class="close-suspend-menu glyphicon glyphicon-remove pull-right visible-xs"></span>
				</div>
				<!-- 悬浮菜单导航 -->
				<div class="suspend-menu-nav">
					<!-- 自身用户 -->
					<c:if test="${empty otherUser && !empty user}">
						<!-- 悬浮菜单导航标题 -->
						<div class="suspend-menu-nav-title">
							<span>文章收藏</span>
							<button class="btn btn-sm btn-default add-group-btn"
								grouptype="articlefavority">
								<span class="glyphicon glyphicon-plus"></span>新建
							</button>
						</div>
						<!-- 悬浮-菜单-导航-列表 -->
						<div class="suspend-menu-nav-list">
							<!-- 菜单导航 -->
							<div class="menu-nav">
								<!-- 菜单列表 -->
								<div class="menu-list">
									<!-- 菜单列表标题 -->
									<div class="menu-title">文章收藏分组</div>
									<!-- 菜单项 -->
									<c:forEach items="${groups}" var="g">
										<div
											class="menu-item <c:if test="${group.id==g.id}">menu-item-active</c:if> group-title"
											data-id="${g.id}">
											<div class="group-name">
												<a
													href='<s:url value="/fore/user/${user.id}/articleFavorities/${g.id}" />'
													class="text-info" field="name">${g.name}</a>·
												<c:if test="${g.visibility=='VISIBLE'}">
													<span field="visibility">显示</span>
												</c:if>
												<c:if test="${g.visibility=='HIDDEN'}">
													<span field="visibility">隐藏</span>
												</c:if>
												<span class="hidden" field="id">${g.id}</span> <span
													class="hidden" field="groupType">文章收藏</span>
											</div>
											<div class="btn-group btn-group-sm">
												<!-- edit-group-btn -->
												<button class="btn btn-default edit-group-btn"
													grouptype="articlefavority">编辑</button>
												<button class="btn btn-danger delete-group-btn"
													grouptype="articlefavority">删除</button>
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
						</div>
					</c:if>

					<!-- 其他用户 -->
					<c:if test="${!empty otherUser}">

						<!-- 悬浮菜单导航标题 -->
						<div class="suspend-menu-nav-title">
							<span>文章收藏</span>
						</div>
						<!-- 悬浮-菜单-导航-列表 -->
						<div class="suspend-menu-nav-list">
							<!-- 菜单导航 -->
							<div class="menu-nav">
								<!-- 菜单列表 -->
								<div class="menu-list">
									<!-- 菜单列表标题 -->
									<div class="menu-title">文章收藏分组</div>
									<!-- 菜单项 -->
									<c:forEach items="${groups}" var="g">
										<div class="menu-item group-title" data-id="${g.id}">
											<div class="group-name">
												<a
													href='<s:url value="/fore/user/${otherUser.id}/articleFavorities/${g.id}"></s:url>'
													class="text-info" field="name">${g.name}</a>·<span
													field="visibility">显示</span> <span class="hidden"
													field="id">${g.id}</span> <span class="hidden"
													field="groupType">文章收藏</span>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>


		<div class="col-xs-12 col-sm-8 col-md-9">
			<!-- 内容-主体 -->
			<div class="content-body">
				<!-- 容器-组 -->
				<div class="container-group">
					<!-- 文章收藏面板 -->

					<c:if test="${!empty group}">
						<!-- 指定组的文章收藏 -->
						<div class="group-title">
							<div class="group-name" data-id="${group.id}">
								<a href="" class="text-info lead" field="name">${group.name}</a>·<span
									class="lead" field="visibility"><c:if
										test="${group.visibility=='VISIBLE'}">显示</c:if> <c:if
										test="${group.visibility=='HIDDEN'}">隐藏</c:if></span> <span
									class="hidden" field="id">${group.id}</span> <span
									class="hidden" field="groupType">文章收藏</span>
							</div>
							<div class="btn-group btn-group-sm">
								<!-- 自身用户 -->
								<c:if test="${empty otherUser && !empty user}">
									<button class="btn btn-default clear-dgst-group-btn"
										data-id="${group.id}">清除组内失效</button>
								</c:if>
								<!-- 其他用户 -->
								<c:if test="${!empty otherUser}">
									<button class="btn btn-default">待定</button>
								</c:if>
							</div>
						</div>
						<div class="group-content">
							<div class="group-body">
								<ul class="group-ul">
									<c:if
										test="${empty groupPr.list || fn:length(groupPr.list)==0}">
										<div class="jumbotron" style="margin-left: -4rem;">
											<img src="<s:url value="/images/1.2.jpg" />"
												style="width: 100%;">
											<h3>
												<c:if test="${!empty otherUser}">这个用户</c:if>
												<c:if test="${empty otherUser && !empty user}">你</c:if>
												啥都没有收藏!只是创建了文章收藏分组，不如。。。
											</h3>
										</div>
									</c:if>
									<c:if
										test="${!empty groupPr.list || fn:length(groupPr.list)>0}">
										<!-- 自身用户 -->
										<c:if test="${empty otherUser && !empty user}">
											<c:forEach items="${groupPr.list}" var="gaf">
												<c:set value="${gaf.author}" var="author"></c:set>
												<c:set value="${gaf.article}" var="article"></c:set>
												<!-- 失效文章 -->
												<c:if test="${empty article}">
													<li class="group-item" invalid="${gaf.id}"><span
														class="hidden" field="id" onlyread="true">${article.id}</span>
														<div class="group-item-body">对不起！该收藏文章失效</div>
														<div class="group-item-footer">
															<div class="group-item-op btn-group-sm">
																<button data-id="${gaf.id}"
																	class="btn btn-default clear-af-btn">清除</button>
															</div>
														</div></li>
												</c:if>

												<!-- 生效文章【收藏】 -->
												<c:if test="${!empty article}">
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
															<a href="<s:url value="/fore/user/${author.id}" />"><span
																class="glyphicon glyphicon-user"></span>${author.name}</a>
														</div>
														<div class="group-item-footer">
															<div class="group-item-op btn-group-sm">
																<button data-id="${article.id}"
																	class="btn btn-default list-group-btn btn-success"
																	grouptype="articlefavority">收藏</button>
															</div>
															<div class="group-item-info" data-toggle="tooltip"
																title="收藏量、点击量、浏览量">
																<span class="glyphicon glyphicon-star-empty"></span> <span
																	class="badge">${article.collectNum}</span> <span
																	class="iconfont icon-dianji"></span> <span
																	class="badge">${article.clickNum}</span> <span
																	class="glyphicon glyphicon-eye-open"></span> <span
																	class="badge">${article.viewNum}</span>
															</div>
														</div></li>
												</c:if>
											</c:forEach>
										</c:if>
										<!-- 其他用户 -->
										<c:if test="${!empty otherUser}">
											<c:forEach items="${groupPr.list}" var="gaf">
												<c:set value="${gaf.author}" var="author"></c:set>
												<c:set value="${gaf.article}" var="article"></c:set>
												<!-- 失效文章 -->
												<c:if test="${empty article}">
													<li class="group-item"><span class="hidden" field="id"
														onlyread="true">${article.id}</span>
														<div class="group-item-body">对不起！该收藏文章失效</div>
														<div class="group-item-footer">
															<div class="group-item-op btn-group-sm"></div>
														</div></li>
												</c:if>
												<!-- 生效文章【收藏】 -->
												<c:if test="${!empty article}">
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
															<a href="<s:url value="/fore/user/${author.id}" />"><span
																class="glyphicon glyphicon-user"></span>${author.name}</a>
														</div>
														<div class="group-item-footer">
															<div class="group-item-op btn-group-sm">
																<button data-id="${article.id}"
																	class="btn btn-default list-group-btn <c:if test="${fn:contains(collectedIds,article.id)}">btn-success</c:if>"
																	grouptype="articlefavority">收藏</button>
															</div>
															<div class="group-item-info" data-toggle="tooltip"
																title="收藏量、点击量、浏览量">
																<span class="glyphicon glyphicon-star-empty"></span> <span
																	class="badge">${article.collectNum}</span> <span
																	class="iconfont icon-dianji"></span> <span
																	class="badge">${article.clickNum}</span> <span
																	class="glyphicon glyphicon-eye-open"></span> <span
																	class="badge">${article.viewNum}</span>
															</div>
														</div></li>
												</c:if>
											</c:forEach>
										</c:if>
									</c:if>
								</ul>
							</div>
						</div>
					</c:if>
				</div>
			</div>





			<!-- 对应组的文章收藏 -->
			<c:if test="${!empty groupPr}">
				<c:set value="${groupPr}" var="pr"></c:set>
			</c:if>



			<%@include file="../paging.jsp"%>
		</div>
	</div>
</div>
