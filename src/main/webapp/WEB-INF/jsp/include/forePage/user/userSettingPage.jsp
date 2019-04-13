<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:set value="${userSetting}" var="us"></c:set>


<div class="user-setting user-panel container-fluid">
	<div class="row">
		<div class="clo-xs-11 col-sm-4 col-md-3 col-sm-offset-1">

			<!-- 是否记录登陆成功历史 -->
			<c:if test="${us.isRecordLoginSuccessHistory==1}">
				<div class="user-setting-panel panel panel-default panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">是否记录登陆成功历史</h3>
					</div>
					<div class="panel-body">
						<span class="hidden" field="isRecordLoginSuccessHistory">${us.isRecordLoginSuccessHistory}</span>
						<label class="show-hide-checked show-hide-checked-row">
							<div class="checked-btn">
								<input class="cust-input-checkbox" type="checkbox"
									name="isRecordLoginSuccessHistory" checked>
							</div>
							<div class="unchecked-area" style="display: none;">
								<span class="text-danger"><span
									class="glyphicon glyphicon-exclamation-sign"></span> 不记录登陆成功历史</span>
							</div>
							<div class="checked-area" style="display: block;">记录登陆成功历史</div>
						</label>
					</div>
					<div class="panel-footer clearfix" style="display: none">
						<button type="submit"
							class="btn btn-default btn-primary pull-right save-part-usersetting-btn">保存</button>
					</div>
				</div>
			</c:if>
			<c:if test="${us.isRecordLoginSuccessHistory==0}">
				<div class="user-setting-panel panel panel-default panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">是否记录登陆成功历史</h3>
					</div>
					<div class="panel-body">
						<span class="hidden" field="isRecordLoginSuccessHistory">${us.isRecordLoginSuccessHistory}</span>
						<label class="show-hide-checked show-hide-checked-row">
							<div class="checked-btn">
								<input class="cust-input-checkbox" type="checkbox"
									name="isRecordLoginSuccessHistory">
							</div>
							<div class="unchecked-area">
								<span class="text-danger"><span
									class="glyphicon glyphicon-exclamation-sign"></span> 不记录登陆成功历史</span>
							</div>
							<div class="checked-area">记录登陆成功历史</div>
						</label>
					</div>
					<div class="panel-footer clearfix" style="display: none">
						<button type="submit"
							class="btn btn-default btn-primary pull-right save-part-usersetting-btn">保存</button>
					</div>
				</div>
			</c:if>
			<!-- 是否记录登陆失败历史 -->
			<c:if test="${us.isRecordLoginFailHistory==1}">
				<div class="user-setting-panel panel panel-default panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">是否记录登陆失败历史</h3>
					</div>
					<div class="panel-body">
						<span class="hidden" field="isRecordLoginFailHistory">${us.isRecordLoginFailHistory}</span>
						<label class="show-hide-checked show-hide-checked-row">
							<div class="checked-btn">
								<input class="cust-input-checkbox" type="checkbox" id=""
									name="isRecordLoginFailHistory" checked>
							</div>
							<div class="unchecked-area" style="display: none">
								<span class="text-danger"><span
									class="glyphicon glyphicon-exclamation-sign"></span> 不记录登陆失败历史</span>
							</div>
							<div class="checked-area" style="display: block">记录登陆失败历史</div>
						</label>
					</div>
					<div class="panel-footer clearfix" style="display: none">
						<button type="submit"
							class="btn btn-default btn-primary pull-right save-part-usersetting-btn">保存</button>
					</div>
				</div>
			</c:if>

			<c:if test="${us.isRecordLoginFailHistory==0}">
				<div class="user-setting-panel panel panel-default panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">是否记录登陆失败历史</h3>
					</div>
					<div class="panel-body">
						<span class="hidden" field="isRecordLoginFailHistory">${us.isRecordLoginFailHistory}</span>
						<label class="show-hide-checked show-hide-checked-row">
							<div class="checked-btn">
								<input class="cust-input-checkbox" type="checkbox"
									name="isRecordLoginFailHistory">
							</div>
							<div class="unchecked-area">
								<span class="text-danger"><span
									class="glyphicon glyphicon-exclamation-sign"></span> 不记录登陆失败历史</span>
							</div>
							<div class="checked-area">记录登陆失败历史</div>
						</label>
					</div>
					<div class="panel-footer clearfix" style="display: none">
						<button type="submit"
							class="btn btn-default btn-primary pull-right save-part-usersetting-btn">保存</button>
					</div>
				</div>
			</c:if>

			<!-- 是否记录展示文章历史 -->
			<c:if test="${us.isRecordShowArticleHistory==1}">
				<div class="user-setting-panel panel panel-default panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">是否记录展示文章历史</h3>
					</div>
					<div class="panel-body">
						<span class="hidden" field="isRecordShowArticleHistory">${us.isRecordShowArticleHistory}</span>
						<label class="show-hide-checked show-hide-checked-row">
							<div class="checked-btn">
								<input class="cust-input-checkbox" type="checkbox"
									name="isRecordShowArticleHistory" checked>
							</div>
							<div class="unchecked-area" style="display: none">
								<span class="text-danger"><span
									class="glyphicon glyphicon-exclamation-sign"></span> 不记录展示文章历史</span>
							</div>
							<div class="checked-area" style="display: block">记录展示文章历史</div>
						</label>
					</div>
					<div class="panel-footer clearfix" style="display: none">
						<button type="submit"
							class="btn btn-default btn-primary pull-right save-part-usersetting-btn">保存</button>
					</div>
				</div>
			</c:if>
			<c:if test="${us.isRecordShowArticleHistory==0}">
				<div class="user-setting-panel panel panel-default panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">是否记录展示文章历史</h3>
					</div>
					<div class="panel-body">
						<span class="hidden" field="isRecordShowArticleHistory">${us.isRecordShowArticleHistory}</span>
						<label class="show-hide-checked show-hide-checked-row">
							<div class="checked-btn">
								<input class="cust-input-checkbox" type="checkbox"
									name="isRecordShowArticleHistory">
							</div>
							<div class="unchecked-area">
								<span class="text-danger"><span
									class="glyphicon glyphicon-exclamation-sign"></span> 不记录展示文章历史</span>
							</div>
							<div class="checked-area">记录展示文章历史</div>
						</label>
					</div>
					<div class="panel-footer clearfix" style="display: none">
						<button type="submit"
							class="btn btn-default btn-primary pull-right save-part-usersetting-btn">保存</button>
					</div>
				</div>
			</c:if>


		</div>
	</div>
</div>


