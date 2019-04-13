<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- <s:url value="/" /> -->


<!-- 登陆模态窗口 -->
<div class="modal fade" id="login-modal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">登陆</h4>
			</div>
			<div class="modal-body">
				<!-- 表单-操作-错误信息 -->
				<div class="form-op-errmsg">
					<span class="errmsg">fdfdfdfdfdf</span> <span
						class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
				</div>
				<!-- 登陆表单模态窗口 -->
				<form id="login-form-modal" class="form-group"
					role="login-form-modal">
					<div class="form-group">
						<label for="login-name">用户名</label> <input type="text"
							class="form-control" id="login-name" name="name"
							placeholder="请输入用户名">
					</div>
					<div class="form-group">
						<label for="login-password">密码</label> <input type="text"
							class="form-control" id="login-password" name="password"
							placeholder="请输入密码">
					</div>
					<div class="form-group">
						<label for="login-repassword">确认密码</label> <input type="text"
							class="form-control" id="login-repassword" name="repassword"
							placeholder="请输入确认密码">
					</div>

					<button type="submit" class="btn btn-block btn-danger">登陆</button>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 预览图片模态窗口 -->
<div class="modal fade" id="previewimg-modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">预览用户自定义图片</h4>
			</div>
			<div class="modal-body">
				<div id="userinfoimg-carousel" class="carousel slide">
					<!-- 轮播（Carousel）指标 -->
					<ol class="carousel-indicators">
						<li data-target="#userinfoimg-carousel" data-slide-to="0"
							class="active"></li>
						<li data-target="#userinfoimg-carousel" data-slide-to="1"></li>
						<li data-target="#userinfoimg-carousel" data-slide-to="2"></li>
						<li data-target="#userinfoimg-carousel" data-slide-to="3"></li>
					</ol>
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner">
						<div class="item active">
							<img
								src="<c:if test="${empty user.userInfo.browserIcon}"><s:url value="/images/favicon.ico" /></c:if>
							<c:if test="${!empty user.userInfo.browserIcon}"><s:url value="/${user.userInfo.browserIcon}" /></c:if>"
								alt="浏览器图标">
							<div class="carousel-caption">
								<span class="text-info">浏览器图标</span>
							</div>
						</div>
						<div class="item">
							<img
								src="<c:if test="${empty user.userInfo.headImg}"><s:url value="/images/1.4.1.jpg" /></c:if>
							<c:if test="${!empty user.userInfo.headImg}">
							<s:url value="/${user.userInfo.headImg}" />
							</c:if>"
								alt="头像">
							<div class="carousel-caption">
								<span class="text-info">头像</span>
							</div>
						</div>
						<div class="item">
							<img
								src="<c:if test="${empty user.userInfo.backgroundImg}"><s:url value="/images/2.jpg" /></c:if>
            <c:if test="${!empty user.userInfo.backgroundImg}"><s:url value="/${user.userInfo.backgroundImg}" /></c:if>"
								alt="背景图片">
							<div class="carousel-caption">
								<span class="text-info">背景图片</span>
							</div>
						</div>
						<div class="item">
							<img
								src="<c:if test="${empty user.userInfo.wnMaxCard}"><s:url value="/images/1.4.1.jpg" /></c:if>
							<c:if test="${!empty user.userInfo.wnMaxCard}"><s:url value="/${user.userInfo.wnMaxCard}" /></c:if>
							"
								alt="微信二维码名片">
							<div class="carousel-caption">
								<span class="text-info">微信二维码名片</span>
							</div>
						</div>
					</div>
					<!-- 轮播（Carousel）导航 -->
					<a class="left carousel-control" href="#userinfoimg-carousel"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#userinfoimg-carousel"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>

