<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set value="${param.act}" var="act"></c:set>

<div class="container-fluid" style="margin: 7rem 0 12rem;">
	<div class="row">
		<div
			class="col-xs-12 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
			<ul id="myTab" class="nav nav-tabs">
				<li <c:if test="${empty act}">class="active"</c:if>><a
					href="#userinfo-setting" data-toggle="tab"> <span
						class="glyphicon glyphicon-user"></span> 用户信息
				</a></li>
				<li
					class="dropdown <c:if test='${act=="editBrowserIcon"}'>active</c:if>"><a
					href="#" id="image-setting" class="dropdown-toggle"
					data-toggle="dropdown"><span
						class="glyphicon glyphicon-picture"></span> 图片设置 <b class="caret"></b>
				</a>
					<ul class="dropdown-menu" role="menu"
						aria-labelledby="image-setting">
						<li><a href="#browser-icon" tabindex="-1" data-toggle="tab">
								浏览器图标 </a></li>
						<li><a href="#head-img" tabindex="-1" data-toggle="tab">
								头像 </a></li>
						<li><a href="#background-img" tabindex="-1" data-toggle="tab">
								背景图片 </a></li>
						<li><a href="#wnmaxcard" tabindex="-1" data-toggle="tab">
								微信二维码名片 </a></li>
					</ul></li>
				<li <c:if test="${act=='editUser'}">class="active"</c:if>><a
					href="#userpwd-setting" data-toggle="tab"> <span
						class="glyphicon glyphicon-lock"></span> 修改密码
				</a></li>
			</ul>
			<div class="tab-content row">

				<jsp:useBean id="userInfo"
					class="site.xinghui.pblog_sb.pojo.UserInfo" scope="request" />
				<jsp:useBean id="user" class="site.xinghui.pblog_sb.pojo.User"
					scope="request" />

				<div
					class="tab-pane fade in col-xs-12 <c:if test='${empty act}'>active</c:if>"
					id="userinfo-setting">
					<!-- 表单-操作-成功信息 -->
					<div class="form-op-successmsg bg-success"
						<c:if test="${!empty successEditUserInfoMsg}">style="display: flex;"</c:if>>
						<span class="errmsg text-success">${successEditUserInfoMsg}</span>
						<span
							class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
					</div>
					<!-- 表单-操作-错误信息 -->
					<div class="form-op-errmsg"
						<c:if test="${!empty editUserInfoMsg}">style="visibility: visible;"</c:if>>
						<span class="errmsg">${editUserInfoMsg}</span> <span
							class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
					</div>

					<sf:form modelAttribute="userInfo" cssClass="userinfo-form"
						action="foreeditUserInfo" method="POST" role="userinfo-form">
						<div class="form-group">
							<label for="realName">真实姓名</label>
							<sf:input path="realName" id="realName" cssClass="form-control"
								placeholder="请输入真实姓名" />
						</div>
						<!-- 表单验证错误信息 -->
						<div class="form-valid-errmsg">
							<sf:errors path="realName" cssClass="errmsg" />
							<span
								class="close-msg-btn close-validmsg-btn glyphicon glyphicon-remove"></span>
						</div>
						<div class="form-group">
							<label for="gender">性别</label>
							<%-- <sf:radiobutton path="gender" id="male" value="1"/>
							<sf:radiobutton path="gender" id="female" value="0"/> --%>
							<div class="input-raido">
								<label for="male">&nbsp;&nbsp;<sf:radiobutton
										path="gender" id="male" value="1" />&nbsp;&nbsp;<span>男</span>&nbsp;&nbsp;
								</label> <label for="female">&nbsp;&nbsp;<sf:radiobutton
										path="gender" id="female" value="0" />&nbsp;&nbsp;<span>女</span>&nbsp;&nbsp;
								</label>
							</div>
						</div>
						<!-- 表单验证错误信息 -->
						<div class="form-valid-errmsg">
							<sf:errors path="gender" cssClass="errmsg" />
							<span
								class="close-msg-btn close-validmsg-btn glyphicon glyphicon-remove"></span>
						</div>
						<div class="form-group">
							<label for="mobile">手机号码</label>
							<sf:input path="mobile" id="mobile" name="mobile"
								cssClass="form-control" placeholder="请输入手机号码" />
						</div>
						<!-- 表单验证错误信息 -->
						<div class="form-valid-errmsg">
							<sf:errors path="mobile" cssClass="errmsg" />
							<span
								class="close-msg-btn close-validmsg-btn glyphicon glyphicon-remove"></span>
						</div>
						<div class="form-group">
							<label for="email">邮箱</label>
							<sf:input path="email" id="email" name="email"
								cssClass="form-control" placeholder="请输入邮箱" />
							<!-- <input type="text" class="form-control" id="email" name="email"
								placeholder=""> -->
						</div>
						<!-- 表单验证错误信息 -->
						<div class="form-valid-errmsg">
							<sf:errors path="email" cssClass="errmsg" />
							<span
								class="close-msg-btn close-validmsg-btn glyphicon glyphicon-remove"></span>
						</div>
						<div class="form-group">
							<label for="birthday">生日</label>
							<sf:input path="birthday" type="date" id="birthday"
								cssClass="form-control" placeholder="请输入生日" />
							<!-- <input type="date" class="form-control" id="birthday"
								name="birthday" placeholder=""> -->
						</div>
						<!-- 表单验证错误信息 -->
						<div class="form-valid-errmsg">
							<sf:errors path="birthday" cssClass="errmsg" />
							<span
								class="close-msg-btn close-validmsg-btn glyphicon glyphicon-remove"></span>
						</div>
						<div class="form-group">
							<label for="">地址</label>
							<div class="address-select form-group">
								<select name="address-province" id="province"
									class="form-control">
									<option value="">选择省</option>
								</select> <select name="address-city" id="city" class="form-control">
									<option value="">选择城市</option>
								</select> <select name="address-area" id="area" class="form-control">
									<option value="">选择区</option>
								</select>
							</div>
							<div class="address">
								<input type="text" class="form-control" name="address" readonly>
							</div>
						</div>
						<!-- 表单验证错误信息 -->
						<div class="form-valid-errmsg">
							<sf:errors path="address" cssClass="errmsg" />
							<span
								class="close-msg-btn close-validmsg-btn glyphicon glyphicon-remove"></span>
						</div>
						<div class="form-group">
							<label for="dictum">名言</label>
							<sf:input path="dictum" id="dictum" cssClass="form-control"
								placeholder="请输入名言" />
						</div>
						<!-- 表单验证错误信息 -->
						<div class="form-valid-errmsg">
							<sf:errors path="dictum" cssClass="errmsg" />
							<span
								class="close-msg-btn close-validmsg-btn glyphicon glyphicon-remove"></span>
						</div>
						<div class="center-block">
							<button type="submit" class="btn btn-primary center-block">保存</button>
						</div>

					</sf:form>
				</div>

				<div class="tab-pane fade col-xs-10 col-xs-offset-1"
					id="browser-icon">
					<div class="upLoadImgDiv">
						<div class="upLoadImgDiv-container">
							<div class="upLoadImg">
								<div class="upLoadImg-container">
									<!-- 选择上传图片 -->
									<div class="selUpLoadImg">
										<span class="glyphicon glyphicon-plus"></span> <span>选择要上传的图片</span>
									</div>
									<!-- 事件冒泡[input标签在要点击的标签内:Maximum call stack size exceeded] -->
									<!-- 真实图片 input -->
									<input type="file" class="realImg">
									<figure>
										<!-- ../../img/lunbo/1.jpg -->
										<!-- img-thumbnail -->
										<img class="showImg" src="">
									</figure>
									<!-- 上传图片信息 -->
									<div class="upLoadImgInfo">
										<table>
											<tr>
												<th>文件名：</th>
												<td class="text-info">fdjkfjd.jpg</td>
											</tr>
											<tr>
												<th>文件扩展名：</th>
												<td class="text-info">jpg</td>
											</tr>
											<tr>
												<th>文件大小：</th>
												<td class="text-info">102412</td>
											</tr>
											<tr>
												<th>真实宽高度：</th>
												<td class="text-info">500 * 120</td>
											</tr>
										</table>
									</div>
								</div>
								<!-- 上传图片按钮操作 -->
								<div class="upLoadImgBtnOp btn-group btn-group-sm">
									<!-- 预览图片按钮 -->
									<button type="button" class="preViewImgBtn btn btn-primary"
										data-toggle="tooltip" title="预览上传图片">预览</button>
									<!-- 重置图片按钮 -->
									<button type="button" class="resetImgBtn btn btn-warning"
										data-toggle="tooltip" title="重置上传图片">重置</button>
									<!-- 查看图片信息按钮 -->
									<button type="button" class="viewImgInfoBtn btn btn-info"
										data-toggle="tooltip" title="查看上传图片信息">查看</button>
									<!-- 保存图片按钮 -->
									<button type="button" class="saveImgBtn btn btn-success"
										data-toggle="tooltip" title="保存上传图片"
										data-imgType="browserIcon">保存</button>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="tab-pane fade col-xs-10 col-xs-offset-1" id="head-img">

					<div class="upLoadImgDiv">
						<div class="upLoadImgDiv-container">
							<div class="upLoadImg">
								<div class="upLoadImg-container">
									<!-- 选择上传图片 -->
									<div class="selUpLoadImg">
										<span class="glyphicon glyphicon-plus"></span> <span>选择要上传的图片</span>
									</div>
									<!-- 事件冒泡[input标签在要点击的标签内:Maximum call stack size exceeded] -->
									<!-- 真实图片 input -->
									<input type="file" class="realImg">
									<figure>
										<!-- ../../img/lunbo/1.jpg -->
										<!-- img-thumbnail -->
										<img class="showImg" src="">
									</figure>
									<!-- 上传图片信息 -->
									<div class="upLoadImgInfo">
										<table>
											<tr>
												<th>文件名：</th>
												<td class="text-info">fdjkfjd.jpg</td>
											</tr>
											<tr>
												<th>文件扩展名：</th>
												<td class="text-info">jpg</td>
											</tr>
											<tr>
												<th>文件大小：</th>
												<td class="text-info">102412</td>
											</tr>
											<tr>
												<th>真实宽高度：</th>
												<td class="text-info">500 * 120</td>
											</tr>
										</table>
									</div>
								</div>
								<!-- 上传图片按钮操作 -->
								<div class="upLoadImgBtnOp btn-group btn-group-sm">
									<!-- 预览图片按钮 -->
									<button type="button" class="preViewImgBtn btn btn-primary"
										data-toggle="tooltip" title="预览上传图片">预览</button>
									<!-- 重置图片按钮 -->
									<button type="button" class="resetImgBtn btn btn-warning"
										data-toggle="tooltip" title="重置上传图片">重置</button>
									<!-- 查看图片信息按钮 -->
									<button type="button" class="viewImgInfoBtn btn btn-info"
										data-toggle="tooltip" title="查看上传图片信息">查看</button>
									<!-- 保存图片按钮 -->
									<button type="button" class="saveImgBtn btn btn-success"
										data-toggle="tooltip" title="保存上传图片" data-imgType="headImg">保存</button>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="tab-pane fade col-xs-10 col-xs-offset-1"
					id="background-img">
					<div class="upLoadImgDiv">
						<div class="upLoadImgDiv-container">
							<div class="upLoadImg">
								<div class="upLoadImg-container">
									<!-- 选择上传图片 -->
									<div class="selUpLoadImg">
										<span class="glyphicon glyphicon-plus"></span> <span>选择要上传的图片</span>
									</div>
									<!-- 事件冒泡[input标签在要点击的标签内:Maximum call stack size exceeded] -->
									<!-- 真实图片 input -->
									<input type="file" class="realImg">
									<figure>
										<!-- ../../img/lunbo/1.jpg -->
										<!-- img-thumbnail -->
										<img class="showImg" src="">
									</figure>
									<!-- 上传图片信息 -->
									<div class="upLoadImgInfo">
										<table>
											<tr>
												<th>文件名：</th>
												<td class="text-info">fdjkfjd.jpg</td>
											</tr>
											<tr>
												<th>文件扩展名：</th>
												<td class="text-info">jpg</td>
											</tr>
											<tr>
												<th>文件大小：</th>
												<td class="text-info">102412</td>
											</tr>
											<tr>
												<th>真实宽高度：</th>
												<td class="text-info">500 * 120</td>
											</tr>
										</table>
									</div>
								</div>
								<!-- 上传图片按钮操作 -->
								<div class="upLoadImgBtnOp btn-group btn-group-sm">
									<!-- 预览图片按钮 -->
									<button type="button" class="preViewImgBtn btn btn-primary"
										data-toggle="tooltip" title="预览上传图片">预览</button>
									<!-- 重置图片按钮 -->
									<button type="button" class="resetImgBtn btn btn-warning"
										data-toggle="tooltip" title="重置上传图片">重置</button>
									<!-- 查看图片信息按钮 -->
									<button type="button" class="viewImgInfoBtn btn btn-info"
										data-toggle="tooltip" title="查看上传图片信息">查看</button>
									<!-- 保存图片按钮 -->
									<button type="button" class="saveImgBtn btn btn-success"
										data-toggle="tooltip" title="保存上传图片"
										data-imgType="backgroundImg">保存</button>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="tab-pane fade col-xs-10 col-xs-offset-1" id="wnmaxcard">

					<div class="upLoadImgDiv">
						<div class="upLoadImgDiv-container">
							<div class="upLoadImg">
								<div class="upLoadImg-container">
									<!-- 选择上传图片 -->
									<div class="selUpLoadImg">
										<span class="glyphicon glyphicon-plus"></span> <span>选择要上传的图片</span>
									</div>
									<!-- 事件冒泡[input标签在要点击的标签内:Maximum call stack size exceeded] -->
									<!-- 真实图片 input -->
									<input type="file" class="realImg">
									<figure>
										<!-- ../../img/lunbo/1.jpg -->
										<!-- img-thumbnail -->
										<img class="showImg" src="">
									</figure>
									<!-- 上传图片信息 -->
									<div class="upLoadImgInfo">
										<table>
											<tr>
												<th>文件名：</th>
												<td class="text-info">fdjkfjd.jpg</td>
											</tr>
											<tr>
												<th>文件扩展名：</th>
												<td class="text-info">jpg</td>
											</tr>
											<tr>
												<th>文件大小：</th>
												<td class="text-info">102412</td>
											</tr>
											<tr>
												<th>真实宽高度：</th>
												<td class="text-info">500 * 120</td>
											</tr>
										</table>
									</div>
								</div>
								<!-- 上传图片按钮操作 -->
								<div class="upLoadImgBtnOp btn-group btn-group-sm">
									<!-- 预览图片按钮 -->
									<button type="button" class="preViewImgBtn btn btn-primary"
										data-toggle="tooltip" title="预览上传图片">预览</button>
									<!-- 重置图片按钮 -->
									<button type="button" class="resetImgBtn btn btn-warning"
										data-toggle="tooltip" title="重置上传图片">重置</button>
									<!-- 查看图片信息按钮 -->
									<button type="button" class="viewImgInfoBtn btn btn-info"
										data-toggle="tooltip" title="查看上传图片信息">查看</button>
									<!-- 保存图片按钮 -->
									<button type="button" class="saveImgBtn btn btn-success"
										data-toggle="tooltip" title="保存上传图片" data-imgType="wnMaxCard">保存</button>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div
					class="tab-pane fade in col-xs-12 <c:if test='${act=="editUser"}'>active</c:if>"
					id="userpwd-setting">

					<!-- 表单-操作-成功信息 -->
					<div class="form-op-successmsg bg-success"
						<c:if test="${!empty successEditUserMsg}">style="display: flex;"</c:if>>
						<span class="errmsg text-success">${successEditUserMsg}</span> <span
							class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
					</div>
					<!-- 表单-操作-错误信息 -->
					<div class="form-op-errmsg"
						<c:if test="${!empty editUserMsg}">style="visibility: visible;"</c:if>>
						<span class="errmsg">${editUserMsg}</span> <span
							class="close-msg-btn close-opmsg-btn glyphicon glyphicon-remove"></span>
					</div>

					<sf:form modelAttribute="user" cssClass="user-form"
						action="foreeditUser" method="POST" role="user-form">
						<div class="form-group">
							<label for="password">密码</label>
							<sf:password path="password" id="password"
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
							<sf:password path="repassword" id="repassword"
								cssClass="form-control" placeholder="请输入确认密码" />
						</div>
						<!-- 表单验证错误信息 -->
						<div class="form-valid-errmsg">
							<sf:errors path="repassword" cssClass="errmsg" />
							<span
								class="close-msg-btn close-validmsg-btn glyphicon glyphicon-remove"></span>
						</div>
						<div class="center-block" style="text-align: center;">
							<button type="reset" class="btn">重置</button>
							<button type="submit" class="btn btn-primary">保存</button>
						</div>

					</sf:form>
				</div>
			</div>
		</div>
	</div>
</div>