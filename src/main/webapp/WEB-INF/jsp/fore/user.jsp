<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/forePage/header.jsp"%>
<title>User</title>
<!-- 浏览器图标 -->
<%@include file="../include/forePage/browserIcon.jsp"%>
<!-- 样式 -->
<%@include file="../include/forePage/linker.jsp"%>

<!-- 顶部导航 -->
<%@include file="../include/forePage/top.jsp"%>
<!-- 背景 -->
<%@include file="../include/forePage/backgroundImg.jsp"%>
<!-- 用户导航 -->
<%@include file="../include/forePage/userNav.jsp"%>


<%@include file="../include/forePage/user/userPage.jsp"%>


<%@include file="../include/forePage/asideBottom.jsp"%>

<%@include file="../include/forePage/footer.jsp"%>

<script type="text/javascript" charset="utf-8">
	/* 初始化滑块 */
	function initSlider(slider, left, width) {
		var sty = {
			left : left,
			width : width
		}
		slider.css(sty);
	}

	jQuery(slideContentBottomSliderAsMouseEnter($))
	/* 滑动内容底部滑块随鼠标进入 */
	function slideContentBottomSliderAsMouseEnter() {
		var bottomSlider = $(".bottom-slider");
		var firstLi = bottomSlider.find("li:first");
		var width = firstLi.outerWidth();
		var otherLi = bottomSlider.find("li").not(firstLi);
		var contentBottomSlider = otherLi.next().find(".content-bottom-slider");
		initSlider(contentBottomSlider, 0, width);
		var firstLiOffsetLeft = firstLi.offset().left;
		$(window).resize(function() {
			firstLiOffsetLeft = firstLi.offset().left;
		});
		otherLi.on({
			"mouseenter" : function() {
				var ooWidth = $(this).outerWidth();
				var otherLiOffsetLeft = $(this).offset().left;

				contentBottomSlider.stop().width(ooWidth).animate({
					left : otherLiOffsetLeft - firstLiOffsetLeft
				}, "fast");
			},
			"mouseleave" : function() {
				contentBottomSlider.stop().width(width).animate({
					left : 0
				}, "fast");
			}
		});

		var li = bottomSlider.find("li");
		li.click(function(e) {
			li.find("a").css("color", "#292a2b");
			$(this).find("a").css("color", "#C40000")
		});
	}
</script>

</body>
</html>