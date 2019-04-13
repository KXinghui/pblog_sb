<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="modal.jsp"%>

<div class="mask close-suspend-menu close-side-menu"></div>
<div class="tip-dialog col-xs-12 col-sm-3 col-md-2"></div>

<!-- <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script> -->
<!-- <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script> -->

<script src="<s:url value="/scripts/jquery-3.3.1.js" />"
	type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
	var contextPath = "${contextPath}";
	console.log(contextPath);
	var showArticleMarkdown;

	$(function() {
		var md = $("#showArticlMarkdown textarea").val();

		/* if (md)
				return; */
		showArticleMarkdown = editormd("show-articlmarkdown", {
			width : "100%",
			path : contextPath + "/editormd/lib/",
			tocStartLevel : 2,
			height : 740,
			theme : "dark",
			previewTheme : "dark",
			editorTheme : "pastel-on-dark",
			markdown : md,
			codeFold : true,
			syncScrolling : true,
			saveHTMLToTextarea : true,
			tocm : true,
			imageUpload : true,
			imageFormats : [ "jpg", "jpeg", "gif", "png", "bmp", "webp", "JPG",
					"JPEG", "GIF", "PNG", "BMP", "WEBP" ],
			imageUploadURL : contextPath
					+ "/foreupLoadArticleImgAsync?aid=${article.id}",
		});
		// console.log(showArticleMarkdown.getMarkdown());
		$(".article-nav-btn").mouseenter(function() {
			$("#article-nav").text("").slideDown();
			showArticleMarkdown.config({
				tocContainer : "#article-nav",
				tocDropdown : false
			});
		});
		$("#article-nav").click(function(e) {
			$(this).slideUp();
		});
		$(".save-article-btn").click(function(e) {
			e.preventDefault();
			console.log($("#show-articlmarkdown textarea").val())
		});
	});
</script>
<script
	src="<s:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js" />"
	type="text/javascript"></script>
<script src="<s:url value="/scripts/bootstrapValidator.min.js"/>"
	charset="utf-8"></script>
<script src="<s:url value="/scripts/js.min.js"/>" charset="utf-8"></script>