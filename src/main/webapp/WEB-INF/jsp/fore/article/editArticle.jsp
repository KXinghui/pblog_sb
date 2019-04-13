<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../include/forePage/header.jsp"%>
<title>EditArticle</title>

<%@include file="../../include/forePage/browserIcon.jsp"%>

<%@include file="../../include/forePage/linker.jsp"%>

<link rel="stylesheet"
	href="<s:url value="/editormd/css/editormd.css"  />" type="text/css" />


<%@include file="../../include/forePage/top.jsp"%>


<%@include file="../../include/forePage/article/editArticlePage.jsp"%>


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