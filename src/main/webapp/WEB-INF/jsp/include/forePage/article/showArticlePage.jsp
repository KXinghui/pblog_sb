<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>



<div class="user-panel container-fluid">
	<!-- 悬浮菜单图标 拖拽部件 -->
	<span class="open-suspend-menu suspend-menu-icon drag-part visible-xs">用户</span>
	<div class="row">

		<div class="col-xs-11 col-sm-4 col-md-3 ">
			<!-- 悬浮-菜单 -->
			<div class="suspend-menu">
				<!-- 悬浮-菜单-按钮组 -->
				<div class="suspend-menu-btn-group clearfix">
					<span
						class="close-suspend-menu glyphicon glyphicon-remove pull-right visible-xs"></span>
				</div>
				<!-- 用户面板 -->

				<!-- 自身用户 -->
				<c:if test="${empty otherUser && !empty user}">
					<c:set value="${user.userInfo}" var="ui"></c:set>
					<c:set value="${user.userNum}" var="un"></c:set>
					<div class="user-panel-container">
						<!-- 用户-头像 -->
						<img id="user-panel-headimg"
							src="<c:if test="${empty ui.headImg}">
                      <s:url value="/images/1.4.1.jpg" />
                    </c:if>
                    <c:if test="${!empty ui.headImg}">
                      <s:url value="/${ui.headImg}" />
                    </c:if>"
							class="img-responsive img-circle" alt="头像">
						<!-- 用户-操作-面板 自身用户-面板 -->
						<div class="user-op-panel ownuser-panel">
							<div class="user-title">
								<span>${user.name}</span>
							</div>
							<!-- 用户文章信息-容器 -->
							<div class="userarticle-container">
								<!-- 总文章数、总点击数、总浏览数 -->
								<div data-toggle="tooltip" title="总文章数">
									<span class="glyphicon glyphicon-list-alt"></span> <span
										class="badge">${un.articleNum}</span>
								</div>
								<div data-toggle="tooltip" title="总点击数">
									<span class="iconfont icon-dianji"></span> <span class="badge">${un.clickNum}</span>
								</div>
								<div data-toggle="tooltip" title="总浏览数">
									<span class="glyphicon glyphicon-eye-open"></span> <span
										class="badge">${un.viewNum}</span>
								</div>
							</div>
							<!-- 用户操作列表-容器 -->
							<div class="userop-list-container">
								<!-- 文章状态 -->
								<div class="article-status">
									<a
										href="<s:url value="/fore/user/${user.id}/articles/drafts" />"
										targer="_blank">草稿箱<span class="badge">${un.draftsNum}</span></a>
									<a href="<s:url value="/fore/user/${user.id}/articles" />"
										targer="_blank">文章箱<span class="badge">${un.articleNum}</span></a>
									<a
										href="<s:url value="/fore/user/${user.id}/articles/dustbin" />"
										targer="_blank">垃圾箱<span class="badge">${un.dustbinNum}</span></a>
								</div>
							</div>
							<!-- 尾部信息-容器 -->
							<div class="footer-container btn-group-sm">
								<!-- <button class="btn btn-default list-group-btn"
            grouptype="userfollow">关注</button> -->
							</div>
						</div>
						<!-- 用户-面板 展开 -->
						<span class="op-user-panel open glyphicon glyphicon-eject"
							title="点击展开"></span>
					</div>
				</c:if>
				<!-- 其他用户 -->
				<c:if test="${!empty otherUser}">
					<c:set value="${otherUser.userInfo}" var="oui"></c:set>
					<c:set value="${otherUser.userNum}" var="oun"></c:set>
					<!-- 用户面板-容器 -->
					<div class="user-panel-container">
						<!-- 用户-头像 -->
						<img id="user-panel-headimg"
							src="<c:if test="${empty oui.headImg}">
          <s:url value="/images/1.4.1.jpg" />
        </c:if>
        <c:if test="${!empty oui.headImg}">
          <s:url value="/${oui.headImg}" />
        </c:if>"
							class="img-responsive img-circle" alt="头像">

						<div class="user-op-panel otheruser-panel">
							<div class="user-title">
								<span>${otherUser.name}</span>
							</div>
							<!-- 用户信息-容器 -->
							<div class="userinfo-container">
								<table class="table table-condensed table-hover">
									<tbody>
										<tr>
											<th>uid</th>
											<td>${otherUser.id}</td>
										</tr>
										<tr>
											<th><span class="glyphicon glyphicon-user"></span>真实姓名</th>
											<td>${oui.realName}</td>
										</tr>
										<tr>
											<th><span class="iconfont icon-xingbienan"></span>性别</th>
											<td><c:if test="${oui.gender=='MALE'}">男</c:if> <c:if
													test="${oui.gender=='FEMALE'}">女</c:if></td>
										</tr>
										<tr>
											<th><span class="glyphicon glyphicon-phone"></span>手机</th>
											<td>${oui.mobile}</td>
										</tr>
										<tr>
											<th><span class="glyphicon glyphicon-send"></span>邮箱</th>
											<td>${oui.email}</td>
										</tr>
										<tr>
											<th><span class="glyphicon glyphicon-map-marker"></span>地址</th>
											<td>${oui.address}</td>
										</tr>
										<tr>
											<th><span class="glyphicon glyphicon-calendar"></span>生日</th>
											<td>${oui.birthday}</td>
										</tr>
									</tbody>

								</table>
							</div>
							<!-- 用户文章信息-容器 -->
							<div class="userarticle-container">
								<!-- 总文章数、总点击数、总浏览数 -->
								<div data-toggle="tooltip" title="总文章数">
									<span class="glyphicon glyphicon-list-alt"></span> <span
										class="badge">${oun.articleNum}</span>
								</div>
								<div data-toggle="tooltip" title="总点击数">
									<span class="iconfont icon-dianji"></span> <span class="badge">${oun.clickNum}</span>
								</div>
								<div data-toggle="tooltip" title="总浏览数">
									<span class="glyphicon glyphicon-eye-open"></span> <span
										class="badge">${oun.viewNum}</span>
								</div>
							</div>

							<!-- 用户操作列表-容器 -->
							<div class="userop-list-container">
								<!-- 文章状态 -->
								<div class="article-status">
									<a href="<s:url value="/fore/user/${otherUser.id}/articles" />">文章箱<span
										class="badge">${oun.articleNum}</span></a>
								</div>
							</div>
							<!-- 尾部信息-容器 -->
							<div class="footer-container btn-group-sm">
								<button data-id="${otherUser.id}"
									class="btn btn-default list-group-btn <c:if test="${!empty isFollow && isFollow==true}">btn-success</c:if>"
									grouptype="userfollow">关注</button>
							</div>
						</div>
						<!-- 用户-面板 展开 -->
						<span class="op-user-panel open glyphicon glyphicon-eject"
							title="点击展开"></span>
					</div>
				</c:if>
			</div>
		</div>

		<div class="col-xs-12 col-sm-8 col-md-9 ">
			<div class="show-article">
				<!-- 展示文章信息 -->
				<div class="show-article-info">
					<div class="icon-info" title="分类">
						<span class="glyphicon glyphicon-th-large"></span> <span
							class="info">${article.category.name}</span>
					</div>
					<div class="icon-info" title="标题">
						<span class="iconfont icon-biaoti"></span> <span class="info">${article.title}</span>
					</div>
					<div class="icon-info hidden-xs" title="创建时间">
						<span class="text">创建时间</span> <span class="info">${article.createDate}</span>
					</div>
					<div class="icon-info hidden-xs" title="更新时间">
						<span class="text">更新时间</span> <span class="info">${article.updateDate}</span>
					</div>
				</div>
			</div>
			<div id="layout">
				<!-- <div id="show-articlmarkdown">
          <textarea style="display: none;"></textarea>
        </div> -->
				<div id="show-articlehtml">
					<c:set value="${article.articleContent.mdContent}" var="mdContent"></c:set>
					<textarea style="display: none;"><c:if
							test="${empty mdContent || fn:length(mdContent)==0}">欢迎使用个人博客。没有文章</c:if><c:if
							test="${!empty mdContent}">${mdContent}</c:if>
          </textarea>
				</div>
			</div>
			<div class="article-footer">
				<div class="article-footer-op">
					<button data-id="${article.id}"
						class="btn btn-default btn-sm list-group-btn <c:if test="${!empty isCollect && isCollect==true}">btn-success</c:if>"
						grouptype="articlefavority">收藏</button>
				</div>
				<div class="article-footer-info"></div>

				<div class="icon-info" title="更新时间">
					<span class="text"> <span
						class="glyphicon glyphicon-star-empty"></span> <span
						class="iconfont icon-dianji"></span> <span
						class="glyphicon glyphicon-eye-open"></span>
					</span> <span class="info"><span class="badge">${article.collectNum}</span>
						<span class="badge">${article.clickNum}</span> <span class="badge">${article.viewNum}</span></span>
				</div>
			</div>
			<div class="similar-article">
				<div class="container-group">
					<div class="group-title">
						<div class="group-name lead">类似文章</div>
					</div>
					<div class="group-content">
						<div class="group-body">
							<ul class="group-ul">
								<c:if
									test="${empty similarArticles || fn:length(similarArticles)==0}">
									<div class="jumbotron" style="margin-left: -4rem;">
										<img src="<s:url value="/images/1.2.jpg" />"
											style="width: 100%;">
										<h3>暂时没有类似文章</h3>
									</div>
								</c:if>
								<c:if
									test="${!empty similarArticles || fn:length(similarArticles)!=0}">
									<c:forEach items="${similarArticles}" var="sArticle">
										<!-- 文章收藏 -->
										<li class="group-item"><span class="hidden" field="id"
											onlyread="true">${sArticle.id}</span>
											<div class="group-item-header">
												<span class="cid" field="cid">${sArticle.category.name}</span>
												<span class="createDate hidden-xs">${sArticle.createDate}</span>
												<span class="updateDate hidden-xs">${sArticle.updateDate}</span>
											</div>
											<div class="group-item-body">
												<a href="foreshowArticle?aid=${sArticle.id}"><span
													class="title" field="title">${sArticle.title}</span></a> <span
													class="subTitle" field="subTitle">${sArticle.subTitle}</span>
												<a href="fore/user/${sArticle.user.id}"><span
													class="glyphicon glyphicon-user"></span>${sArticle.user.name}</a>
											</div>
											<div class="group-item-footer btn-sm">
												<div class="group-item-op btn-group-sm">
													<%-- <button data-id="${sArticle.id}"
                            class="btn btn-default list-group-btn <c:if test="${!empty user}">
                        <c:if test="${!empty isCollect && isCollect==true}">btn-success</c:if>
                        </c:if>"
                            grouptype="articlefavority">收藏</button> --%>
												</div>
												<div class="group-item-info" data-toggle="tooltip"
													title="收藏量、点击量、浏览量">
													<span class="glyphicon glyphicon-star-empty"></span> <span
														class="badge">${sArticle.collectNum}</span> <span
														class="iconfont icon-dianji"></span> <span class="badge">${sArticle.clickNum}</span>
													<span class="glyphicon glyphicon-eye-open"></span> <span
														class="badge">${sArticle.viewNum}</span>
												</div>
											</div></li>

									</c:forEach>
								</c:if>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>


