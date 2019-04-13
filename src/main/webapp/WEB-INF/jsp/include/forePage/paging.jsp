<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="impParam">
	<c:forEach items="${page.paramMap}" var="map">
		<c:if test="${(fn:length(map.value)) != 1}">
			<c:forEach items="${map.value}" var="v">${map.key}=${v}&</c:forEach>
		</c:if>
		<c:if test="${(fn:length(map.value)) == 1}">${map.key}=<c:forEach
				items="${map.value}" var="v">${v}&</c:forEach>
		</c:if>
	</c:forEach>
</c:set>
<c:set value="${pr.page}" var="page"></c:set>



<div class="paging center-block">
	<div class="row">
		<div class="col-xs-12 col-sm-9 col-md-8">
			<!-- 分页信息 -->
			<div class="page-info">
				<span class="text-info text-muted">共有<span
					class="total text-danger lead"> ${page.total} </span>条记录，<span
					class="total-page text-danger lead"> ${page.totalPage} </span>页，每页显示<span
					class="page-record text-danger lead"> ${page.pageRecord} </span>
					条记录，当前为<span class="current text-danger lead">
						${page.current} </span>页
				</span>
			</div>
			<!-- 分页页码 -->
			<ul class="pagination">
				<li
					class="<c:if test="${page.prePage == 1}">
      disabled
    </c:if>"><a
					href="?${impParam}current=1&pageRecord=${page.pageRecord}">«</a></li>
				<li
					class="previous <c:if test="${page.prePage == 1}">disabled</c:if>">
					<a
					href="?${impParam}current=${page.prePage}&pageRecord=${page.pageRecord}">上一页</a>
				</li>

				<c:forEach begin="${page.start}" end="${page.end}" var="p">
					<li><a class="<c:if test="${page.current == p}">active</c:if>"
						href="?${impParam}current=${p}&pageRecord=${page.pageRecord}">${p}</a></li>
				</c:forEach>

				<li
					class="next
        <c:if test="${page.current == page.totalPage}">
      disabled
    </c:if>"><a
					href="?${impParam}current=${page.nextPage}&pageRecord=${page.pageRecord}">下一页</a></li>
				<li
					class="<c:if test="${page.nextPage == page.totalPage}">
      disabled
    </c:if>"><a
					href="?${impParam}current=${page.totalPage}&pageRecord=${page.pageRecord}">»</a></li>
			</ul>
		</div>
		<div class="col-xs-12 col-sm-3 col-md-2 col-md-offset-1">
			<!-- 改变分页 -->
			<div class="change-page">
				<div class="input-group">
					<input type="number" name="pageRecord" value="${page.pageRecord}"
						class="form-control" data-toggle="tooltip"
						title="输入后点击按钮可更改每页显示记录数(不能超过总记录数)"> <span
						class="input-group-btn">
						<button id="change-pagerecord-btn" class="btn btn-default"
							type="button" title="点击按钮可更改每页显示记录数">
							<span class="glyphicon glyphicon-list-alt"></span>
						</button>
					</span>
				</div>

				<div class="input-group">
					<input type="number" name="current" value="${page.current}"
						class="form-control" data-toggle="tooltip" title="输入后点击按钮可跳转到指定页">
					<span class="input-group-btn"><button
							id="change-current-btn" class="btn btn-default" type="button"
							title="点击按钮可跳转到指定页">
							<span class="glyphicon glyphicon-arrow-right"></span>
						</button> </span>
				</div>
			</div>
		</div>
	</div>
</div>