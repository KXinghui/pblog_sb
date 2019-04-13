<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<div class="wall-paper container-fluid">
	<img id="wall-paper-img" src="images/wallpaper/1-1.jpg">
	<div class="wall-paper-inner row">
		<div class="date-time col-xs-10 col-xs-offset-1 col-md-3 col-sm-3">
			<div class="time"></div>
			<span class="year-month-day"></span> <span class="week"></span>
		</div>
	</div>

	<jsp:useBean id="user" class="site.xinghui.pblog_sb.pojo.User"
		scope="request" />

	<div class="wallpaper-form-div login">
		<!-- 表单-操作-成功信息 -->
		<div class="form-op-successmsg bg-success"
			<c:if test="${!empty successMsg}">style="display: flex;"</c:if>>
			<span class="errmsg text-success">${successMsg}</span> <span
				class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
		</div>
		<figure class="center-block">
			<img id="user-headimg" src="images/1.4.1.jpg"
				class="img-responsive img-circle center-block" alt="头像">
		</figure>
		<!-- 表单-操作-错误信息 -->
		<div class="form-op-errmsg"
			<c:if test="${!empty msg}">style="visibility: visible;"</c:if>>
			<span class="errmsg">${msg}</span> <span
				class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
		</div>

		<sf:form modelAttribute="user" action="forelogin" method="POST"
			id="login-form" cssClass="form-group" role="login-form">

			<div class="form-input">
				<label for="name"><span class="glyphicon glyphicon-user"></span></label>
				<sf:input path="name" id="name" cssClass="form-control"
					placeholder="请输入用户名" />
			</div>
			<!-- 表单验证错误信息 -->
			<div class="form-valid-errmsg">
				<sf:errors path="name" cssClass="errmsg" />
				<span
					class="close-msg-btn close-validmsg-btn glyphicon glyphicon-remove"></span>
			</div>
			<div class="form-input">
				<label for="password"><span class="glyphicon glyphicon-lock"></span></label>
				<sf:input path="password" id="password" cssClass="form-control"
					placeholder="请输入密码" />
			</div>
			<!-- 表单验证错误信息 -->
			<div class="form-valid-errmsg">
				<sf:errors path="password" cssClass="errmsg" />
				<span
					class="close-msg-btn close-validmsg-btn glyphicon glyphicon-remove"></span>
			</div>
			<button type="submit" class="btn btn-block btn-danger">登陆</button>

		</sf:form>
		<!-- 表单外 -->
		<div class="form-outside">
			<a href=""></a> <a href="registerPage" target="_blank">注册</a>
		</div>
	</div>
</div>