<!-- 编辑文章 -->
<div class="modal fade" id="edit-article-modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">编辑文章</h4>
			</div>
			<div class="modal-body">
				<div class="well" style="text-align: center;">
					<button id="edit-article-btn" class="btn btn-primary"
						data-toggle="collapse" data-target="#edit-article-form-modal">编辑文章</button>
					<a id="edit-articlecontent-btn"
						href="foreeditArticle?aid=${article.id}" class="btn btn-primary">直接编辑文章内容</a>
				</div>
				<!-- 编辑-文章-表单-模态窗口 -->
				<form id="edit-article-form-modal" action="" method="POST"
					role="form" class="collapse">
					<div class="form-group hidden">
						<label for="edit-article-id">文章ID</label> <input type="text"
							class="form-control" id="edit-article-id" name="id"
							placeholder="请输入文章标题">
					</div>
					<!-- 表单-操作-错误信息 -->
					<div class="form-op-errmsg">
						<span class="errmsg">fdfdfdfdfdf</span> <span
							class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
					</div>
					<div class="form-group">
						<label for="edit-article-title">文章标题</label> <input type="text"
							class="form-control" id="edit-article-title" name="title"
							placeholder="请输入文章标题">
					</div>
					<div class="form-group">
						<label for="edit-article-subTitle">文章副标题</label> <input
							type="text" class="form-control" id="edit-article-subTitle"
							name="subTitle" placeholder="请输入文章副标题">
					</div>
					<div class="form-group">
						<label for="edit-article-cid">文章分类</label> <select name="cid"
							id="edit-article-cid" class="form-control">
							<option value="">-- Select One --</option>
							<option value="1">HTML/CSS</option>
							<option value="2">JavaScript</option>
							<option value="3">服务端</option>
							<option value="4">数据库</option>
							<option value="5">移动端</option>
							<option value="6">XML教程</option>
						</select>
					</div>
					<div style="text-align: right;">
						<button type="reset" class="reset-btn btn btn-warning">重置</button>
						<button type="button" class="fill-btn btn btn-primary">填充原有信息</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="submit-btn btn btn-primary">提交</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>

<!-- 仅编辑文章模态窗口 -->
<div class="modal fade" id="only-edit-article-modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">编辑文章</h4>
			</div>
			<div class="modal-body">
				<!-- 编辑-文章-表单-模态窗口 -->
				<form id="only-edit-article-form-modal" action="" method="POST"
					role="form">
					<div class="icon-font-container">
						<div class="icon-info" title="点击量">
							<span class="text">点击量</span> <span class="info"><span
								text="clickNum"></span></span>
						</div>
						<div class="icon-info" title="浏览量">
							<span class="text">浏览量</span> <span class="info"><span
								text="viewNum"></span></span>
						</div>
						<div class="icon-info" title="文章状态">
							<span class="text">文章状态</span> <span class="info"><span
								text="articleStatu"></span></span>
						</div>
						<div class="icon-info" title="创建时间">
							<span class="text">创建时间</span> <span class="info"><span
								text="createTime"></span></span>
						</div>
						<div class="icon-info" title="更新时间">
							<span class="text">更新时间</span> <span class="info"><span
								text="updateTime"></span></span>
						</div>
					</div>
					<!-- 表单-操作-错误信息 -->
					<div class="form-op-errmsg">
						<span class="errmsg">fdfdfdfdfdf</span> <span
							class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
					</div>
					<div class="form-group hidden">
						<label for="id">文章ID</label> <input type="text"
							class="form-control" id="id" name="id">
					</div>
					<div class="form-group">
						<label for="title">文章标题</label> <input type="text"
							class="form-control" id="title" name="title"
							placeholder="请输入文章标题">
					</div>
					<div class="form-group">
						<label for="subTitle">文章副标题</label> <input type="text"
							class="form-control" id="subTitle" name="subTitle"
							placeholder="请输入文章副标题">
					</div>
					<div class="form-group">
						<label for="cid">文章分类</label> <select name="cid" id="cid"
							class="form-control">
							<option value="">-- Select One --</option>
							<option value="1">HTML/CSS</option>
							<option value="2">JavaScript</option>
							<option value="3">服务端</option>
							<option value="4">数据库</option>
							<option value="5">移动端</option>
							<option value="6">XML教程</option>
						</select>
					</div>
					<div style="text-align: right;">
						<button type="reset" class="reset-btn btn btn-warning">重置</button>
						<button type="button" class="fill-btn btn btn-primary">填充原有信息</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="submit-btn btn btn-primary">保存</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>

