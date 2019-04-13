<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>



<!-- 自身用户 -->
<c:if test="${empty otherUser && !empty user}">
	<c:set value="${user.userInfo}" var="ui"></c:set>
	<c:set value="${user.userNum}" var="un"></c:set>

	<div class="user-panel container-fluid center-block">
		<div class="row">
			<div class="col-xs-12 col-sm-5 col-md-3 col-md-offset-1">
				<!-- 用户面板-容器 -->
				<div class="container-panel">
					<div class="container-title lead">用户信息</div>
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

				</div>
			</div>

			<div class="col-xs-12 col-sm-7 col-md-7">
				<!-- 文章 -->
				<div class="container-panel">
					<div class="container-title lead">
						<a href="<s:url value="/fore/user/${user.id}/articles" />"
							class="text-muted">文章</a>
					</div>
					<ul id="article-status-tab" class="bottom-slider">
						<li class="active"><a href="#article-list" data-toggle="tab">
								<span class="glyphicon glyphicon-list-alt"></span>&nbsp;文章箱
						</a></li>
						<li><a href="#draft-list" data-toggle="tab"> <span
								class="glyphicon glyphicon-inbox"></span>&nbsp;草稿箱
						</a></li>
						<li><a href="#trash-list" data-toggle="tab"> <span
								class="glyphicon glyphicon-trash"></span>&nbsp;垃圾箱
						</a></li>
						<div class="content-bottom">
							<span class="content-bottom-slider"></span>
						</div>
					</ul>

					<div class="tab-content">
						<div class="tab-pane fade in well active" id="article-list">
							<div class="article-list-container">
								<div class="article-op">
									<a href="<s:url value="/fore/user/${user.id}/articles" />"
										class="btn text-muted" target="_blank"><button
											class="btn btn-sm btn-default">
											更多<span class="glyphicon glyphicon-chevron-right"></span>
										</button></a>
								</div>
								<ul class="article-ul">
									<c:if test="${empty articles || fn:length(articles)==0}">
										<div class="jumbotron" style="margin-left: -4rem;">
											<img src="<s:url value="/images/1.2.jpg" />"
												style="width: 100%;">
											<h2>啥都没有!你太懒了，不如。。。</h2>
											<button
												class="btn btn-primary write-article-btn center-block"
												articlestatu="article">编写文章</button>
										</div>
									</c:if>
									<c:if test="${!empty articles}">
										<c:forEach items="${articles}" var="article">
											<li class="article-item"><span class="hidden" field="id"
												onlyread="true">${article.id}</span>
												<div class="article-item-header">
													<span class="cid" field="cid">${article.category.name}</span>
													<span class="createDate">${article.createDate}</span> <span
														class="updateDate">${article.updateDate}</span>
												</div>
												<div class="article-item-body">
													<a
														href="<s:url value="/foreshowArticle?aid=${article.id}" />"
														target="_blank"><span class="title" field="title">${article.title}</span></a>
													<span class="subTitle" field="subTitle">${article.subTitle}</span>
												</div>
												<div class="article-item-footer">
													<div class="article-item-op btn-group-sm">
														<button data-href="foreeditArticle?aid=${article.id}"
															class="btn btn-default edit-article-link">编辑</button>
														<button data-id="${article.id}"
															grouptype="articlefavority"
															class="btn btn-default list-group-btn <c:if test="${fn:contains(collectedIds,article.id)}">btn-success</c:if>">收藏</button>
														<div class="dropdown">
															<button class="btn btn-default btn-sm dropdown-toggle"
																type="button" id="change-${article.id}-statu"
																data-toggle="dropdown">
																转到 <span class="caret"></span>
															</button>
															<ul class="dropdown-menu" role="menu"
																aria-labelledby="change-${article.id}-statu">
																<li role="presentation"><a role="menuitem"
																	tabindex="-1"
																	data-href="forechangeToDrafts?aid=${article.id}"
																	class="change-articlestatu-link" articlestatu="trash">转到草稿箱</a></li>
																<li role="presentation"><a role="menuitem"
																	tabindex="-1"
																	data-href="forechangeToDustbin?aid=${article.id}"
																	class="change-articlestatu-link" articlestatu="trash">转到垃圾箱</a></li>
															</ul>
														</div>
													</div>
													<div class="group-item-info" data-toggle="tooltip"
														title="收藏量、点击量、浏览量">
														<span class="glyphicon glyphicon-star-empty"></span> <span
															class="badge">${article.collectNum}</span> <span
															class="iconfont icon-dianji"></span> <span class="badge">${article.clickNum}</span>
														<span class="glyphicon glyphicon-eye-open"></span> <span
															class="badge">${article.viewNum}</span>
													</div>
												</div></li>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="tab-pane fade in well" id="draft-list">
							<div class="draft-list-container">
								<div class="article-op">
									<a
										href="<s:url value="/fore/user/${user.id}/articles/drafts" />"
										class="btn text-muted" target="_blank"><button
											class="btn btn-sm btn-default">
											更多<span class="glyphicon glyphicon-chevron-right"></span>
										</button></a>
								</div>
								<ul class="article-ul">
									<c:if test="${empty drafts || fn:length(drafts)==0}">
										<div class="jumbotron" style="margin-left: -4rem;">
											<img src="<s:url value="/images/1.2.jpg" />"
												style="width: 100%;">
											<h3>啥都没有!你太懒了，不如。。。</h3>
											<button
												class="btn btn-primary write-article-btn center-block"
												articlestatu="draft">编写草稿</button>
										</div>
									</c:if>

									<c:if test="${!empty drafts}">
										<c:forEach items="${drafts}" var="draft">
											<li class="article-item"><span class="hidden" field="id"
												onlyread="true">${draft.id}</span>
												<div class="article-item-header">
													<span class="cid" field="cid">${draft.category.name}</span>
													<span class="createDate">${draft.createDate}</span> <span
														class="updateDate">${draft.updateDate}</span>
												</div>
												<div class="article-item-body">
													<a
														href="<s:url value="/foreshowArticle?aid=${draft.id}" />"
														target="_blank"><span class="title" field="title">${draft.title}</span></a>
													<span class="subTitle" field="subTitle">${draft.subTitle}</span>
												</div>
												<div class="article-item-footer">
													<div class="article-item-op btn-group-sm">
														<button data-href="foreeditArticle?aid=${draft.id}"
															class="btn btn-default edit-article-link">编辑</button>
														<button data-id="${draft.id}" grouptype="articlefavority"
															class="btn btn-default list-group-btn <c:if test="${fn:contains(collectedIds,draft.id)}">btn-success</c:if>">收藏</button>
														<div class="dropdown">
															<button class="btn btn-default btn-sm dropdown-toggle"
																type="button" id="change-${draft.id}-statu"
																data-toggle="dropdown">
																转到 <span class="caret"></span>
															</button>
															<ul class="dropdown-menu" role="menu"
																aria-labelledby="change-${draft.id}-statu">
																<li role="presentation"><a role="menuitem"
																	tabindex="-1"
																	data-href="forechangeToArticle?aid=${draft.id}"
																	class="change-articlestatu-link" articlestatu="article">转到文章箱</a></li>
																<li role="presentation"><a role="menuitem"
																	tabindex="-1"
																	data-href="forechangeToDustbin?aid=${article.id}"
																	class="change-articlestatu-link" articlestatu="trash">转到垃圾箱</a></li>
															</ul>
														</div>
													</div>
													<div class="group-item-info" data-toggle="tooltip"
														title="收藏量、点击量、浏览量">
														<span class="glyphicon glyphicon-star-empty"></span> <span
															class="badge">${draft.collectNum}</span> <span
															class="iconfont icon-dianji"></span> <span class="badge">${draft.clickNum}</span>
														<span class="glyphicon glyphicon-eye-open"></span> <span
															class="badge">${draft.viewNum}</span>
													</div>
												</div></li>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</div>

						<div class="tab-pane fade in well" id="trash-list">
							<div class="trash-list-container">
								<div class="article-op">
									<a
										href="<s:url value="/fore/user/${user.id}/articles/dustbin" />"
										class="btn text-muted" target="_blank"><button
											class="btn btn-sm btn-default">
											更多<span class="glyphicon glyphicon-chevron-right"></span>
										</button></a>
								</div>
								<ul class="article-ul">
									<c:if test="${!empty dustbin}">
										<c:forEach items="${dustbin}" var="trash">
											<li class="article-item"><span class="hidden" field="id"
												onlyread="true">${trash.id}</span>
												<div class="article-item-header">
													<span class="cid" field="cid">${trash.category.name}</span>
													<span class="createDate">${trash.createDate}</span> <span
														class="updateDate">${trash.updateDate}</span>
												</div>
												<div class="article-item-body">
													<a
														href="<s:url value="/foreshowArticle?aid=${trash.id}" />"
														target="_blank"><span class="title" field="title">${trash.title}</span></a>
													<span class="subTitle" field="subTitle">${trash.subTitle}</span>
												</div>
												<div class="article-item-footer">
													<div class="article-item-op btn-group-sm">
														<button data-id="${trash.id}"
															class="btn btn-default btn-danger delete-article-btn">彻底删除</button>
														<div class="dropdown">
															<button class="btn btn-default btn-sm dropdown-toggle"
																type="button" id="change-${trash.id}-statu"
																data-toggle="dropdown">
																转到 <span class="caret"></span>
															</button>
															<ul class="dropdown-menu" role="menu"
																aria-labelledby="change-${trash.id}-statu">
																<li role="presentation"><a role="menuitem"
																	tabindex="-1"
																	data-href="forechangeToArticle?aid=${trash.id}"
																	class="change-articlestatu-link" articlestatu="article">转到文章箱</a></li>
																<li role="presentation"><a role="menuitem"
																	tabindex="-1"
																	data-href="forechangeToDrafts?aid=${article.id}"
																	class="change-articlestatu-link" articlestatu="trash">转到草稿箱</a></li>
															</ul>
														</div>
													</div>
													<div class="group-item-info" data-toggle="tooltip"
														title="收藏量、点击量、浏览量">
														<span class="glyphicon glyphicon-star-empty"></span> <span
															class="badge">${trash.collectNum}</span> <span
															class="iconfont icon-dianji"></span> <span class="badge">${trash.clickNum}</span>
														<span class="glyphicon glyphicon-eye-open"></span> <span
															class="badge">${trash.viewNum}</span>
													</div>
												</div></li>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>


				<!-- 文章收藏 -->
				<div class="container-panel">
					<div class="container-title lead">
						<a
							href="<s:url value="/fore/user/${user.id}/articleFavorities" />"
							class="text-muted"><span class="lead">文章收藏</span></a>&nbsp;
						<button class="btn btn-sm btn-default add-group-btn"
							grouptype="articlefavority">
							<span class="glyphicon glyphicon-plus"></span>新建
						</button>
						<button class="btn btn-sm btn-default clear-all-group-btn">清除全部失效</button>
					</div>

					<!-- 容器-组 -->
					<c:forEach items="${allGroups}" var="ag">
						<div class="container-group">
							<div class="group-title">
								<div class="group-name">
									<a
										href="<s:url value="/fore/user/${user.id}/articleFavorities/${ag.id}" />"
										class="text-info lead" field="name" target="_blank">${ag.name}</a>·
									<c:if test="${ag.visibility=='VISIBLE'}">
										<span class="glyphicon glyphicon-eye-open"></span>
										<span field="visibility" class="lead">显示</span>
									</c:if>
									<c:if test="${ag.visibility=='HIDDEN'}">
										<span class="glyphicon glyphicon-eye-close"></span>
										<span field="visibility" class="lead">隐藏</span>
									</c:if>
									<span class="hidden" field="id">${ag.id}</span> <span
										class="hidden" field="groupType">文章收藏</span>
								</div>
								<div class="group-title-op">
									<button data-id="${ag.id}"
										class="btn btn-danger btn-sm clear-dgst-group-btn">清除组内失效</button>
									<a
										href="<s:url value="/fore/user/${user.id}/articleFavorities/${ag.id}" />"
										class="text-muted" target="_blank"><button
											class="btn btn-default btn-sm">
											更多<span class="glyphicon glyphicon-chevron-right"></span>
										</button></a>
								</div>
							</div>
							<div class="group-content">
								<div class="group-body">
									<ul class="article-ul">
										<c:if
											test="${empty ag.articleFavorities || fn:length(ag.articleFavorities)==0}">
											<div class="jumbotron" style="margin-left: -4rem;">
												<img src="<s:url value="/images/1.2.jpg" />"
													style="width: 100%;">
												<h3>你啥都没有收藏!不如。。。</h3>
											</div>
										</c:if>

										<c:if
											test="${!empty ag.articleFavorities || fn:length(ag.articleFavorities)!=0}">
											<c:forEach items="${ag.articleFavorities}" var="gaf">
												<!-- 失效文章 -->
												<c:if test="${empty gaf.article}">
													<li class="article-item"><span class="hidden"
														field="id" onlyread="true">${gaf.id}</span>
														<div class="article-item-body">对不起！该收藏文章失效</div>
														<div class="article-item-footer">
															<div class="article-item-op btn-group-sm">
																<button data-id="${gaf.id}"
																	class="btn btn-default clear-af-btn"
																	grouptype="articlefavority">清除</button>
															</div>
														</div></li>
												</c:if>
												<!-- 生效文章【收藏】 -->
												<c:if test="${!empty gaf.article}">
													<li class="article-item"><span class="hidden"
														field="id" onlyread="true">${gaf.article.id}</span>
														<div class="article-item-header">
															<span class="cid" field="cid">${gaf.article.category.name}</span>
															<span class="createDate">${gaf.article.createDate}</span>
															<span class="updateDate">${gaf.article.updateDate}</span>
														</div>
														<div class="article-item-body">
															<a
																href="<s:url value="/foreshowArticle?aid=${gaf.article.id}" />"><span
																class="title" field="title" target="_blank">${gaf.article.title}</span></a>
															<span class="subTitle" field="subTitle">${gaf.article.subTitle}</span>
															<a href="<s:url value="/fore/user/${gaf.author.id}" />"
																target="_blank"><span
																class="glyphicon glyphicon-user"></span>${gaf.author.name}</a>
														</div>
														<div class="article-item-footer">
															<div class="article-item-op btn-group-sm">
																<button data-id="${gaf.article.id}"
																	class="btn btn-default list-group-btn <c:if test="${fn:contains(collectedIds,gaf.article.id)}">btn-success</c:if>"
																	grouptype="articlefavority">收藏</button>
															</div>

															<div class="group-item-info" data-toggle="tooltip"
																title="收藏量、点击量、浏览量">
																<span class="glyphicon glyphicon-star-empty"></span> <span
																	class="badge">${gaf.article.collectNum}</span> <span
																	class="iconfont icon-dianji"></span> <span
																	class="badge">${gaf.article.clickNum}</span> <span
																	class="glyphicon glyphicon-eye-open"></span> <span
																	class="badge">${gaf.article.viewNum}</span>
															</div>
														</div></li>

												</c:if>

											</c:forEach>
										</c:if>

									</ul>
								</div>
								<div class="group-footer"></div>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</div>
	</div>

