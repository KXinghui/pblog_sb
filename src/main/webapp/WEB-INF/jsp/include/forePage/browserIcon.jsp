<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:set value="${user.userInfo.browserIcon}" var="browserIcon"></c:set>
<c:set value="${otherUser.userInfo.browserIcon}" var="otherbrowserIcon"></c:set>



<c:if test="${empty otherUser}">
	<c:if test="${empty browserIcon}">
		<link rel="icon" href="<s:url value="/images/favicon.ico" />"
			type="image/x-icon" />
		<link rel="shortcut icon" href="<s:url value="/images/favicon.ico" />"
			type="image/x-icon" />
	</c:if>
	<c:if test="${!empty browserIcon}">
		<link rel="icon" href="<s:url value="${browserIcon}" />"
			type="image/x-icon" />
		<link rel="shortcut icon" href="<s:url value="${browserIcon}" />"
			type="image/x-icon" />
	</c:if>
</c:if>



<c:if test="${!empty otherUser}">
	<c:if test="${empty otherbrowserIcon}">
		<link rel="icon" href="<s:url value="/images/favicon.ico" />"
			type="image/x-icon" />
		<link rel="shortcut icon" href="<s:url value="/images/favicon.ico" />"
			type="image/x-icon" />
	</c:if>
	<c:if test="${!empty otherbrowserIcon}">
		<link rel="icon" href="<s:url value="${otherbrowserIcon}" />"
			type="image/x-icon" />
		<link rel="shortcut icon" href="<s:url value="${otherbrowserIcon}" />"
			type="image/x-icon" />
	</c:if>
</c:if>