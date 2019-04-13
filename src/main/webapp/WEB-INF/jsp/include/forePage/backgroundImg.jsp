<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:set value="${user.userInfo.backgroundImg}" var="backgroundImg"></c:set>

<c:set value="${otherUser.userInfo.backgroundImg}"
	var="otherbackgroundImg"></c:set>


<c:if test="${empty otherUser}">
	<!-- 背景 -->
	<div id="background">
		<!-- 背景-图片 -->
		<div id="background-image">
			<img
				src="<c:if test = "${empty backgroundImg}"><s:url value="/images/2.jpg" /></c:if>
          <c:if test = "${!empty backgroundImg}"><s:url value="/${backgroundImg}" /></c:if>"
				class="img-responsive img-rounded">
		</div>
		<!-- 背景-容器 -->
		<div id="background-container">
			<button class="btn btn-success">${user.name}博客</button>
			<div class="dictum">${user.userInfo.dictum}</div>
		</div>
	</div>
</c:if>

<c:if test="${!empty otherUser}">
	<div id="background">
		<!-- 背景-图片 -->
		<div id="background-image">
			<img
				src="<c:if test = "${empty otherbackgroundImg}"><s:url value="/images/2.jpg" /></c:if>
          <c:if test = "${!empty otherbackgroundImg}"><s:url value="/${otherbackgroundImg}" /></c:if>"
				class="img-responsive img-rounded">
		</div>
		<!-- 背景-容器 -->
		<div id="background-container">
			<button class="btn btn-success">${otherUser.name}博客</button>
			<div class="dictum">${otherUser.userInfo.dictum}</div>
		</div>
	</div>
</c:if>