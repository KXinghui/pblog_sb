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

	<div class="wallpaper-form-div register">
		<!-- 表单-操作-错误信息 -->
		<div class="form-op-errmsg"
			<c:if test="${!empty msg}">style="visibility: visible;"</c:if>>
			<span class="errmsg">${msg}</span> <span
				class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
		</div>
		<sf:form modelAttribute="user" action="foreregister" method="POST"
			id="register-form" cssClass="form-group" role="register-form">
			<div class="form-group">
				<label for="name">用户名</label>
				<sf:input path="name" id="name" name="name" cssClass="form-control"
					placeholder="请输入用户名" />
			</div>
			<!-- 表单验证错误信息 -->
			<div class="form-valid-errmsg">
				<sf:errors path="name" cssClass="errmsg" />
				<span
					class="close-msg-btn close-validmsg-btn glyphicon glyphicon-remove"></span>
			</div>
			<div class="form-group">
				<label for="password">密码</label>
				<sf:password path="password" id="password" name="password"
					cssClass="form-control" placeholder="请输入密码" />
			</div>
			<!-- 表单验证错误信息 -->
			<div class="form-valid-errmsg">
				<sf:errors path="password" cssClass="errmsg" />
				<span
					class="close-msg-btn close-validmsg-btn glyphicon glyphicon-remove"></span>
			</div>
			<div class="form-group">
				<label for="repassword">确认密码</label>
				<sf:password path="repassword" id="repassword" name="rePassword"
					cssClass="form-control" placeholder="请输入确认密码" />
			</div>
			<!-- 表单验证错误信息 -->
			<div class="form-valid-errmsg">
				<sf:errors path="repassword" cssClass="errmsg" />
				<span
					class="close-msg-btn close-validmsg-btn glyphicon glyphicon-remove"></span>
			</div>
			<button type="reset" class="btn btn-block btn-primary">重置</button>
			<button type="submit" class="btn btn-block btn-danger">注册</button>
		</sf:form>
		<!-- 表单外 -->
		<div class="form-outside">
			<a href=""></a> <a href="loginPage" target="_blank">登陆</a>
		</div>
	</div>





</div>