<!-- 增加文章 -->
<div class="modal fade" id="add-article-modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">增加文章</h4>
			</div>
			<div class="modal-body">
				<!-- 增加-文章-表单-模态窗口 -->
				<form id="add-article-form-modal" action="foreaddArticleAsync"
					method="POST" role="form">
					<!-- 表单-操作-错误信息 -->
					<div class="form-op-errmsg">
						<span class="errmsg">fdfdfdfdfdf</span> <span
							class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
					</div>
					<div class="form-group">
						<label for="add-article-title">文章标题</label> <input type="text"
							class="form-control" id="add-article-title" name="title"
							placeholder="请输入文章标题">
					</div>
					<div class="form-group">
						<label for="add-article-subTitle">文章副标题</label> <input type="text"
							class="form-control" id="add-article-subTitle" name="subTitle"
							placeholder="请输入文章副标题">
					</div>
					<div class="form-group hidden">
						<label for="add-article-articleStatu">文章状态</label> <select
							name="articleStatu" id="add-article-articleStatu"
							class="form-control">
							<option value="">请输入文章状态</option>
							<option value="0">草稿</option>
							<option value="1">文章</option>
						</select>
					</div>
					<div class="form-group">
						<label for="add-article-cid">文章分类</label> <select name="cid"
							id="add-article-cid" class="form-control">
							<option value="">-- Select One --</option>
							<option value="1">HTML/CSS</option>
							<option value="2">JavaScript</option>
							<option value="3">服务端</option>
							<option value="4">数据库</option>
							<option value="5">移动端</option>
							<option value="6">XML教程</option>
						</select>
					</div>
					<div style="text-align: right;">
						<button type="reset" class="reset-btn btn btn-warning">重置</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="submit-btn btn btn-primary">保存</button>
					</div>
				</form>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>

<!-- 转到文章箱 -->
<div class="modal fade" id="change-article">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">温馨提示：转到文章箱</h4>
			</div>
			<div class="modal-body">确认转到文章箱？</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">还是算了</button>
				<button type="submit" class="confirm-btn btn btn-danger">确认</button>
			</div>
		</div>
	</div>
</div>

<!-- 转到草稿箱 -->
<div class="modal fade" id="change-drafts">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">温馨提示：转到草稿箱</h4>
			</div>
			<div class="modal-body">确认转到草稿箱？</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">还是算了</button>
				<button type="submit" class="confirm-btn btn btn-danger">确认</button>
			</div>
		</div>
	</div>
</div>

<!-- 转到垃圾箱 -->
<div class="modal fade" id="change-dustbin">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">温馨提示：转到垃圾箱</h4>
			</div>
			<div class="modal-body">确认转到垃圾箱？</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">还是算了</button>
				<button type="submit" class="confirm-btn btn btn-danger">确认</button>
			</div>
		</div>
	</div>
</div>

<!-- 彻底删除 -->
<div class="modal fade" id="thorough-delete">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">温馨提示：彻底删除</h4>
			</div>
			<div class="modal-body">确认彻底删除吗？删除后就不能找回</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">我再想想</button>
				<button type="submit" class="confirm-btn btn btn-danger">确认</button>
			</div>
		</div>
	</div>
</div>


<!-- 增加分组 -->
<div class="modal fade" id="add-group-modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">增加组</h4>
			</div>
			<div class="modal-body">

				<form id="add-group-modal-form" action="foreaddGroupAsync"
					method="POST" role="add-group-form-modal" class="clearfix">
					<!-- 表单-操作-错误信息 -->
					<div class="form-op-errmsg">
						<span class="errmsg">fdfdfdfdfdf</span> <span
							class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
					</div>
					<div class="form-group">
						<label for="add-group-name">组名</label> <input type="text"
							class="form-control" id="add-group-name" name="name"
							placeholder="请输入组名">
					</div>
					<div class="form-group">
						<label for="add-group-visibility">可见</label>
						<div class="input-raido">
							<label for="add-group-visible">&nbsp;&nbsp;<input
								type="radio" id="add-group-visible" class="cust-input-radio"
								name="visibility" value="1">&nbsp;&nbsp;<span>显示</span>&nbsp;<span
								class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;
							</label> <label for="add-group-hidden">&nbsp;&nbsp;<input
								type="radio" id="add-group-hidden" class="cust-input-radio"
								name="visibility" value="0">&nbsp;&nbsp;<span>隐藏</span>&nbsp;<span
								class="glyphicon glyphicon-eye-close"></span>&nbsp;
							</label>
						</div>
					</div>
					<div class="form-group hidden">
						<label for="add-group-groupType">组类</label> <select
							id="add-group-groupType" name="groupType" class="form-control">
							<option value="">请选择组类</option>
							<option value="0">用户关注</option>
							<option value="1">文章收藏</option>
						</select>
					</div>
					<div style="text-align: right;">
						<button type="reset" class="reset-btn btn btn-warning">重置</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="submit-btn btn btn-primary">提交</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>

