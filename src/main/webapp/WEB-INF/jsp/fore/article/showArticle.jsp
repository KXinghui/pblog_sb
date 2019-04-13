<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../include/forePage/header.jsp"%>
<title>ShowArticle</title>

<%@include file="../../include/forePage/browserIcon.jsp"%>

<%@include file="../../include/forePage/linker.jsp"%>


<%@include file="../../include/forePage/top.jsp"%>
<div id="top-nav-part"></div>
<%@include file="../../include/forePage/userNav.jsp"%>

<%@include file="../../include/forePage/article/showArticlePage.jsp"%>


<%@include file="../../include/forePage/asideBottom.jsp"%>

<%@include file="../../include/forePage/footer.jsp"%>


<script src="<s:url value="/editormd/lib/marked.min.js"/>"></script>
<script src="<s:url value="/editormd/lib/prettify.min.js"/>"></script>
<script src="<s:url value="/editormd/lib/raphael.min.js"/>"></script>
<script src="<s:url value="/editormd/lib/underscore.min.js"/>"></script>
<script src="<s:url value="/editormd/lib/sequence-diagram.min.js"/>"></script>
<script src="<s:url value="/editormd/lib/flowchart.min.js"/>"></script>
<script src="<s:url value="/editormd/lib/jquery.flowchart.min.js"/>"></script>

<script src="<s:url value="/editormd/editormd.js"/>"></script>
<script type="text/javascript">
	$(function() {
		var showArticlMarkdown, showArticleHtml;
		var md = $("#show-articlehtml textarea").val();
		showArticleHtml = editormd.markdownToHTML("show-articlehtml", {
			htmlDecode : "style,script,iframe", // you can filter tags decode
			emoji : true,
			taskList : true,
			tocContainer : "#article-nav",
			tex : true, // 默认不解析
			flowChart : true, // 默认不解析
			sequenceDiagram : true, // 默认不解析
		});

		$(".article-nav-btn").mouseenter(function() {
			console.log("fdfd")
			$("#article-nav").text("").slideDown();
			showArticleHtml.config({
				tocContainer : "#article-nav",
				tocDropdown : false
			});
		});
		$("#article-nav").click(function(e) {
			$(this).slideUp();
		});
	});
</script>
</body>
</html>
