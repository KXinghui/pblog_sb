<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="jumbotron clearfix">
	<div class="err container-fluid">
		<h2>错误</h2>

		<div class="row">
			<div class="col-xs-12 col-sm-6 col-sm-offset-1">
				<c:if test="${!empty custException}">
					<table class="table table-hover table-responsive">
						<tr>
							<th>用户ip</th>
							<td>${custException.ip}</td>
						</tr>
						<tr>
							<th>err</th>
							<td>${custException.errMsg}</td>
						</tr>
						<tr>
							<th>请求地址</th>
							<td>${custException.url}</td>
						</tr>
					</table>
				</c:if>
				<c:if test="${empty custException}">
					<h2>不知道啥原因！应该是服务器发生错误或资源找不到</h2>
				</c:if>

			</div>
		</div>
		<div class="row">
			<div
				class="col-xs-7 col-xs-offset-3 col-sm-4 col-sm-offset-8 col-md-3 col-md-offset-9">
				<button class="back-to-next-page btn btn-default">
					<span class="glyphicon glyphicon-arrow-left"></span> 回退
				</button>
				<a href="<s:url value="/" />" class="btn btn-primary"><span
					class="glyphicon glyphicon-home"></span> 主页</a>
			</div>
		</div>
	</div>
	${user.id}
</div>