<!-- 编辑分组 -->
<div class="modal fade" id="edit-group-modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">编辑组</h4>
			</div>
			<div class="modal-body">

				<form id="edit-group-form-modal" action="foreeditGroupAsync"
					method="POST" role="edit-group-form-modal" class="clearfix">
					<!-- 表单-操作-错误信息 -->
					<div class="form-op-errmsg">
						<span class="errmsg">fdfdfdfdfdf</span> <span
							class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
					</div>
					<div class="form-group hidden">
						<label for="id">组ID</label> <input type="text"
							class="form-control" id="id" name="id" placeholder="请输入组ID">
					</div>
					<div class="form-group">
						<label for="edit-group-name">组名</label> <input type="text"
							class="form-control" id="edit-group-name" name="name"
							placeholder="请输入组名">
					</div>
					<div class="form-group">
						<label for="visibility">可见</label>
						<div class="input-raido">
							<label for="visible">&nbsp;&nbsp;<input type="radio"
								id="visible" class="cust-input-radio" name="visibility"
								value="1">&nbsp;&nbsp;<span>显示</span>&nbsp;<span
								class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;
							</label> <label for="hidden">&nbsp;&nbsp;<input type="radio"
								id="hidden" class="cust-input-radio" name="visibility" value="0">&nbsp;&nbsp;<span>隐藏</span>&nbsp;<span
								class="glyphicon glyphicon-eye-close"></span>&nbsp;
							</label>
						</div>
					</div>
					<div class="form-group hidden">
						<label for="edit-group-groupType">组类</label> <select
							id="edit-group-groupType" name="groupType" class="form-control">
							<option value="">请选择组类</option>
							<option value="0">用户关注</option>
							<option value="1">文章收藏</option>
						</select>
					</div>
					<div style="text-align: right;">
						<button type="reset" class="reset-btn btn btn-warning">重置</button>
						<button type="button" class="fill-btn btn btn-primary">填充原有信息</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="submit-btn btn btn-primary">提交</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>

<!-- 删除分组 -->
<div class="modal fade" id="delete-group-modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">删除组</h4>
			</div>
			<div class="modal-body">确认删除该组吗？</div>
			<div class="modal-footer">
				<div
					style="display: flex; flex-direction: row; justify-content: space-between;">
					<label class="show-hide-checked show-hide-checked-row"> <span
						class="checked-btn"><input class="cust-input-checkbox"
							type="checkbox" name="isSave" id=""></span> <span
						class="unchecked-area"><span class="text-danger"><span
								class="glyphicon glyphicon-exclamation-sign"></span> 将直接删除分组的相关</span></span>
						<span class="checked-area"><span class="text-success">将删除分组的相关保存到默认分组</span></span>
					</label>
					<div>
						<button type="button" class="btn btn-default" data-dismiss="modal">还是算了</button>
						<button type="button" class="btn btn-danger confirm-btn">确认</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 收藏文章、关注用户 -->
