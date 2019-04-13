<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="user-list">
	<div class="user-list-container table-responsive">
		<table id="user-list-table"
			class="base-table table table-hover table-responsive">
			<tr>
				<th class="hidden" field="id">用户ID</th>
				<th field="name">用户名</th>
				<th field="password">密码</th>
				<th>用户信息管理</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${pr.list}" var="u">
				<tr>
					<td class="hidden">${u.id}</td>
					<td>${u.name}</td>
					<td></td>
					<td><a href="admin/user/userinfo/${u.id}"><span
							class="glyphicon glyphicon-user"></span></a></td>
					<td class="op"><span
						class="edit-user-link glyphicon glyphicon-edit"></span> <span
						class="del-user-link glyphicon glyphicon-trash"></span></td>
				</tr>
			</c:forEach>

		</table>
	</div>
</div>