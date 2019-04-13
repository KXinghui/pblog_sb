<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>



<!-- 用户-关注 -->
<div class="user-follow container-fluid center-block">
	<!-- 悬浮菜单图标 拖拽部件 -->
	<span class="open-suspend-menu suspend-menu-icon drag-part visible-xs">用户关注分组</span>
	<div class="row">
		<div class="col-xs-12 col-sm-4 col-md-3">
			<!-- 悬浮-菜单 -->
			<div class="suspend-menu">
				<!-- 悬浮-菜单-按钮组 -->
				<div class="suspend-menu-btn-group clearfix">
					<span
						class="close-suspend-menu glyphicon glyphicon-remove pull-right visible-xs"></span>
				</div>
				<!-- 悬浮菜单导航 -->
				<div class="suspend-menu-nav">

					<!-- 自身用户 -->
					<c:if test="${empty otherUser && !empty user}">
						<!-- 悬浮菜单导航标题 -->
						<div class="suspend-menu-nav-title">
							<span>用户关注分组</span>
							<button class="btn btn-sm btn-default add-group-btn"
								grouptype="userfollow">
								<span class="glyphicon glyphicon-plus"></span>新建
							</button>
						</div>
						<!-- 悬浮-菜单-导航-列表 -->
						<div class="suspend-menu-nav-list">
							<!-- 菜单导航 -->
							<div class="menu-nav">
								<!-- 菜单列表 -->
								<div class="menu-list">
									<!-- 菜单列表标题 -->
									<div class="menu-title">关注</div>
									<!-- 自身用户 -->
									<c:if test="${empty otherUser && !empty user}">
										<!-- 菜单项 -->
										<div
											class="menu-item <c:if test="${!empty allFollowsPr}">menu-item-active</c:if>">
											<a href="<s:url value="/fore/user/${user.id}/userfollow" />"
												class=""><span class="">全部的关注用户</span></a>
										</div>
										<c:forEach items="${groups}" var="g">
											<div
												class="menu-item <c:if test="${followGroup.id==g.id}">menu-item-active</c:if> group-title"
												data-id="${g.id}">
												<div class="group-name">
													<a
														href='<s:url value="/fore/user/${user.id}/userfollow/follows/${g.id}" />'
														class="text-info" field="name">${g.name}</a>·
													<c:if test="${g.visibility=='VISIBLE'}">
														<span field="visibility">显示</span>
													</c:if>
													<c:if test="${g.visibility=='HIDDEN'}">
														<span field="visibility">隐藏</span>
													</c:if>
													<span class="hidden" field="id">${g.id}</span> <span
														class="hidden" field="groupType">用户关注</span>
												</div>
												<div class="btn-group btn-group-sm">
													<!-- edit-group-btn -->
													<button class="btn btn-default edit-group-btn"
														grouptype="userfollow">编辑</button>
													<button class="btn btn-danger delete-group-btn"
														grouptype="userfollow">删除</button>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<!-- 其他用户 -->
									<c:if test="${!empty otherUser}">
										<!-- 菜单项 -->
										<div
											class="menu-item <c:if test="${!empty allFollowsPr}">menu-item-active</c:if>">
											<a
												href="<s:url value="/fore/user/${otherUser.id}/userfollow" />"
												class=""><span class="">全部的关注用户</span></a>
										</div>
										<c:forEach items="${groups}" var="g">
											<div class="menu-item group-title">
												<div class="group-name">
													<a
														href='<s:url value="/fore/user/${otherUser.id}/userfollow/fans" />'
														class="text-info" field="name">${g.name}</a>·<span
														class="glyphicon glyphicon-eye-open"></span><span
														field="visibility">显示</span> <span class="hidden"
														field="id">${g.id}</span> <span class="hidden"
														field="groupType">文章收藏</span>
												</div>
											</div>
										</c:forEach>
									</c:if>

									<!-- 菜单列表标题 -->
									<div class="menu-title">粉丝</div>
									<!-- 菜单项 -->
									<div
										class="menu-item <c:if test="${!empty fansPr}">menu-item-active</c:if>">
										<a
											href="<s:url value="/fore/user/${user.id}/userfollow/fans" />"
											class=""><span class="">全部的粉丝</span></a>
									</div>
								</div>
							</div>

						</div>
					</c:if>

					<!-- 其他用户 -->
					<c:if test="${!empty otherUser}">

						<!-- 悬浮菜单导航标题 -->
						<div class="suspend-menu-nav-title">
							<span>用户关注分组</span>
						</div>
						<!-- 悬浮-菜单-导航-列表 -->
						<div class="suspend-menu-nav-list">
							<!-- 菜单导航 -->
							<div class="menu-nav">
								<!-- 菜单列表 -->
								<div class="menu-list">
									<!-- 菜单列表标题 -->
									<div class="menu-title">关注</div>
									<!-- 菜单项 -->
									<div
										class="menu-item <c:if test="${!empty allFollowsPr}">menu-item-active</c:if>">
										<a
											href="<s:url value="/fore/user/${otherUser.id}/userfollow" />"
											class=""><span class="">全部的关注用户</span></a>
									</div>
									<c:forEach items="${groups}" var="g">
										<div class="menu-item group-title" data-id="${g.id}">
											<div class="group-name">
												<a
													href='<s:url value="/fore/user/${otherUser.id}/userfollow/follows/${g.id}"></s:url>'
													class="text-info" field="name">${g.name}</a>·<span
													field="visibility">显示</span> <span class="hidden"
													field="id">${g.id}</span> <span class="hidden"
													field="groupType">文章收藏</span>
											</div>
										</div>
									</c:forEach>

									<!-- 菜单列表标题 -->
									<div class="menu-title">粉丝</div>
									<!-- 菜单项 -->
									<div
										class="menu-item <c:if test="${!empty fansPr}">menu-item-active</c:if>">
										<a
											href="<s:url value="/fore/user/${otherUser.id}/userfollow/fans" />"
											class=""><span class="">全部的粉丝</span></a>
									</div>
								</div>
							</div>

						</div>
					</c:if>

				</div>
			</div>
		</div>


		<div class="col-xs-12 col-sm-8 col-md-9">
			<!-- 内容-主体 -->
			<div class="content-body">
				<!-- 容器-组 -->
				<div class="container-group">
					<!-- 用户关注面板 -->

					<!-- 全部的用户关注 -->
					<c:if test="${!empty allFollowsPr}">
						<div class="group-title">
							<div class="group-name lead">全部的关注</div>
						</div>
						<div class="group-content">
							<div class="group-body">
								<ul class="group-ul">
									<!-- 自身用户 -->
									<c:if test="${empty otherUser && !empty user}">
										<c:if
											test="${empty allFollowsPr.list || fn:length(allFollowsPr.list)==0}">
											<div class="jumbotron" style="margin-left: -4rem;">
												<img src="<s:url value="/images/1.2.jpg" />"
													style="width: 100%;">
												<h3>你啥都没有关注!不如。。。</h3>
											</div>
										</c:if>
										<c:if test="${!empty allFollowsPr.list}">
											<c:forEach items="${allFollowsPr.list}" var="uallFollow">
												<c:set value="${uallFollow.userNum}" var="afun"></c:set>
												<li class="group-item"><span class="hidden" field="id"
													onlyread="true">${uallFollow.id}</span>

													<div class="group-item-header">
														<div class="">
															<a href="<s:url value="/fore/user/${uallFollow.id}" />"><img
																class="img-circle img-thumbnail"
																src="<c:if test="${empty uallFollow.headImg}">
                      <s:url value="/images/1.4.1.jpg" />
                    </c:if><c:if test="${!empty uallFollow.headImg}">
                      <s:url value="/${uallFollow.headImg}" />
                    </c:if>">
																<span class="name" field="name">${uallFollow.name}</span></a>
														</div>
													</div>
													<div class="group-item-footer btn-sm">
														<div class="group-item-op btn-group-sm">
															<button data-id="${uallFollow.id}"
																class="btn btn-default list-group-btn btn-success"
																grouptype="userfollow">关注</button>
														</div>
														<div class="group-item-info" data-toggle="tooltip"
															title="粉丝数、点击量、浏览量">
															<span class="iconfont icon-fensishu"></span> <span
																class="badge">${afun.fansNum}</span> <span
																class="glyphicon glyphicon-hand-up"></span> <span
																class="badge">${afun.clickNum}</span> <span
																class="glyphicon glyphicon-eye-open"></span> <span
																class="badge">${afun.viewNum}</span>
														</div>
													</div></li>
											</c:forEach>
										</c:if>
									</c:if>
									<!-- 其他用户 -->
									<c:if test="${!empty otherUser}">
										<c:if
											test="${empty allFollowsPr.list || fn:length(allFollowsPr.list)==0}">
											<div class="jumbotron" style="margin-left: -4rem;">
												<img src="<s:url value="/images/1.2.jpg" />"
													style="width: 100%;">
												<h3>该用户啥都没有关注!不如。。。</h3>
											</div>
										</c:if>
										<c:if test="${!empty allFollowsPr.list}">
											<c:forEach items="${allFollowsPr.list}" var="oallFollow">
												<c:set value="${oallFollow.userNum}" var="afun"></c:set>
												<li class="group-item"><span class="hidden" field="id"
													onlyread="true">${oallFollow.id}</span>
													<div class="group-item-header">
														<div class="">
															<a href="<s:url value="/fore/user/${oallFollow.id}" />"><img
																class="img-circle img-thumbnail"
																src="<c:if test="${empty oallFollow.headImg}">
                      <s:url value="/images/1.4.1.jpg" />
                    </c:if>
                    <c:if test="${!empty oallFollow.headImg}">
                      <s:url value="/${oallFollow.headImg}" />
                    </c:if>">
																<span class="name" field="name">${oallFollow.name}</span></a>
														</div>
													</div>
													<div class="group-item-footer btn-sm">
														<div class="group-item-op btn-group-sm">
															<button data-id="${oallFollow.id}"
																class="btn btn-default list-group-btn <c:if test="${fn:contains(followedIds,oallFollow.id)}">btn-success</c:if>"
																grouptype="userfollow">关注</button>
														</div>
														<div class="group-item-info" data-toggle="tooltip"
															title="粉丝数、点击量、浏览量">
															<span class="iconfont icon-fensishu"></span> <span
																class="badge">${afun.fansNum}</span> <span
																class="glyphicon glyphicon-hand-up"></span> <span
																class="badge">${afun.clickNum}</span> <span
																class="glyphicon glyphicon-eye-open"></span> <span
																class="badge">${afun.viewNum}</span>
														</div>
													</div></li>
											</c:forEach>
										</c:if>
									</c:if>
								</ul>
							</div>
						</div>
					</c:if>


					<c:if test="${!empty followsPr}">
						<!-- 指定组的用户关注 -->
						<div class="group-title">
							<div class="group-name" data-id="${followGroup.id}">
								<a href="" class="text-info lead" field="name">${followGroup.name}</a>·<span
									class="lead" field="visibility"><c:if
										test="${followGroup.visibility=='VISIBLE'}">显示</c:if> <c:if
										test="${followGroup.visibility=='HIDDEN'}">隐藏</c:if></span> <span
									class="hidden" field="id">${followGroup.id}</span> <span
									class="hidden" field="groupType">文章收藏</span>
							</div>
							<div class="btn-group btn-group-sm">
								<!-- 自身用户 -->
								<c:if test="${empty otherUser && !empty user}">
									<button data-id="${followGroup.id}"
										class="btn btn-default clear-invalid-btn">清除失效</button>
								</c:if>
								<!-- 其他用户 -->
								<c:if test="${!empty otherUser}">
									<!-- edit-group-btn -->
									<button class="btn btn-default">待定</button>
								</c:if>
							</div>
						</div>

						<div class="group-content">
							<div class="group-body">
								<ul class="group-ul">
									<c:if
										test="${empty followsPr.list || fn:length(followsPr.list)==0}">
										<div class="jumbotron" style="margin-left: -4rem;">
											<img src="<s:url value="/images/1.2.jpg" />"
												style="width: 100%;">
											<h3>
												<c:if test="${!empty otherUser}">这个用户</c:if>
												<c:if test="${empty otherUser && !empty user}">你</c:if>
												啥都没有关注!只是创建了用户关注分组，不如。。。
											</h3>
										</div>
									</c:if>
									<c:if test="${!empty followsPr.list}">
										<!-- 自身用户 -->
										<c:if test="${empty otherUser && !empty user}">
											<c:forEach items="${followsPr.list}" var="userFollow">
												<c:set value="${userFollow.user}" var="ufollow"></c:set>
												<c:set value="${ufollow.userNum}" var="ufun"></c:set>
												<li class="group-item"><span class="hidden" field="id"
													onlyread="true">${ufollow.id}</span>
													<div class="group-item-header">
														<div class="">
															<a href="<s:url value="/fore/user/${ufollow.id}" />"><img
																class="img-circle img-thumbnail"
																src="<c:if test="${empty ufollow.headImg}">
                      <s:url value="/images/1.4.1.jpg" />
                    </c:if>
                    <c:if test="${!empty ufollow.headImg}">
                      <s:url value="/${ufollow.headImg}" />
                    </c:if>">
																<span class="name" field="name">${ufollow.name}</span></a>
														</div>
													</div>
													<div class="group-item-footer btn-sm">
														<div class="group-item-op btn-group-sm">
															<button data-id="${ufollow.id}"
																class="btn btn-default list-group-btn btn-success"
																grouptype="userfollow">关注</button>
														</div>
														<div class="group-item-info" data-toggle="tooltip"
															title="粉丝数、点击量、浏览量">
															<span class="iconfont icon-fensishu"></span> <span
																class="badge">${ufun.fansNum}</span> <span
																class="glyphicon glyphicon-hand-up"></span> <span
																class="badge">${ufun.clickNum}</span> <span
																class="glyphicon glyphicon-eye-open"></span> <span
																class="badge">${ufun.viewNum}</span>
														</div>
													</div></li>
											</c:forEach>
										</c:if>
										<!-- 其他用户 -->
										<c:if test="${!empty otherUser}">
											<c:forEach items="${followsPr.list}" var="userFollow">
												<c:set value="${userFollow.user}" var="ofollow"></c:set>
												<c:set value="${ofollow.userNum}" var="ofun"></c:set>
												<li class="group-item"><span class="hidden" field="id"
													onlyread="true">${ofollow.id}</span>
													<div class="group-item-header">
														<div class="">
															<a href="<s:url value="/fore/user/${ofollow.id}" />"><img
																class="img-circle img-thumbnail"
																src="<c:if test="${empty ofollow.headImg}">
                      <s:url value="/images/1.4.1.jpg" />
                    </c:if>
                    <c:if test="${!empty ofollow.headImg}">
                      <s:url value="/${ofollow.headImg}" />
                    </c:if>">
																<span class="name" field="name">${ofollow.name}</span></a>
														</div>
													</div>
													<div class="group-item-footer btn-sm">
														<div class="group-item-op btn-group-sm">
															<button data-id="${ofollow.id}"
																class="btn btn-default list-group-btn <c:if test="${!empty user}"><c:if test="${fn:contains(followedIds,ofollow.id)}">btn-success</c:if></c:if>"
																grouptype="userfollow">关注</button>
														</div>
														<div class="group-item-info" data-toggle="tooltip"
															title="粉丝数、点击量、浏览量">
															<span class="iconfont icon-fensishu"></span> <span
																class="badge">${ofun.fansNum}</span> <span
																class="glyphicon glyphicon-hand-up"></span> <span
																class="badge">${ofun.clickNum}</span> <span
																class="glyphicon glyphicon-eye-open"></span> <span
																class="badge">${ofun.viewNum}</span>
														</div>
													</div></li>
											</c:forEach>
										</c:if>

									</c:if>
								</ul>
							</div>
						</div>
					</c:if>


					<c:if test="${!empty fansPr}">
						<!-- 全部的粉丝 -->
						<div class="group-title">
							<div class="group-name lead">全部的粉丝</div>
						</div>

						<div class="group-content">
							<div class="group-body">
								<ul class="group-ul">
									<c:if test="${empty fansPr.list || fn:length(fansPr.list)==0}">
										<c:if test="${empty otherUser && !empty user}">
											<div class="jumbotron" style="margin-left: -4rem;">
												<img src="<s:url value="/images/1.2.jpg" />"
													style="width: 100%;">
												<h3>你暂时还没有粉丝!不如。。。</h3>
												<button
													class="btn btn-primary write-article-btn center-block"
													articlestatu="article">编写文章</button>
											</div>
										</c:if>
										<c:if test="${!empty otherUser}">
											<div class="jumbotron" style="margin-left: -4rem;">
												<img src="<s:url value="/images/1.2.jpg" />"
													style="width: 100%;">
												<h3>这个用户没有粉丝!不如。。。</h3>
												<button class="btn btn-default btn-sm list-group-btn"
													data-id="${otherUser.id}" grouptype="userfollow">关注他</button>
											</div>
										</c:if>
									</c:if>
									<c:if test="${!empty fansPr.list}">
										<c:forEach items="${fansPr.list}" var="fans">
											<c:set value="${fans.userNum}" var="fun"></c:set>
											<li class="group-item"><span class="hidden" field="id"
												onlyread="true">${fans.id}</span>
												<div class="group-item-header">
													<div class="">
														<a href="<s:url value="/fore/user/${fans.id}" />"><img
															class="img-circle img-thumbnail"
															src="<c:if test="${empty fans.headImg}">
                      <s:url value="/images/1.4.1.jpg" />
                    </c:if>
                    <c:if test="${!empty fans.headImg}">
                      <s:url value="/${fans.headImg}" />
                    </c:if>">
															<span class="name" field="name">${fans.name}</span></a>
													</div>
												</div>
												<div class="group-item-footer btn-sm">
													<div class="group-item-op btn-group-sm">
														<button data-id="${fans.id}"
															class="btn btn-default list-group-btn <c:if test="${fn:contains(followedIds,fans.id)}">btn-success</c:if>"
															grouptype="userfollow">关注</button>
													</div>
													<div class="group-item-info" data-toggle="tooltip"
														title="粉丝数、点击量、浏览量">
														<span class="iconfont icon-fensishu"></span> <span
															class="badge">${fun.fansNum}</span> <span
															class="glyphicon glyphicon-hand-up"></span> <span
															class="badge">${fun.clickNum}</span> <span
															class="glyphicon glyphicon-eye-open"></span> <span
															class="badge">${fun.viewNum}</span>
													</div>
												</div></li>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</div>
					</c:if>

				</div>
			</div>
			<!-- 全部关注的用户 -->
			<c:if test="${!empty allFollowsPr}">
				<c:set value="${allFollowsPr}" var="pr"></c:set>
			</c:if>
			<!-- 关注的用户 -->
			<c:if test="${!empty followsPr}">
				<c:set value="${followsPr}" var="pr"></c:set>
			</c:if>
			<!-- 粉丝 -->
			<c:if test="${!empty fansPr}">
				<c:set value="${fansPr}" var="pr"></c:set>
			</c:if>

			<%@include file="../paging.jsp"%>
		</div>
	</div>
</div>
