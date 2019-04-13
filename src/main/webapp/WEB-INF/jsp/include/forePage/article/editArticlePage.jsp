<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:set value="${article.articleContent}" var="articleContent"></c:set>

<div class="alert alert-danger"
	style="visibility: <c:if test="${empty msg}">hidden</c:if><c:if test="${!empty msg}">visible</c:if>;">
	<a href="#" class="close" data-dismiss="alert">&times;</a> <strong><span
		class='glyphicon glyphicon-exclamation-sign'></span> </strong>${msg}
</div>

<div id="edit-article" class="edit-article container-fluid">
	<div class="row">
		<div
			class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1">
			<div class="edit-article-container">
				<table id="article-table"
					class="base-table table table-responsive table-hover table-bordered">
					<tr>
						<th class="hidden" field="id">文章ID</th>
						<th field="title">文章标题</th>
						<th field="subTitle">文章副标题</th>
						<th field="cid">分类</th>
						<th class="hidden-xs" text="createTime">创建时间</th>
						<th class="hidden-xs" text="updateTime">更新时间</th>
						<th text="articleStatu">文章状态</th>
						<th class="hidden-xs" text="clickNum">点击量</th>
						<th class="hidden-xs" text="viewkNum">浏览量</th>
						<th>操作</th>
					</tr>
					<tr>
						<td class="hidden">${article.id}</td>
						<td>${article.title}</td>
						<td>${article.subTitle}</td>
						<td>${article.category.name}</td>
						<td class="hidden-xs">${article.createDate}</td>
						<td class="hidden-xs">${article.updateDate}</td>
						<td><c:if test="${article.articleStatu=='WAIT_PUBLISH'}">草稿箱(未发布)</c:if>
							<c:if test="${article.articleStatu=='PUBLISH'}">文章箱(已发布)</c:if></td>
						<td class="hidden-xs">${article.clickNum}</td>
						<td class="hidden-xs">${article.viewNum}</td>
						<td class="op"><button
								class="btn btn-default btn-xs edit-article-link"
								data-toggle="tooltip" title="仅编辑文章">
								<span class="glyphicon glyphicon-edit"></span>
							</button></td>
					</tr>
				</table>
			</div>
		</div>
		<div
			class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1">
			<div id="layout">


				<form id="edit-articlecontent-form"
					action='<s:url value="/foreeditArticleContent" />' method="POST">
					<div class="form-group hidden">
						<label for="">文章内容ID</label> <input type="text"
							class="form-control" name="id" value="${articleContent.id}">
					</div>
					<div class="form-group hidden">
						<label for="">文章ID</label> <input type="text" class="form-control"
							name="aid" value="${article.id}">
					</div>

					<div id="show-articlmarkdown">
						<textarea style="display: none;" name="mdContent"
							placeholder="欢迎使用个人博客，请畅所欲书！！！"><c:if
								test="${empty articleContent.mdContent || fn:length(articleContent.mdContent)==0}">欢迎使用个人博客，请畅所欲书！！！</c:if><c:if
								test="${fn:length(articleContent.mdContent)>0}">${articleContent.mdContent}</c:if>
							</textarea>
					</div>
					<div class="edit-article-form-op" style="margin: 8rem 0;">
						<button type="submit" class="btn btn-primary center-block">保存文章</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<!-- 侧边菜单 -->
<div class="side-menu col-xs-11 col-sm-4 col-md-3">
	<div class="side-menu-op">
		<span class="glyphicon glyphicon-remove close-side-menu"></span>

	</div>
	<div class="side-menu-container">

		<div class="edit-article-op clearfix">
			<span class="pull-left">对不起，(功能实现，但数值改变有误)</span> <span
				class="countdown-time text-warning lead pull-right">10</span>
			<div class="cust-checkbox cust-checkbox-column">
				<label class="cust-checkbox-label"> <input type="checkbox"
					name="isAutoSave"> <span class="text-muted">自动保存</span>
				</label>
			</div>
		</div>

	</div>
</div>


