<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>

<c:set value="${sessionScope.user.userInfo}" var="userInfo"
	scope="session"></c:set>

<c:if test="${empty userInfo}">
	<div class="jumbotron">
		<div class="container">
			<div class="row">
				<div
					class="col-xs-12 col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-2">
					<h2>欢迎用户信息页面</h2>
					<p>目前还未填写用户信息</p>
					<p>
						<a href="editUserInfoPage" class="btn btn-primary btn-lg"> 去填写</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</c:if>


<c:if test="${!empty userInfo}">
	<div class="well clearfix">
		<!-- 用户信息-表格 -->
		<table id="userinfo-table"
			class="base-table table table-responsive table-hover">
			<caption>${user.name}</caption>

			<tr>
				<th>真实姓名</th>
				<td>${userInfo.realName}</td>
			</tr>
			<tr>
				<th>性别</th>
				<td><c:if test="${userInfo.gender=='MALE'}">男</c:if> <c:if
						test="${userInfo.gender=='FEMALE'}">女</c:if></td>
			</tr>
			<tr>
				<th>手机号码</th>
				<td>${userInfo.mobile}</td>
			</tr>
			<tr>
				<th>邮箱</th>
				<td>${userInfo.email}</td>
			</tr>
			<tr>
				<th>生日</th>
				<td>${userInfo.birthday}</td>
			</tr>
			<tr>
				<th>地址</th>
				<td>${userInfo.address}</td>
			</tr>
			<tr>
				<th>名言</th>
				<td>${userInfo.dictum}</td>
			</tr>
		</table>
		<div class="pull-right">
			<a href="editUserInfoPage" class="btn btn-primary">编辑</a> <a
				class="btn btn-primary" data-toggle="modal" href="#previewimg-modal">预览自定义图片</a>
		</div>
	</div>
</c:if>


<!-- 登陆历史 -->
<div id="loginhistory-well" class="well">
	<!-- 登陆历史-表格 -->
	<table id="loginhistory-table"
		class="base-table table table-responsive table-hover">
		<caption>登陆历史</caption>
		<span class="text-warning">以下为您最近 ${fn:length(lhs)}
			次登录记录，若存在异常情况，请在核实后尽快 <a href="editUserInfoPage?act=editUser">修改密码</a>
		</span>
		<a href="<s:url value="/fore/user/${user.id}/userSettings" />"
			class="btn btn-default">设置是否记录登陆历史</a>
		<button
			class="btn btn-default btn-danger clear-loginhistory-btn pull-right">清空登陆历史</button>

		<tr>
			<th>IP</th>
			<th>登陆成功/失败</th>
			<th>登陆时间</th>
		</tr>

		<c:forEach items="${lhs}" var="lh">
			<tr <c:if test="${lh.isLogin == 0}">class="danger"</c:if>>
				<td>${lh.ip}</td>
				<td><c:if test="${lh.isLogin == 1}">登陆成功</c:if> <c:if
						test="${lh.isLogin == 0}">登陆失败</c:if></td>
				<td>${lh.loginTime}</td>
			</tr>
		</c:forEach>
	</table>

	<!-- 登陆失败历史-表格 -->
	<table id="fail-loginhistory-table"
		class="base-table table table-responsive table-hover">
		<caption>登陆失败历史</caption>
		<span class="text-warning">以下为您 ${fn:length(faillhs)}
			次登陆失败记录，请在核实后尽快 <a href="editUserInfoPage?act=editUser">修改密码</a>
		</span>
		<tr>
			<th>IP</th>
			<th>登陆时间</th>
		</tr>
		<c:forEach items="${faillhs}" var="faillh">
			<tr class="danger">
				<td>${faillh.ip}</td>
				<td>${faillh.loginTime}</td>
			</tr>
		</c:forEach>
	</table>


</div>