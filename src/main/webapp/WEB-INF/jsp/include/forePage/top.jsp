<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:set value="${user.userInfo.headImg}" var="headImg"></c:set>
<c:set value="${user.userInfo}" var="ui"></c:set>
<c:set value="${user.userNum}" var="un"></c:set>

<!-- 顶部导航 -->
<nav id="top-nav"
	class="navbar navbar-default navbar-fixed-top container-fluid"
	role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-topnav-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="<s:url value="/forehome" />"><span
			class="glyphicon glyphicon-home"></span></a>
	</div>



	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse navbar-topnav-collapse">
		<form class="navbar-form navbar-left hidden" role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="搜索文章">
			</div>
			<button type="submit" class="btn btn-default">搜索</button>
		</form>

		<ul class="nav navbar-nav row">
			<!-- 用户-头像-操作 -->

			<li class="user-headimg-op dropdown hidden-xs"><a
				href='<c:if test="${empty user}">#</c:if>
        <c:if test="${!empty user}"><s:url value="/fore/user/${user.id}" /></c:if>'
				class="dropdown-toggle head-img-wrapper" data-toggle="dropdown"><img
					id="user-headimg"
					src="<c:if test="${empty ui.headImg}">
                      <s:url value="/images/1.4.1.jpg" />
                    </c:if>
                    <c:if test="${!empty ui.headImg}">
                      <s:url value="/${ui.headImg}" />
                    </c:if>"
					class="img-responsive img-circle" alt="头像"></a> <!-- 用户-操作面板 -->
				<c:if test="${!empty user}">
					<div class="user-oppanel">
						<c:if test="${!empty ui}">
							<div class="user-info">
								<span>${user.name}</span>
								<table class="table table-condensed table-hover">
									<tbody>
										<tr>
											<th>uid</th>
											<td>${ui.id}</td>
										</tr>
										<tr>
											<th><span class="glyphicon glyphicon-user"></span>真实姓名</th>
											<td>${ui.realName}</td>
										</tr>
										<tr>
											<th><span class="iconfont icon-xingbienan"></span>性别</th>
											<td><c:if test="${ui.gender=='MALE'}">男</c:if> <c:if
													test="${ui.gender=='FEMALE'}">女</c:if></td>
										</tr>
										<tr>
											<th><span class="glyphicon glyphicon-phone"></span>手机</th>
											<td>${ui.mobile}</td>
										</tr>
										<tr>
											<th><span class="iconfont icon-youxiang"></span>邮箱</th>
											<td>${ui.email}</td>
										</tr>
										<tr>
											<th><span class="glyphicon glyphicon-map-marker"></span>地址</th>
											<td>${ui.address}</td>
										</tr>
										<tr>
											<th><span class="iconfont icon-shengri"></span>生日</th>
											<td>${ui.birthday}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</c:if>

						<c:if test="${empty ui}">
							<div class="user-info jumbotron">
								<h5>目前还未填写用户信息</h5>
								<a href="<s:url value="/editUserInfoPage" />"
									class="btn btn-primary">去填写</a>
							</div>
						</c:if>

						<div class="article-info">
							<!-- 总文章数、总点击数、总浏览数 -->
							<div data-toggle="tooltip" title="总文章数">
								<span class="glyphicon glyphicon-list-alt"></span> <span
									class="badge">${un.articleNum}</span>
							</div>
							<div data-toggle="tooltip" title="总点击数">
								<span class="glyphicon glyphicon-hand-up"></span> <span
									class="badge">${un.clickNum}</span>
							</div>
							<div data-toggle="tooltip" title="总浏览数">
								<span class="glyphicon glyphicon-eye-open"></span> <span
									class="badge">${un.viewNum}</span>
							</div>
						</div>

						<div class="user-op-list">
							<span><a href="<s:url value="/fore/user/${user.id}" />"><span
									class="glyphicon glyphicon-home"></span> 个人博客</a></span> <span><a
								href="<s:url value="/fore/user/${user.id}/articles" />"><span
									class="iconfont icon-svgwrite"></span> 文章</a></span> <span><a
								href="<s:url value="/fore/user/${user.id}/articleFavorities" />"><span
									class="iconfont icon-shoucangjia1"></span> 文章收藏</a></span> <span><a
								href="<s:url value="/fore/user/${user.id}/articleHistories" />"><span
									class="glyphicon glyphicon-time"></span> 文章历史</a></span> <span><a
								href="<s:url value="/fore/user/${user.id}/userSettings" />"><span
									class="glyphicon glyphicon-cog"></span> 设置</a></span> <span><a
								href="<s:url value="/foreuserInfo" />"><span
									class="iconfont icon-geren12"></span> 用户信息</a></span>
						</div>
						<div class="oppanel-footer">
							<a href="<s:url value="/forelogout" />"
								class="col-sm-4 col-sm-offset-8"><span
								class="glyphicon glyphicon-log-out"></span> 退出</a>
						</div>
					</div>
				</c:if> <c:if test="${empty user}">
					<div class="user-oppanel">
						<div class="panel panel-default">
							<div class="jumbotron">
								<span class="text-info text" style="font-size: 23px;">
									欢迎登陆！！！ </span>
							</div>
							<a href="<s:url value="/loginPage" />" target="_blank">
								<button class="btn btn-info btn-block">登陆</button>
							</a>
						</div>

					</div>
				</c:if></li>
			<li><a data-toggle="modal" href="#about-author">关于作者</a></li>
		</ul>

		<ul class="nav navbar-nav navbar-right">

			<c:if test="${!empty user}">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">操作 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="<s:url value="/fore/user/${user.id}" />"><span
								class="glyphicon glyphicon-home"></span> 个人博客</a></li>
						<li><a
							href="<s:url value="/fore/user/${user.id}/articles" />"><span
								class="iconfont icon-svgwrite"></span> 文章</a></li>
						<li><a
							href="<s:url value="/fore/user/${user.id}/articleFavorities" />"><span
								class="iconfont icon-shoucangjia1"></span> 文章收藏</a></li>
						<li><a
							href="<s:url value="/fore/user/${user.id}/articleHistories" />"><span
								class="glyphicon glyphicon-time"></span> 文章历史</a></li>
						<li><a
							href="<s:url value="/fore/user/${user.id}/userSettings" />"><span
								class="glyphicon glyphicon-cog"></span> 设置</a></li>
						<li><a href="<s:url value="/foreuserInfo" />"><span
								class="iconfont icon-geren12"></span> 用户信息</a></li>
					</ul></li>
			</c:if>
		</ul>
	</div>
</nav>