<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../../include/forePage/header.jsp"%>
<title>CategoryArticle</title>
<%@include file="../../include/forePage/browserIcon.jsp"%>
<%@include file="../../include/forePage/linker.jsp"%>
<link rel="stylesheet"
	href="<s:url value="/editormd/css/editormd.css" />" type="text/css" />
<!-- 顶部导航-背景 -->
<div id="topnav-background">
	<%@include file="../../include/forePage/top.jsp"%>
</div>

<%@include file="../../include/forePage/article/categoryArticlePage.jsp"%>


<%@include file="../../include/forePage/asideBottom.jsp"%>

<%@include file="../../include/forePage/footer.jsp"%>

<!-- 额外脚本 -->
<script src="<s:url value="/editormd/lib/marked.min.js"/>"></script>
<script src="<s:url value="/editormd/lib/prettify.min.js"/>"></script>
<script src="<s:url value="/editormd/lib/raphael.min.js"/>"></script>
<script src="<s:url value="/editormd/lib/underscore.min.js"/>"></script>
<script src="<s:url value="/editormd/lib/sequence-diagram.min.js"/>"></script>
<script src="<s:url value="/editormd/lib/flowchart.min.js"/>"></script>
<script src="<s:url value="/editormd/lib/jquery.flowchart.min.js"/>"></script>
<script src="<s:url value="/editormd/editormd.js" />" charset="utf-8"></script>

</body>
</html>