</c:if>




<!-- 其他用户 -->
<c:if test="${!empty otherUser}">
	<c:set value="${otherUser.userInfo}" var="oui"></c:set>
	<c:set value="${otherUser.userNum}" var="oun"></c:set>

	<div class="user-panel container-fluid center-block">
		<div class="row">
			<div class="col-xs-12 col-sm-5 col-md-3 col-md-offset-1">
				<!-- 容器-面板 -->
				<div class="container-panel">
					<div class="container-title lead">用户信息</div>
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

						<!-- 用户-操作-面板 自身用户-面板 -->
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
									<a href="<s:url value="/fore/user/${otherUser.id}/articles" />"
										target="_blank">文章箱<span class="badge">${oun.articleNum}</span></a>
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
				</div>
			</div>
			<div class="col-xs-12 col-sm-7 col-md-7 ">
				<!-- 文章 -->
				<div class="container-panel">
					<div class="container-title lead">
						<a href="<s:url value="/fore/user/${otherUser.id}/articles" />"
							class="text-muted">文章</a>
					</div>
					<ul id="article-status-tab" class="bottom-slider">
						<li class="active"><a href="#article-list" data-toggle="tab">
								<span class="glyphicon glyphicon-list-alt"></span>&nbsp;文章箱
						</a></li>
						<!-- 内容底部 -->
						<div class="content-bottom">
							<!-- 内容底部的滑块 -->
							<span class="content-bottom-slider"></span>
						</div>
					</ul>
					<!-- <s:url value="/forearticle?articleStatu=drafts" /> -->
					<%-- fore/user/${user.id}/articles/{articles|dustbin|drafts} --%>
					<div class="tab-content">
						<div class="tab-pane fade in well active" id="article-list">
							<div class="article-list-container">
								<div class="article-op">
									<a href="<s:url value="/fore/user/${otherUser.id}/articles" />"
										class="btn text-muted" targer="_blank"><button
											class="btn btn-sm btn-default">
											更多<span class="glyphicon glyphicon-chevron-right"></span>
										</button></a>
								</div>
								<ul class="article-ul">
									<c:if test="${empty articles || fn:length(articles)==0}">
										<div class="jumbotron" style="margin-left: -4rem;">
											<img src="<s:url value="/images/1.2.jpg" />"
												style="width: 100%;">
											<h2>啥都没有!这个用户太懒了，不如。。。</h2>
											<button
												class="btn btn-primary write-article-btn center-block"
												articlestatu="article">编写文章</button>
										</div>
									</c:if>

									<c:if test="${!empty articles}">
										<c:forEach items="${articles}" var="article">
											<li class="article-item"><span class="hidden" field="id"
												onlyread="true">${article.id}</span>
												<div class="article-item-header">
													<span class="cid" field="cid">${article.category.name}</span>
													<span class="createDate">${article.createDate}</span> <span
														class="updateDate">${article.updateDate}</span>
												</div>
												<div class="article-item-body">
													<a
														href="<s:url value="/foreshowArticle?aid=${article.id}" />"><span
														class="title" field="title">${article.title}</span></a> <span
														class="subTitle" field="subTitle">${article.subTitle}</span>
												</div>
												<div class="article-item-footer">
													<div class="article-item-op btn-group-sm">
														<button data-id="${article.id}"
															grouptype="articlefavority"
															class="btn btn-default list-group-btn <c:if test="${fn:contains(collectedIds,article.id)}">btn-success</c:if>">收藏</button>
													</div>
													<div class="group-item-info" data-toggle="tooltip"
														title="收藏量、点击量、浏览量">
														<span class="glyphicon glyphicon-star-empty"></span> <span
															class="badge">${article.collectNum}</span> <span
															class="iconfont icon-dianji"></span> <span class="badge">${article.clickNum}</span>
														<span class="glyphicon glyphicon-eye-open"></span> <span
															class="badge">${article.viewNum}</span>
													</div>
												</div></li>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- 文章收藏 -->
				<div class="container-panel">
					<div class="container-title lead">
						<a href="<s:url value="/fore/user/${otherUser.id}/articles" />"
							class="text-muted"><span class="lead">文章收藏</span></a>
					</div>

					<c:forEach items="${visibleGroups}" var="vg">
						<!-- 容器-组 -->
						<div class="container-group">
							<div class="group-title">
								<div class="group-name lead">
									<a
										href="<s:url value="/fore/user/${otherUser.id}/articleFavorities/${vg.id}" />"
										class="text-info lead" field="name">${vg.name}</a>·
									<c:if test="${vg.visibility=='VISIBLE'}">
										<span field="visibility" class="lead">显示</span>
									</c:if>
									<c:if test="${vg.visibility=='HIDDEN'}">
										<span field="visibility" class="lead">隐藏</span>
									</c:if>
									<span class="hidden" field="id">${vg.id}</span> <span
										class="hidden" field="groupType">文章收藏</span>
								</div>
								<div class="group-title-op">
									<!-- [其他：直接收藏整个组] -->
									<button class="btn btn-danger btn-sm">待定</button>
									<a
										href="<s:url value="/fore/user/${otherUser.id}/articleFavorities/${vg.id}" />"
										class="text-muted"><button class="btn btn-default btn-sm">
											更多<span class="glyphicon glyphicon-chevron-right"></span>
										</button></a>
								</div>
							</div>

							<div class="group-content">
								<div class="group-body">
									<ul class="article-ul">
										<c:if
											test="${empty vg.articleFavorities || fn:length(vg.articleFavorities)==0}">
											<div class="jumbotron" style="margin-left: -4rem;">
												<img src="<s:url value="/images/1.2.jpg" />"
													style="width: 100%;">
												<h3>这个用户啥都没有收藏!不如。。。</h3>
											</div>
										</c:if>
										<c:if test="${!empty vg.articleFavorities}">
											<c:forEach items="${vg.articleFavorities}" var="vaf">
												<!-- 失效文章 -->
												<c:if test="${empty vaf.article}">
													<li class="article-item"><span class="hidden"
														field="id" onlyread="true">${vaf.article.id}</span>
														<div class="article-item-body">对不起！该收藏文章失效</div></li>
												</c:if>

												<!-- 生效文章【收藏】 -->
												<c:if test="${!empty vaf.article}">
													<li class="article-item"><span class="hidden"
														field="id" onlyread="true">${vaf.article.id}</span>
														<div class="article-item-header">
															<span class="cid" field="cid">${vaf.article.category.name}</span>
															<span class="createDate">${vaf.article.createDate}</span>
															<span class="updateDate">${vaf.article.updateDate}</span>
														</div>
														<div class="article-item-body">
															<a
																href="<s:url value="/foreshowArticle?aid=${vaf.article.id}" />"><span
																class="title" field="title">${vaf.article.title}</span></a>
															<span class="subTitle" field="subTitle">${vaf.article.subTitle}</span>
															<a href="<s:url value="/fore/user/${vaf.author.id}" />"><span
																class="glyphicon glyphicon-user"></span>${vaf.author.name}</a>
														</div>
														<div class="article-item-footer">
															<div class="article-item-op btn-group-sm">
																<button data-id="${vaf.article.id}"
																	class="btn btn-default list-group-btn <c:if test="${fn:contains(collectedIds,vaf.article.id)}">btn-success</c:if>"
																	grouptype="articlefavority">收藏</button>
															</div>
															<div class="group-item-info" data-toggle="tooltip"
																title="收藏量、点击量、浏览量">
																<span class="glyphicon glyphicon-star-empty"></span> <span
																	class="badge">${vaf.article.collectNum}</span> <span
																	class="iconfont icon-dianji"></span> <span
																	class="badge">${vaf.article.clickNum}</span> <span
																	class="glyphicon glyphicon-eye-open"></span> <span
																	class="badge">${vaf.article.viewNum}</span>
															</div>
														</div></li>
												</c:if>

											</c:forEach>
										</c:if>

									</ul>

								</div>
								<div class="group-footer"></div>
							</div>

						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</c:if>