<!-- list-group-btn data-id grouptype -->
<div class="modal fade" id="list-group-modal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">收藏文章/关注用户</h4>
			</div>
			<div class="modal-body">
				<!-- 列出分组-操作 -->
				<div class="group-tab-content tab-content">
					<div class="list-group-op cust-tab-op btn-sm pull-right">
						<button class="btn one-tab-btn new-group-btn"
							href="#add-group-tab" data-toggle="tab">新建分组</button>
						<button class="btn other-tab-btn" href="#exist-group-tab"
							data-toggle="tab">取消新建分组</button>
					</div>
					<!-- 现有分组 -->
					<div class="tab-pane fade in active" id="exist-group-tab">
						<form id="list-group-form-tab" action="" method="POST"
							role="list-group-form-modal">
							<span class="pull-right">已选择<span
								class="selected-num text-info"></span>组
							</span>
							<!-- 表单-操作-成功信息 -->
							<div class="form-op-successmsg bg-success">
								<span class="errmsg text-success">注册成功，请登录</span> <span
									class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
							</div>
							<!-- 表单-操作-错误信息 -->
							<div class="form-op-errmsg">
								<span class="errmsg">fdfdfdfdfdf</span> <span
									class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
							</div>
							<div class="cust-checkbox cust-checkbox-column">
								<label class="cust-checkbox-label"> <input
									type="checkbox" value="1" name="gid"> <span
									class="text-muted">学习</span>
								</label> <label class="cust-checkbox-label"> <input
									type="checkbox" value="2" name="gid"> <span
									class="text-muted">默认</span>
								</label> <label class="cust-checkbox-label"> <input
									type="checkbox" value="3" name="gid"> <span
									class="text-muted">音乐</span>
								</label>
							</div>

							<button type="submit"
								class="confirm-btn btn btn-primary center-block">确定</button>
						</form>
					</div>
					<!-- 新建分组 -->
					<div class="tab-pane fade in" id="add-group-tab">
						<form id="add-group-form-tab" action="foreaddGroupAsync"
							method="POST" role="add-group-form-tab" class="clearfix">
							<!-- 表单-操作-错误信息 -->
							<div class="form-op-errmsg">
								<span class="errmsg">fdfdfdfdfdf</span> <span
									class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
							</div>
							<div class="form-group">
								<label for="name">组名</label> <input type="text"
									class="form-control" id="name" name="name" placeholder="请输入组名">
							</div>
							<div class="form-group">
								<label for="visibility">可见</label>
								<div class="input-raido">
									<label for="visible">&nbsp;&nbsp;<input type="radio"
										id="visible" class="cust-input-radio" name="visibility"
										value="1">&nbsp;&nbsp;<span>显示</span>&nbsp;<span
										class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;
									</label> <label for="hidden">&nbsp;&nbsp;<input type="radio"
										id="hidden" class="cust-input-radio" name="visibility"
										value="0">&nbsp;&nbsp;<span>隐藏</span>&nbsp;<span
										class="glyphicon glyphicon-eye-close"></span>&nbsp;
									</label>
								</div>
							</div>
							<div class="form-group hidden">
								<label for="groupType">组类</label> <select id="groupType"
									name="groupType" class="form-control">
									<option value="">请选择组类</option>
									<option value="0">用户关注</option>
									<option value="1">文章收藏</option>
								</select>
							</div>
							<div style="text-align: right;">
								<button type="reset" class="reset-btn btn btn-warning">重置</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="submit" class="submit-btn btn btn-primary">提交</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 提示模态窗口 -->
<div class="modal fade" id="tip-modal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					<span class="text-danger">上传文件错误</span>
				</h4>
			</div>
			<div class="modal-body">
				<span class="text-danger">文件类型不符合</span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>

<!-- 关于作者 -->
<div class="modal fade" id="about-author">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">关于作者</h4>
			</div>
			<div class="modal-body">
				<div class="user-info">
					<span>星辉kxh</span>
					<table class="table table-condensed table-hover">
						<tbody>
							<tr>
								<th><span class="glyphicon glyphicon-user"></span>真实姓名</th>
								<td>邝星辉</td>
							</tr>
							<tr>
								<th><span class="iconfont icon-xingbienan"></span>性别</th>
								<td>男</td>
							</tr>
							<tr>
								<th><span class="glyphicon glyphicon-phone"></span>手机</th>
								<td>13416668123</td>
							</tr>
							<tr>
								<th><span class="iconfont icon-youxiang"></span>邮箱</th>
								<td>949869433@qq.com</td>
							</tr>
							<tr>
								<th><span class="glyphicon glyphicon-map-marker"></span>地址</th>
								<td>广东东莞</td>
							</tr>
							<tr>
								<th><span class="glyphicon glyphicon-calendar"></span>生日</th>
								<td>1996/11/19</td>
							</tr>
						</tbody>

					</table>
				</div>
				<div class="reference"></div>
			</div>
		</div>
	</div>
</div>