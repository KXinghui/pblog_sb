<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="article-history user-panel container-fluid">
	<div class="row">
		<div
			class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-10 col-md-offset-1">
			<div class="article-history-header clearfix">
				<span class="lead pull-left"><span
					class="glyphicon glyphicon-time"></span> 文章历史</span> <span
					class="pull-right btn-group-sm"> <a
					href="<s:url value="/fore/user/${user.id}/userSettings" />"
					class="btn btn-default">设置是否记录文章历史</a>
					<button class="btn btn-default btn-danger clear-ah-btn">清空文章历史</button>
				</span>
			</div>
			<div
				class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1">
				<div class="article-history-body">

					<c:if test="${empty pr.list || fn:length(pr.list)==0}">
						<div class="jumbotron">
							<h2>
								目前还未有 <span class="glyphicon glyphicon-time"></span>文章历史，请去<a
									href="<s:url value="/forehome" />">首页</a>看看
							</h2>
						</div>
					</c:if>


					<c:if test="${!empty pr.list || fn:length(pr.list)!=0}">
						<c:forEach items="${pr.list}" var="articleHistory">
							<c:set value="${articleHistory.article}" var="article"></c:set>
							<c:set value="${article.user}" var="author"></c:set>
							<div class="article-history-item">
								<div class="article-history-date">${articleHistory.createDate}</div>
								<div class="article-history-item-body">
									<c:if test="${empty article}">
										<h3>失效文章(不存在或不是发布文章)</h3>
									</c:if>
									<c:if test="${!empty article}">
										<span class="hidden" field="id" onlyread="true">${articleHistory.id}</span>
										<div class="article-history-item-header">
											<span class="cid" field="cid">${article.category.name}</span>
											<span class="createDate hidden-xs">${article.createDate}</span>
											<span class="updateDate">${article.updateDate}</span>
										</div>
										<div class="article-history-item-body">
											<a href="<s:url value="/foreshowArticle?aid=${article.id}" />"><span
												class="title" field="title">${article.title}</span></a> <span
												class="subTitle" field="subTitle">${article.subTitle}</span>
											<a href="<s:url value="/fore/user/${author.id}" />"><span
												class="glyphicon glyphicon-user"></span>${author.name}</a>
										</div>
										<div class="article-history-item-footer btn-sm">
											<div class="article-history-item-info" data-toggle="tooltip"
												title="收藏量、点击量、浏览量">
												<span class="glyphicon glyphicon-star-empty"></span> <span
													class="badge">${article.collectNum}</span> <span
													class="glyphicon glyphicon-hand-up"></span> <span
													class="badge">${article.clickNum}</span> <span
													class="glyphicon glyphicon-eye-open"></span> <span
													class="badge">${article.viewNum}</span>
											</div>
										</div>
									</c:if>
								</div>
								<div class="article-history-item-op btn-group-sm">
									<button data-id="${articleHistory.id}"
										class="btn btn-default delete-ah-btn">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>

				<%@include file="../paging.jsp"%>
			</div>

		</div>
		<div class="article-history-footer"></div>

	</div>
</div>