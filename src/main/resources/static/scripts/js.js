function addLoadEvent(func) {
  var oldOnLoad = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function () {
      func();
      oldOnLoad();
    }
  }
};

/* 获取应用上下文的根路径 */
function getContextPath() {
  // 获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
  var curWwwPath = window.document.location.href;
  // 获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
  var pathName = window.document.location.pathname;
  var pos = curWwwPath.indexOf(pathName);
  // 获取主机地址，如： http://localhost:8083
  var localhostPaht = curWwwPath.substring(0, pos);
  // 获取带"/"的项目名，如：/uimcardprj
  var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
  return (localhostPaht + projectName);
};


var contextPath;

function ScollPostion() {
  var t, l, w, h;
  if (document.documentElement && document.documentElement.scrollTop) {
    t = document.documentElement.scrollTop;
    /*
	 * l = document.documentElement.scrollLeft; w =
	 * document.documentElement.scrollWidth; h =
	 * document.documentElement.scrollHeight;
	 */
  } else if (document.body) {
    t = document.body.scrollTop;
    /*
	 * l = document.body.scrollLeft; w = document.body.scrollWidth; h =
	 * document.body.scrollHeight;
	 */
  }
  return t;
};

jQuery(showAsScreenScroll($));

function showAsScreenScroll() {
  var topNav = $("#top-nav");
  var background = $("#background");
  var userNav = $("#user-nav");
  var topNavBackground = $("#topnav-background");
  var topNavPart = $("#top-nav-part");
  var editArticle = $("#edit-article");
  var categoryNavBar = $("div#category-nav-bar");

  if (editArticle.length != 0) {
    topNav.removeClass("navbar-fixed-top");
  };
  if (topNavPart.length != 0) {
    topNavPart.css("height", topNav.height());
  }
  if (topNavBackground.length == 0) {
    topNav.mouseenter(function () {
      topNav.css("background-color", "whitesmoke");
    });
    topNav.mouseleave(function () {
      if (ScollPostion() == 0) {
        topNav.css("background-color", "transparent");
      }
    });
  } else {
    topNav.mouseenter(function () {
      topNav.css("background-color", "whitesmoke");
    });
    topNav.mouseleave(function () {
      if (ScollPostion() == 0) {
        topNav.css("background-color", "#ffffff4d");
      }
    });
  };
  var handUp = $("#hand-up");
  handUp.click(function (e) {
    $("html,body").animate({
      scrollTop: 0,
    }, 500);
  });
  if (categoryNavBar.length != 0) {
    var categoryNavBarOffset = categoryNavBar.offset().top;
  }
  // 屏幕滚动事件
  document.onscroll = function () {
    // 屏幕顶部高度
    var top = ScollPostion();
    /* 顶部导航 */
    var topNavBackgroundColor = (top > topNav.height() + 10) ? "whitesmoke" : "transparent";
    topNav.css("background-color", topNavBackgroundColor);
    /* 返回顶部 */
    var handUpDisplay = (top == 0) ? "none" : "block";
    handUp.css("display", handUpDisplay);
    /* 分类导航栏 */
    if (categoryNavBar.length != 0 && top == 0) {
      categoryNavBar.clearQueue().animate({
        top: categoryNavBarOffset,
      }, function () {
        if (categoryNavBar.length != 0 && top > categoryNavBar.get(0).offsetTop) {
          categoryNavBar.clearQueue().animate({
            top: topNav.height() + 10,
          });
        }
      });
    };
    if (categoryNavBar.length != 0 && top > categoryNavBar.get(0).offsetTop) {
      categoryNavBar.clearQueue().animate({
        top: topNav.height() + 10,
      }, function () {
        if (categoryNavBar.length != 0 && top == 0) {
          categoryNavBar.clearQueue().animate({
            top: categoryNavBarOffset,
          }, "fast");
        }
      });
    }
    /* 用户导航 */
    if (userNav.length != 0) {
      var userNavFixedTop = (top > userNav.get(0).offsetTop) ? true : false;
      var navbarFixedTop = "navbar-fixed-top";
      if (userNavFixedTop) {
        userNav.addClass(navbarFixedTop).slideDown(500);
        topNav.hide();
      } else {
        userNav.removeClass(navbarFixedTop);
        topNav.show();
      }
    } else {};
    // if(userNav){
    // topNav.removeClass(navFixedTop);
    // if(top>)
    // }
  };
};


/* 首页 */
jQuery(showCategory($));

function showCategory() {
  var topNav = $("#top-nav");
  // var categoryItem = $(".suspend-menu").find(".menu-item[id^=category]");
  $("body").on("click", ".suspend-menu .menu-item", function () {
    var categorySel = $(this).find("a").attr("href");
    $("html,body").animate({
      scrollTop: ($(categorySel).offset().top - 500),
    }, 1000);

  });
}




/*
 * 
 * 
 * 
 * 
 * 顶部导航页面
 * 
 * 
 * 
 * 
 * 
 */

/* 用户头像弹出用户操作面板 */
jQuery(mouseEnterUserHeadImg($));

function mouseEnterUserHeadImg() {
  var userHeadimgOp = $(".user-headimg-op");
  var userOpPanel = $(".user-oppanel");
  userHeadimgOp.mouseenter(function () {
    // userOpPanel.css("display", "block");
    userOpPanel.stop().fadeIn();
  });
  userHeadimgOp.mouseleave(function () {
    // userOpPanel.css("display", "none");
    userOpPanel.stop().fadeOut();
  });
  userOpPanel.mouseenter(function () {
    userOpPanel.stop().fadeIn();
  });
};



/*
 * 
 * 
 * asidebottom 页面
 * 
 * 
 */



/* 文章导航按钮 */
jQuery(showAndHideArticleNav($));

function showAndHideArticleNav() {
  var articleNavBtn = $(".article-nav-btn");
  var articleNav = $("#article-nav");
  articleNavBtn.mouseenter(function () {
    articleNav.stop().slideDown();
  });
  articleNavBtn.mouseleave(function () {
    articleNav.stop().slideUp();
  });
};


























/*
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 背景壁纸
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 */



/* 用户长时间未操作-暂时 和 点击背景图片换背景 */
jQuery(listenerWallPaper($));

function listenerWallPaper() {
  var wallPaper = $(".wall-paper");
  var backgroundImage = $("#wall-paper-img");
  if (backgroundImage.length == 0) return;
  backgroundImage.click(function (e) {
    var backImage = ["2-1", "3-1", "4-1", "7-1", "9-1", "11-1", "13-1"];
    var random = Math.floor(Math.random() * (backImage.length));
    backgroundImage.attr("src", "images/wallpaper/" + backImage[random] + ".jpg");
  });
  var wallPaperInner = $(".wall-paper-inner");
  var wallpaperFormDiv = $(".wallpaper-form-div");
  wallPaperInner.on({
    "click mouseenter": function (e) {
      wallPaperInner.stop().slideUp(500, function () {
        wallpaperFormDiv.stop().fadeIn();
      });
    },
  });
  wallpaperFormDiv.on({
    "mousemove keyup": function () {
      wallPaperInner.stop().slideUp(500, function () {
        wallpaperFormDiv.stop().fadeIn();
      });
    }
  });
  $("html").on({
    "mouseleave": function () {
      // 暂时使用.delay()延迟
      wallPaperInner.delay(5000).slideDown();
      wallpaperFormDiv.stop().delay(4300).fadeOut(500);
    },
    "mousemove keyup": function () {
      wallPaperInner.stop().slideUp(500, function () {
        wallpaperFormDiv.stop().fadeIn();
      });
    },
  });

};


/* 随窗口尺寸改变初始化背景图片的宽高 */
function initBackGroundImageAsWindowResize(backgroundImage) {
  if (!backgroundImage) {
    // console.log(backgroundImage + " 为空");
    return false;
  };
  var width = $(window).width();
  var wallPaperInner = $(".wall-paper-inner");
  backgroundImage.width(width).height($(window).height());
  wallPaperInner.height($(window).height());
};

/* 随窗口尺寸改变改变背景图片 */
function changeBackGroundImageAsWindowResize(backgroundImage, oldSrc) {
  if (!oldSrc) {
    // console.log(oldSrc + " 为空");
    return false;
  }
  var width = $(window).width();
  if (width < 1024) {
    var srcAry = oldSrc.split("-1");
    var newSrc = srcAry[0].concat(srcAry[1]);
    backgroundImage.attr("src", newSrc);
  } else {
    backgroundImage.attr("src", oldSrc);
  };
};


/* 改变背景图片随窗口尺寸 */
function initAndChangeBackGroundImageAsWindowResize(backgroundImage) {
  initBackGroundImageAsWindowResize(backgroundImage);
  var oldSrc = backgroundImage.attr("src");
  changeBackGroundImageAsWindowResize(backgroundImage, oldSrc);
  $(window).resize(function () {
    initBackGroundImageAsWindowResize(backgroundImage);
    changeBackGroundImageAsWindowResize(backgroundImage, oldSrc);
  });

};

jQuery(initBackgroundImage($));

function initBackgroundImage() {
  var backgroundImage = $("#wall-paper-img");
  initAndChangeBackGroundImageAsWindowResize(backgroundImage);
};

/* 显示日期时间 */
function showDateTime(dateTime) {
  var yearMonthDay = dateTime.find(".year-month-day");
  var week = dateTime.find(".week");
  var time = dateTime.find(".time");
  var date = new Date();
  yearMonthDay.text(date.getFullYear() + "年" + date.getMonth() + 1 + "月" + date.getDate() + "日");
  week.text(getWeek(date));
  var minute = date.getMinutes().toString();
  minute = (minute.length == 1) ? "0" + minute : minute;
  time.text(date.getHours() + ":" + minute);
};

function showTime(dateTime) {
  var time = dateTime.find(".time");
  var date = new Date();
  var minute = date.getMinutes().toString();
  minute = (minute.length == 1) ? "0" + minute : minute;
  time.text(date.getHours() + ":" + minute);
};

function getWeek(date) {
  var day = date.getDay();
  switch (day) {
    case 0:
      return "周日";
      break;
    case 1:
      return "周一";
      break;
    case 2:
      return "周二";
      break;
    case 3:
      return "周三";
      break;
    case 4:
      return "周四";
      break;
    case 5:
      return "周五";
      break;
    case 6:
      return "周六";
      break;
    default:
      break;
  };
};


jQuery(backgroundDateTime($));

function backgroundDateTime() {
  var dateTime = $(".date-time");
  showDateTime(dateTime);
  var date = new Date();
  setInterval(function () {
    showTime(dateTime);
  }, (60 - date.getSeconds()) * 1000);
};


/*
 * 
 * 
 * 用户长时间操作
 * 
 * 
 * 
 */
window.onload = function () {
  (function ($) {
    funObj = {
      timeUserFun: 'timeUserFun',
    };
    $[funObj.timeUserFun] = function (time) {
      var time = time || 2;
      var userTime = time * 60;
      var objTime = {
        init: 0,
        time: function () {
          objTime.init += 1;
          if (objTime.init == userTime) {
            // 用户到达未操作事件 做一些处理
          };
        },
        eventFun: function () {
          clearInterval(testUser);
          objTime.init = 0;
          testUser = setInterval(objTime.time, 1000);
        },
      };

      var testUser = setInterval(objTime.time, 1000);

      var body = document.querySelector('html');
      body.addEventListener("click", objTime.eventFun);
      body.addEventListener("keydown", objTime.eventFun);
      body.addEventListener("mousemove", objTime.eventFun);
      body.addEventListener("mousewheel", objTime.eventFun);
    };
  })(window);


  // 直接调用 参数代表分钟数,可以有一位小数;
  timeUserFun(0.1);
};

/* 输入用户名时ajax显示用户头像 */
jQuery(showHeadImgWhenInputUserName($));

function showHeadImgWhenInputUserName() {
  var loginForm = $("#login-form");
  var userName = loginForm.find("input[name=name]");
  var headImg = loginForm.find("#user-headimg");
  /*
	 * 
	 * 
	 * 截流ajax请求
	 * 
	 * 
	 */
  var timeout, delay = 1800;

  userName.keyup(function (e) {
    clearTimeout(timeout);
    timeout = setTimeout(function () {
      var name = userName.val();
      if (!name) return false;
      var url = contextPath + "/fore/user/" + name + "/headImg";
      // var data = {
      // name: name
      // }
      $.get(url, function (data, textStatus, jqXHR) {
          if ("no" != data) {
            headImg.attr("src", contextPath + "/" + data);
          };
        },
        "text"
      );
    }, delay);

  });

  /*
	 * 
	 * 
	 * 截流ajax请求
	 * 
	 * 
	 */

};


jQuery(loginForm($));

function loginForm() {
  var loginForm = $("#login-form");
  initFormValidErrMsg(loginForm);
};

jQuery(registerForm($));

function registerForm() {

  var registerForm = $("#register-form");
  initFormValidErrMsg(registerForm);
  var fieldsOption = {
    name: {
      message: "用户名无效",
      validators: {
        notEmpty: {
          message: "用户名不能为空"
        },
        stringLength: {
          min: 2,
          max: 25,
          message: "标题长度必须在 2 - 25 之间"
        },
      },
    },
    password: {
      message: "密码无效",
      validators: {
        notEmpty: {
          message: "密码不能为空"
        },
        stringLength: {
          min: 5,
          max: 60,
          message: "密码长度必须在 5 - 60 之间"
        },
        identical: {
          field: 'repassword',
          message: "确认密码必须与密码相同",
        },
      },
    },
    repassword: {
      message: "确认密码无效",
      validators: {
        notEmpty: {
          message: "确认密码不能为空"
        },
        identical: {
          field: 'password',
          message: "确认密码必须与密码相同",
        },
      },
    },
  };
  boostrapValidate(registerForm, fieldsOption);
};







/*
 * 
 * 
 * 
 * 
 * 
 * 分页
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 */


/* 初始化分页属性current pageRecord */
function initPageAttr(sel, num, min, max) {
  if (!validSelValNotEmpty(sel)) {
    sel.val(num);
  };
  if (validSelValInt(sel)) {
    if (!validSelNumRange(sel, min, max)) {
      sel.val(num);
    };
  } else {
    if (validSelNumRange(sel, min, max)) {
      sel.val(parseInt(sel.val()));
    } else {
      sel.val(num);
    };
  };
};

/* 随分页属性的改变加载 */
function assignAspageAttrChange() {
  var pageInput = $(".change-page input");
  window.location.assign(handleUrl(pageInput.serialize()));
};

/* 处理url：排除指定参数，留下重要参数并追加参数 */
function handleUrl(param) {
  var href = window.location.href;
  var index = href.indexOf("?");
  if (index == -1) {
    return href + "?" + param;
  }
  // 问号后的参数
  var params = href.split("?")[1];
  // 原url(即问号前的包括问号)
  var orginHref = href.substr(0, index + 1);
  var originParamAry = params.split("&");
  // 要排除的指定参数
  var styAry = ["pageRecord", "current"];
  var pramAry = originParamAry.filter(function (v) {
    return !styAry.includes(v.split("=")[0]);
  });
  // 留下重要参数
  var impParam = pramAry.toString().replace(",", "&");
  // 追加参数
  var newHref = (impParam) ? orginHref + impParam + "&" + param : orginHref +
    param;
  return newHref;
};


jQuery(listenerChangeClick($));

function listenerChangeClick() {
  var changePageRecord = $("#change-pagerecord-btn");
  var changeCurrent = $("#change-current-btn");
  changePageRecord.click(function (e) {
    // 随分页属性的改变加载
    assignAspageAttrChange();
  });
  changeCurrent.click(function (e) {
    // 随分页属性的改变加载
    assignAspageAttrChange();
  });
};

// jQuery(changePageRecordCurrent($));

function changePageRecordCurrent() {
  var pageRecord = $("input[name=pageRecord]");
  var current = $("input[name=current]");

  var cVal = $(".current").text();
  var pRVal = $(".page-record").text();
  var tVal = $(".total").text();
  var tPVal = $(".total-page").text();
  pageRecord.val(pRVal);
  current.val(cVal);

  pageRecord.change(function (e) {
    initPageAttr(pageRecord, pRVal, 1, parseInt(tVal));
  });
  current.change(function (e) {
    initPageAttr(current, cVal, 1, parseInt(tPVal));
  });
};













/*
 * 
 * 
 * 
 * 公共表单函数
 * 
 * 
 * 
 */


/* 判断两个数组的值是否相同 */
function checkAryValueIsConsitent(ary, ary2) {
  return ary.sort().toString() == ary2.sort().toString();
};

/* 表单验证 */
/* 检验值是否不为空 */
function validSelValNotEmpty(sel) {
  var val = sel.val();
  if (val.length != 0) {
    return true;
  };
  return false;
};

/* 检验值是否符合数值范围 */
function validSelNumRange(sel, min, max) {
  var val = sel.val();
  if (isNaN(min) || isNaN(max))
    return false;
  if (min <= val && val <= max) {
    return true;
  }
  return false;
}
/* 检验值是否符合长度范围 */
function validSelValRange(sel, min, max) {
  var val = sel.val();
  if (isNaN(min) || isNaN(max))
    return false;
  var vLen = val.length;
  if (min <= vLen && vLen <= max) {
    return true;
  }
  return false;
}

/* 检验两值是否一致 */
function validSelValConsitent(sel1, sel2) {
  var val1 = sel1.val();
  var val2 = sel2.val();
  if (val1 == val2) {
    return true;
  }
  return false;
}

/* 检验值是否为数字 */
function validSelValNum(sel) {
  var val = sel.val();
  if (!isNaN(val)) {
    return true;
  }
  return false;
}

/* 检验值是否为整数 */
function validSelValInt(sel) {
  var val = sel.val();
  if (parseInt(val) == val) {
    return true;
  }
  return false;
}

/* 关闭表单错误信息 */
jQuery(closeFormErrMsg($));

function closeFormErrMsg() {
  var closeMsgBtn = $(".close-msg-btn");
  closeMsgBtn.click(function (e) {
    var formOpSuccessMsg = $(this).parent(".form-op-successmsg");
    var formOpErrMsg = $(this).parent(".form-op-errmsg");
    var formValidErrMsg = $(this).parent(".form-valid-errmsg");
    formOpSuccessMsg.css("display", "none");
    formOpErrMsg.css("visibility", "hidden");
    formValidErrMsg.css("display", "none");
  });
}

/* 初始化表单验证错误信息 */
function initFormValidErrMsg(form) {
  // 找出form-valid-errmsg下有errmsg的span的按钮和父元素
  var validErrMsg = form.find(".form-valid-errmsg .errmsg");
  var btn = validErrMsg.next();
  var formValidErrMsg = validErrMsg.parent();
  btn.css("display", "block");
  formValidErrMsg.css("display", "flex");
}


function checkForm(form) {
  var input = form.find("input");

}

function showTipModal(title, body, isSuccess) {
  var success = "text-success";
  var danger = "text-danger";

  clazz = (isSuccess) ? success : danger;
  var modal = $("#tip-modal");
  var modalTitle = modal.find(".modal-title").children();
  var modalBody = modal.find(".modal-body").children();
  modalTitle.removeClass().addClass(clazz).text(title);
  modalBody.removeClass().addClass(clazz).text(body);
  modal.modal({
    show: true,
    backdrop: 'static',
    keyboard: false
  });
}

function hideTipModal(delay) {
  delay = (!delay) ? 1500 : delay;
  var modal = $("#tip-modal");
  setTimeout(function () {
    modal.modal("hide");
  }, delay);
}

function showSuccessTipModal(title, body) {
  showTipModal(title, body, true);

}

function showDangerTipModal(title, body) {
  showTipModal(title, body, false);
}

function showAndHideTipToast(text, styClass) {
  var tipDialog = $(".tip-dialog");
  var tipToast = $("<div class='tip-toast'>" + text + "</div>");
  tipDialog.append(tipToast);
  tipToast.addClass(styClass).delay(4200).fadeOut("slow", function () {
    $(this).remove();
  });
}

function showAndHideSuccessTipToast(text) {
  var styClass = "toast-success";
  showAndHideTipToast(text, styClass);
}

function showAndHideDangerTipToast(text) {
  var styClass = "toast-danger";
  showAndHideTipToast(text, styClass);
}

function showAndHideNormalTipToast(text) {
  var styClass = "toast-normal";
  showAndHideTipToast(text, styClass);
}





/*
 * 加载当前点击的数据到指定模态窗口表单或表单 先从指定元素的 data-field 属性获取值 split("-")
 * 判断是表单什么元素【input、select、radio、checkbox】 在class为上面的值获取值
 * 
 * input 没有前缀 text() val() select attr() val() radio 遍历 val() prop("checked",
 * true) checkbox prop("checked", true)
 * 
 * 
 * 二：方便简洁 在字段的html元素写上自定义属性：field 先获取有field属性的dom元素【属性选择器】然后判断其type
 * 
 * input 没有前缀 text() val() select attr() val() radio 遍历 val() prop("checked",
 * true) checkbox prop("checked", true)
 * 
 * 根据type往表单中name一致的dom元素填上对应的数据
 * 
 */

/* 从指定按钮对应的行的有field="id"的单元格th获取id值 */
function getIdOnBtnTable(btn, table) {
  var th = table.find("th");
  var id = "";
  th.each(function (index, element) {
    var ele = $(this);
    if (ele.attr("field") == "id") {
      var tr = btn.parents("tr");
      var td = tr.find("td");
      var jqTd = $(td[index]);
      id = jqTd.text();
      // 结束循环
      return false;
    };
  });
  return id;
}

/* 从指定btn的指定父元素获取字段属性返回字段Map */
function getFieldAttrTextReturnFieldMapFromBtnParentsSel(btn, parentSel) {
  // var field = sel.find("[field]")
  var field = btn.parents(parentSel).find("[field]");
  var fieldMap = new Map();
  // 多选
  // TODO
  field.each(function (index, element) {
    var ele = $(this);
    var fieldName = ele.attr("field");
    var fieldValue = ele.text();
    fieldMap.set(fieldName, fieldValue);
  });
  return fieldMap;
}

function getOnlyReadFieldAttrTextReturnOnlyReadFieldMapFromBtnParentsSel(btn, parentSel) {
  var onlyReadField = new Map();
  var field = btn.parents(parentSel).find("[field]");
  field.each(function (index, element) {
    var ele = $(this);
    var fieldName = ele.attr("field");
    var fieldValue = ele.text();
    if (field.attr("onlyread") == "true") {
      onlyReadField.set(fieldName, fieldValue);
      return false;
    }
  });
  return onlyReadField;
}

/* 从指定btn的指定父元素获取字段属性返回字段Map */
function getOneFieldAttrTextReturnFieldMapFromBtnParentsSel(btn, parentSel, fieldName) {
  // var field = sel.find("[field]")
  var field = btn.parents(parentSel).find("[field=" + fieldName + "]");
  var fieldMap = new Map();
  // 多选
  // TODO
  var fieldValue = field.text();
  fieldMap.set(fieldName, fieldValue);
  return fieldMap;
}




/* 从指定表格th获取有field及其索引组成的字段数组 */
function getFieldAryFromTableTh(table) {
  var th = table.find("th");
  var fieldAry = [];
  th.each(function (index, element) {
    var ele = $(this);
    if (th.attr("field")) {
      fieldAry.push(ele.attr("field"));
    } else {
      fieldAry.push("");
    }
  });
  return fieldAry;
}

/* 从指定按钮的父元素tr获取每行对应字段数组的索引返回字段Map */
function getFieldAttrReturnFieldMapFromFieldAryOnBtnTable(btn, table) {
  var fieldAry = getFieldAryFromTableTh(table);
  var tr = btn.parents("tr");
  var td = tr.find("td");
  var fieldMap = new Map();
  $.each(fieldAry, function (index, value) {
    if (value) {
      var jqTd = $(td[index]);
      fieldMap.set(value, jqTd.text());
    }
  });
  return fieldMap;
}
/* 从指定表格th获取有field及其索引组成的字段Index */

function getFieldIndexFromTableTh(table) {
  var th = table.find("th");
  var fieldIndex = new Map();
  th.each(function (index, element) {
    var ele = $(this);
    var fieldName = ele.attr("field");
    if (fieldName) {
      fieldIndex.set(index, fieldName);
    }
  });
  return fieldIndex;
}

/* 从指定表格th获取有field且onlyread为true及其索引组成的字段Index */
function getOnlyReadFieldIndexFromTableTh(table) {
  var th = table.find("th");
  var fieldIndex = new Map();
  th.each(function (index, element) {
    var ele = $(this);
    if (ele.attr("onlyread") == "true") {
      var fieldName = ele.attr("field");
      if (fieldName) {
        fieldIndex.set(index, fieldName);
      }
    }
  });
  return fieldIndex;
}

/* 从指定表格th获取一个指定field及其索引组成的字段Index */

function getOneFieldIndexFromTableTh(table, fieldName) {
  var th = table.find("th");
  var fieldIndex = new Map();
  th.each(function (index, element) {
    var ele = $(this);
    var name = ele.attr("field");
    if (fieldName == name) {
      fieldIndex.set(index, fieldName);
      // 结束循环
      return false;
    }
  });
  return fieldIndex;
}

function getFieldAttrReturnFieldMapFromFieldIndexOnBtnTable(btn, table) {
  var fieldIndex = getFieldIndexFromTableTh(table);
  var tr = btn.parents("tr");
  var td = tr.find("td");
  var fieldMap = new Map();
  for (var [key, value] of fieldIndex) {
    var jqTd = $(td[key]);
    fieldMap.set(value, jqTd.text());
  }
  return fieldMap;
}

function getOnlyReadFieldAttrTextReturnOnlyReadFieldMapFromFieldIndexOnBtnTable(btn, table) {
  var onlyReadFieldIndex = getOnlyReadFieldIndexFromTableTh(table);
  var tr = btn.parents("tr");
  var td = tr.find("td");
  var onlyReadFieldMap = new Map();

  for (var [key, value] of onlyReadFieldIndex) {
    var jqTd = $(td[key]);
    fieldMap.set(value, jqTd.text());
  }
  return onlyReadFieldMap;
}


/* 从指定表单获取和指定字段Map对应的字段值 若都一样返回true，否则返回false */
function checkFormRepeatAsFieldMap(form, fieldMap) {
  // 重复的个数
  var i = 0;
  // 对应的表单元素个数
  var formEleLen = 0;
  for (var [key, value] of fieldMap) {
    var formEle = form.find("[name=" + key + "]");
    // console.log(formEle);
    if (formEle.length != 0) {
      formEleLen += 1;
    }
    var tag = formEle.prop("nodeName");
    var type = formEle.attr("type");
    // var tagAry = ["INPUT", "SELECT", "TEXTAREA"];
    // if (tagAry.includes(tag)) {
    // formEleLen += 1;
    // }
    if ("INPUT" == tag) {
      if ("radio" == type) {
        var checkedFormEle = form.find("[name=" + key + "]:checked");
        if (checkedFormEle.nextAll("span").not("span[class]").text() == value) {
          i += 1;
        }
      } else if ("checkbox" == type) {
        formEle.each(function (index, element) {
          var ele = $(this);
          if (ele.prop("checked")) {
            if (ele.next().text() == value) {
              i += 1;
            }
          }
        });
      } else if (formEle.val() == value) {
        i += 1;
      }
    } else if ("SELECT" == tag) {
      var checkedOption = formEle.find("option:checked");
      if (checkedOption.text() == value) {
        i += 1;
      }
    } else if ("TEXTAREA" == tag) {
      if (formEle.val() == value) {
        i += 1;
      }
    }
  }
  if (i == formEleLen) {
    return true;
  }
  return false;
}

/* 加载数据到指定表单随字段Map */
// sel,form, fieldMap
function loadDataToFormAsFieldMap(form, fieldMap) {
  for (var [key, value] of fieldMap) {
    var formEle = form.find("[name=" + key + "]");
    if (!formEle) continue;
    var tag = formEle.prop("nodeName");
    var type = formEle.attr("type");
    if ("INPUT" == tag) {
      if ("radio" == type) {
        formEle.each(function (index, element) {
          var ele = $(this);
          if (ele.nextAll("span").not("span[class]").text() == value) {
            ele.prop("checked", true);
            return true;
          }
        });
      } else if ("checkbox" == type) {
        formEle.each(function (index, element) {
          var ele = $(this);
          if (ele.next().text() == value) {
            ele.prop("checked", true);
          }
        });
      } else {
        formEle.val(value);
      }
    } else if ("SELECT" == tag) {
      var option = formEle.find("option");
      option.each(function (index, element) {
        var ele = $(this);
        if (ele.text() == value) {
          formEle.val(ele.val());
        }
      });

    } else if ("TEXTAREA" == tag) {
      formEle.val(value);
    } else {
      formEle.text(value);
    }
  }
}

/* 从指定按钮对应的行的有field="id"的单元格th获取id值 */
function getIdOnBtnTable(btn, table) {
  var th = table.find("th");
  var id = "";
  th.each(function (index, element) {
    var ele = $(this);
    if (ele.attr("field") == "id") {
      var tr = btn.parents("tr");
      var td = tr.find("td");
      var jqTd = $(td[index]);
      id = jqTd.text();
      return false;
    }
  });
  return id;
}

/* 从指定按钮对应的元素的有field="id"的属性的元素获取文本id值 */
function getIdOnEle(ele) {
  return ele.find("[field=id]").text();
}

/* 从指定表格th获取有field及其索引组成的字段文本Index */
function getFieldTextIndexFromTableTh(table) {
  var th = table.find("th");
  var fieldTextIndex = new Map();
  th.each(function (index, element) {
    var ele = $(this);
    var fieldName = ele.attr("text");
    if (fieldName) {
      fieldTextIndex.set(index, fieldName);
    }
  });
  return fieldTextIndex;
}

function getFieldTextAttrReturnFieldTextMapFromFieldTextIndexOnBtnTable(btn, table) {
  var fieldTextIndex = getFieldTextIndexFromTableTh(table);
  var tr = btn.parents("tr");
  var td = tr.find("td");
  var fieldTextMap = new Map();
  for (var [key, value] of fieldTextIndex) {
    var jqTd = $(td[key]);
    fieldTextMap.set(value, jqTd.text());
  }
  return fieldTextMap;
}

/* 加载数据到指定元素随字段文本Map */
function loadDataToEleAsFieldTextMap(ele, fieldTextMap) {
  for (var [key, value] of fieldTextMap) {
    var eleSpan = ele.find("[text=" + key + "]");
    if (!eleSpan) continue;
    eleSpan.text(value);
  }
}

/* 清除数据在指定元素随字段文本Map */
function clearDataInEleAsFieldTextMap(ele, fieldTextMap) {
  for (var [key, value] of fieldTextMap) {
    var eleSpan = ele.find("[text=" + key + "]");
    if (eleSpan.length == 0) continue;
    eleSpan.text("");
  }
}

/* 元素 */
function loadFieldMapDataToFormInModalOnClickBtnSelAndParentSelInParentsSel(modal, form, parentsSel, btnSel, parentSel, fieldsOption, afterFunc) {

  var editArticleContentBtn = modal.find("#edit-articlecontent-btn");

  /* jQuery内置委托 */
  $(parentsSel).on("click", btnSel, function (e) {
    var fieldMap = new Map();
    var onlyReadFieldMap = new Map();
    var fillBtn = form.find(".fill-btn");
    var resetBtn = form.find("[type=reset]");
    var submitBtn = form.find(".submit-btn");
    var formOpErrmsg = form.find(".form-op-errmsg");
    var errMsg = formOpErrmsg.find(".errmsg");

    e.preventDefault();
    var btn = $(this);
    var parent = btn.parents(parentSel);
    fieldMap = getFieldAttrTextReturnFieldMapFromBtnParentsSel(btn, parentSel);
    onlyReadFieldMap = getOnlyReadFieldAttrTextReturnOnlyReadFieldMapFromBtnParentsSel(btn, parentSel);
    // fieldTextMap =
    // getFieldTextAttrReturnFieldTextMapFromFieldTextIndexOnBtnTable(btn,parentSel);
    // 直接编辑文章内容的按钮链接
    var href = contextPath + "/foreeditArticle?aid=" + fieldMap.get("id");
    editArticleContentBtn.attr("href", href);

    // loadDataToEleAsFieldTextMap(form,fieldTextMap);
    loadDataToFormAsFieldMap(form, fieldMap);
    formOpErrmsg.css("visibility", "hidden");
    modal.modal("show");

    fillBtn.click(function (e) {
      form.data('bootstrapValidator').resetForm();
      loadDataToFormAsFieldMap(form, fieldMap);
    });
    resetBtn.click(function (e) {
      // 重置 阻止默认事件 重置表单 加载只读字段到表单 重置验证
      e.preventDefault();
      form.get(0).reset();
      loadDataToFormAsFieldMap(form, onlyReadFieldMap);
      form.data('bootstrapValidator').resetForm();
    });
    boostrapValidate(form, fieldsOption);
    form.on('success.form.bv', function (e) {
      e.preventDefault();
      if (checkFormRepeatAsFieldMap(form, fieldMap)) {
        errMsg.text("你都完全没有改过");
        formOpErrmsg.css("visibility", "visible");
      } else {
        afterFunc(form, parent);
      }
    }).on('error.field.bv', function (e, data) {
      loadDataToFormAsFieldMap(form, onlyReadFieldMap);
    });
  });
  // 模态框关闭后重置表单
  modal.on('hide.bs.modal', function () {
    form.get(0).reset();
    form.data('bootstrapValidator').resetForm();
    form.removeClass("in");
  });
}

/* 表格 */
function loadFieldMapDataFromTableToFormInModalOnClickBtnSelAndParentSel(modal, table, form, parentsSel, btnSel, fieldsOption, afterFunc) {
  /* jQuery内置委托 */
  $(parentsSel).on("click", btnSel, function (e) {
    var fieldMap = new Map();
    var onlyReadFieldMap = new Map();
    var fillBtn = form.find(".fill-btn");
    var resetBtn = form.find("[type=reset]");
    var submitBtn = form.find("[type=submit]");
    var formOpErrmsg = form.find(".form-op-errmsg");
    var errMsg = formOpErrmsg.find(".errmsg");

    var btn = $(this);
    fieldMap = getFieldAttrReturnFieldMapFromFieldIndexOnBtnTable(btn, table);
    onlyReadFieldMap = getOnlyReadFieldAttrTextReturnOnlyReadFieldMapFromFieldIndexOnBtnTable(btn, table);


    fieldTextMap = getFieldTextAttrReturnFieldTextMapFromFieldTextIndexOnBtnTable(btn, table);

    loadDataToEleAsFieldTextMap(form, fieldTextMap);
    loadDataToFormAsFieldMap(form, fieldMap);
    formOpErrmsg.css("visibility", "hidden");
    modal.modal("show");
    fillBtn.click(function (e) {
      form.data('bootstrapValidator').resetForm();
      loadDataToFormAsFieldMap(form, fieldMap);
    });
    resetBtn.click(function (e) {
      e.preventDefault();
      form.get(0).reset();
      form.data('bootstrapValidator').resetForm();
      loadDataToFormAsFieldMap(form, onlyReadFieldMap);
    });
    boostrapValidate(form, fieldsOption);
    form.on('success.form.bv', function (e) {
      e.preventDefault();
      if (checkFormRepeatAsFieldMap(form, fieldMap)) {
        errMsg.text("你都完全没有改过");
        formOpErrmsg.css("visibility", "visible");
      } else {
        // errMsg.text("改过了");
        // formOpErrmsg.css("visibility", "visible");
        // 异步提交
        afterFunc(form, btn, table);
      }
    }).on('error.field.bv', function (e, data) {
      loadDataToFormAsFieldMap(form, onlyReadFieldMap);
    });

    /*
	 * var field = { fieldName: { message: "字段名无效", validators: { notEmpty: {
	 * message: "字段名不能为空" }, stringLength: { min: 0, max: 0, message: "字段名长度必须在
	 * min - max 之间" }, identical: { field: otherFieldName, message:
	 * "字段名必须与其他字段名相同", }, phone: { country: CN, message: "手机号码格式必须合法", },
	 * integer: { message: "必须为整数", }, data: { format: "YYYY-MM-DD", message:
	 * "日期格式必须为 'YYYY-MM-DD'", }, emailAddress: { message: "邮箱格式必须合法" }, } } }
	 */

    // 模态框关闭后重置表单
    modal.on('hide.bs.modal', function () {
      form.get(0).reset();
      form.data('bootstrapValidator').resetForm();
    })
  });
};

/* 删除 */
function deleteInModalOnClickBtnSelAndParentSel(modal, table, parentsSel, delBtnSel, url) {
  $(parentsSel).on("click", delBtnSel, function (e) {
    var btn = $(this);
    var id = getIdOnBtnTable(btn, table);
    modal.modal("show");
    var confirmBtn = modal.find(".confirm-btn");
    confirmBtn.click(function (e) {
      var data = {
        id: id,
      };
      $.ajax({
        type: "GET",
        url: url,
        data: data,
        dataType: "application/json",
        success: function (response) {
          if ("success" == response) {
            $(delBtnSel).parents("tr").remove();
          }
        }
      });
    });
  });
};

/* 删除 */
function deleteInModalOnClickBtnSelAndParentSelInEle(modal, ele, parentsSel, delBtnSel, url) {
  var id = "";
  $(parentsSel).on("click", delBtnSel, function (e) {
    var btn = $(this);
    id = getIdOnBtnEle(btn, ele);
    id = getIdOnEle(ele),
      modal.modal("show");
  });

  var confirmBtn = modal.find(".confirm-btn");
  confirmBtn.click(function (e) {
    var data = {
      id: id,
    };
    $.post(url, data,
      function (data, textStatus, jqXHR) {
        if ("success" == response) {
          // 移除
          ele.remove();
        }
      },
      "text"
    );
  });
}


function setHrefToForm(originHref, fieldMap) {

}








/*
 * 
 * 
 * 
 * 
 * 
 * 上传
 * 
 * 
 * 
 * 
 * 
 * 
 */

/* 操作后提示的淡入淡出显示指定文本 */
function fadeTipAfterOp(text) {
  var tip = $(".alreadyOp");
  tip.text(text).fadeIn(400).delay(3500).fadeOut(400);
}

/* 获取文件名(带有扩展名) */
function getFileName(originFileName) {
  return originFileName.slice(originFileName.lastIndexOf("\\") + 1);
}
/* 获取文件的扩展名 */
function getFileNameExten(originFileName) {
  return originFileName.slice(originFileName.lastIndexOf(".") + 1);
}

/* 上传文件时的检测 */
/* 是否支持文件扩展名 "jpg", "png" */

function isSupportFileExten(exten) {
  var support = ["jpg", "png"];
  for (var i = 0, len = support.length; i < len; i++) {
    if (exten.toLowerCase() == support[i]) {
      return true;
    }
  }
  return false;
}

/* 是否符合文件大小 0<size<=3m (1024 * 1024 * 30) */
function isSupportFileSize(size) {
  /* 0<size<=3m (1024 * 1024 * 30) */
  if (0 < size && size <= 3145728) {
    return true;
  }
  return false;
}

/* 是否符合图片宽高 (5000 * 5000) */
function isSupportWH(width, height) {
  /* 0<size<=3m (1024 * 1024 * 30) */
  var i = 0;
  if (0 < width && width < 5000) {
    i += 1;
  }
  if (0 < height && height <= 5000) {
    i += 1;
  }
  if (i == 2) {
    return true;
  }
  return false;
}







/*
 * 
 * 
 * 
 * 
 * 
 * 上传图片
 * 
 * 
 * 
 * 
 * 
 */



jQuery(selUpLoadImg($));
/* 选择上传图片 */
function selUpLoadImg() {
  var selImg = $(".selUpLoadImg");
  selImg.click(function (e) {
    var ele = $(this);
    var realImg = ele.next();
    realImg.click();
  });
}

jQuery(viewImgInfo($));
/* 查看图片信息 按钮-图片信息 */
/* btn info */
function viewImgInfo() {
  var viewImgInfoBtn = $(".viewImgInfoBtn");
  viewImgInfoBtn.click(function (e) {
    var btn = $(this);
    var upLoadImgInfo = btn.parents(".upLoadImg").find(".upLoadImgInfo");
    upLoadImgInfo.stop().slideToggle();
    if (btn.text() == "关闭") {
      btn.stop().text("查看").attr("title", "查看上传图片信息");
    } else {
      btn.stop().text("关闭").attr("title", "关闭上传图片信息");
    }
  });
}
/* 获取输入框的文件信息 返回数组 */
function getFileInputInfo(file) {
  return [file.name, getFileNameExten(file.name), file.size];
}

/* 预览用户自定义图片 */
// jQuery(preViewImgInModal($));

function preViewImgInModa() {
  var preViewImgBtn = $(".preViewImgBtn");
  var preViewImgModal = $("#previewimg-modal");
  preViewImgBtn.click(function (e) {
    var url = contextPath + "/foregetUserInfoImg";
    var img = preViewImgModal.find("img");
    $.get(url,
      function (data, textStatus, jqXHR) {
        img.each(function (index, element) {
          $(this).attr("src", data[index]);
        });
        preViewImgModal.modal("show");
      },
      "text"
    );
  });
}


jQuery(resetImgAndInfo($));
/* 重置图片 按钮-图片信息-图片 */
/* btn info */
function resetImgAndInfo() {
  var resetImgBtn = $(".resetImgBtn");
  resetImgBtn.click(function (e) {
    var btn = $(this);
    // 图片表格
    var imgInfoTable = btn.parent().prev().children();
    // 图片信息
    var upLoadImgInfo = btn.parents(".upLoadImg").find(".upLoadImgInfo");
    // 图片容器
    var upLoadImgContainer = upLoadImgInfo.parents(".upLoadImg-container");
    // 图片
    var upLoadImg = btn.parents(".upLoadImg").find(".showImg");
    // input
    var fileInput = upLoadImgContainer.find("input");

    fileInput.val("");
    upLoadImg.attr('src', "").removeClass("img-thumbnail");
    upLoadImgContainer.css("height", "20rem");
    imgInfoTable.find("td").text("");
  });
}

// jQuery(addUpLaoadImg($));
/* 添加上传图片(检测) */
function addUpLaoadImg() {
  var add = $(".addUpLaoadImg");
  add.click(function (e) {
    if ($(".showImg").length < 6) {
      var upLoadImg = $(".upLoadImg:first");
      add.before(upLoadImg.clone(true));
      add.attr("display", "block");
      var resetImgBtn = add.prev().find(".resetImgBtn");
      resetImgBtn.click();
    } else {
      e.preventDefault();
      add.attr("display", "none");
    }
  });
}

// jQuery(deleteUpLaoadImg($));
/* 删除上传图片(检测) */
function deleteUpLaoadImg() {
  var delImgBtn = $(".delImgBtn");
  delImgBtn.click(function (e) {
    var upLoadImg = $(this).parents(".upLoadImg");
    var upLoadImgDiv = upLoadImg.parent(".upLoadImgDiv-container");
    var showImg = upLoadImgDiv.find(".showImg");
    // var showImg = $(".showImg");
    if (showImg.length > 1) {
      upLoadImg.remove();
    } else {
      e.preventDefault();
    }
  });
}


jQuery(saveUpLaoadImg($));
/* 保存上传图片(检测是否为空) */
function saveUpLaoadImg() {
  var saveImgBtn = $(".saveImgBtn");
  saveImgBtn.click(function (e) {
    var btn = $(this);
    var upLoadImgDiv = btn.parents(".upLoadImgDiv");
    var imgInput = btn.parent().prev().find(".realImg");
    if (!imgInput.val()) {
      showDangerTipModal("上传用户自定义图片", "失败：上传图片不为空");
      return;
    }
    if (!checkIsLogin()) return;
    var imgType = btn.attr("data-imgType");
    var url = contextPath + "/fore/user/userinfo/" + imgType;
    var formData = new FormData();
    formData.append("userInfoImg", imgInput.get(0).files[0]);
    $.ajax({
      type: "POST",
      url: url,
      data: formData,
      dataType: "text",
      cache: false,
      contentType: false,
      processData: false,
      mimeType: "multipart/form-data",
      success: function (response) {
        if ("success" == response) {
          showSuccessTipModal("上传用户自定义图片", "上传成功");
          hideTipModal();
        } else {

          showDangerTipModal("上传用户自定义图片", "失败：" + response);
        }
      }
    });
    var showImg = upLoadImgDiv.find(".showImg");
    // var showImg = $(".showImg");
    if (showImg.length > 1) {
      upLoadImg.remove();
    } else {
      e.preventDefault();
    }
  });
}

jQuery(changeAndShowRealImg($));

function changeAndShowRealImg() {
  var realImg = $(".realImg");
  var width = $(".upLoadImg-container").width();

  realImg.change(function (e) {
    var btn = $(this).parents("upLoadImg").find(".resetImgBtn");
    var upLoadImg = $(this).parents("upLoadImg");
    // var file = this.files[0];
    // 展示图片
    var showImg = $(this).next().find('.showImg');
    // 上传图片容器
    var upLoadImgContainer = $(this)
      .parents(".upLoadImg-container");
    // 图片信息表格
    var imgInfoTable = $(this).next().next().find("table");
    // 图片信息最后一个单元格
    var imgInfoLastTd = imgInfoTable.find("td").last();

    var _URL = window.URL || window.webkitURL;
    var file, img;
    if ((file = this.files[0])) {


      /*
		 * if (!isSupportFileExten(getFileNameExten(file.name))) {
		 * showDangerTipModal("上传用户自定义图片", "失败：不支持该文件类型"); // 重置
		 * realImg.val(""); showImg.attr("src",
		 * "").removeClass("img-thumbnail"); return; } if
		 * (!isSupportFileSize(file.size)) { showDangerTipModal("上传用户自定义图片",
		 * "失败：该文件超出大小范围"); // 重置 realImg.val(""); showImg.attr("src",
		 * "").removeClass("img-thumbnail"); return; }
		 */


      img = new Image();
      img.onload = function () {
        showImg.attr('src', this.src).addClass("img-thumbnail")
          .slideDown();
        /* .height(Math.ceil(showImg.height())) */
        showImg.css("width", width);

        // 上传图片容器高度与展示图片高度相比
        if (upLoadImgContainer.height() < showImg.height()) {
          // 加10的原因是避免图片与边框重合
          upLoadImgContainer.height(Math.ceil(showImg
            .height()) + 10);
        }
        // 展示图片的宽高
        // console.log("showImg.width() " + showImg.width());
        // console.log("showImg.height() " + showImg.height());
        // console.log("Math.floor(showImg.height()) " +
        // Math.ceil(showImg.height()));

        /* 真实图片信息 */

        // console.log(file.name);
        // console.log(getFileNameExten(file.name));
        // console.log(file.size);
        // console.log("img.width 真实宽度 " + img.width);
        // console.log("img.height 真实高度 " + img.height);
        /*
		 * 检查图片大小、宽高是否符合(符合继续，不符合清空，显示错误信息alreadyOp)
		 */

        /*
		 * if (isSupportFileExten(getFileNameExten(file.name))) { if
		 * (isSupportFileSize(file.size)) { if (isSupportWH(img.width,
		 * img.height)) { } else { fadeTipAfterOp("该文件宽高比超出大小范围"); } } else {
		 * fadeTipAfterOp("该文件超出大小范围"); } } else { fadeTipAfterOp("不支持该文件类型"); }
		 */

        // 目标图片调用Jcrop()
        // showImg.Jcrop({
        // onChange: showCoords,
        // onSelect: showCoords,
        // }, function () {
        // jcrop_api = this;
        // });
        /* 图片信息 */
        imgInfoLastTd.text(img.width + " * " + img.height);
        /* 图片信息 */
        fillUpLoadImgInfoToTable(getFileInputInfo(file),
          imgInfoTable);
      };
      img.src = _URL.createObjectURL(file);
    }
  });
}


/* 填充上传图片信息到表格 */
function fillUpLoadImgInfoToTable(imgInfo, infoTable) {
  var imgInfoTd = infoTable.find("td");
  var len = imgInfoTd.length - 1;
  imgInfoTd.each(function (index, element) {
    var info = imgInfo[index];
    if (info && index != len) {
      $(this).text(info);
    }
  });
}


jQuery(preViewUserImg($));
/* 预览用户图片 */
function preViewUserImg() {
  var preViewImgBtn = $(".preViewImgBtn");
  var modal = $("#previewimg-modal");
  preViewImgBtn.click(function (e) {
    // ajax获取图片存储路径
    // getUserInfoImgPathByAjaxAndLoad(loadImgPathToCarusalInModal);
    // 显示模态窗口
    modal.modal("show");
  });
}

/* ajax获取自身用户信息图片存储路径并执行加载 */
function getOwnUserInfoImgPathByAjaxAndLoad(func) {
  if (typeof func != 'function') {
    // console.log(func + " 不是函数");
    return false;
  }
  var url = contextPath + "/foregetOwnUserInfoImgPath";
  // ajax获取用户信息图片存储路径
  $.get(url,
    function (data, textStatus, jqXHR) {
      /* 优化：缓存响应 */
      var modal = $("");
      if (data) {
        // 加载用户信息图片存储路径到模态窗口
        func(data, modal);
      }
    },
    "text"
  );
}

/* 加载用户信息图片存储路径到模态窗口 */
function loadImgPathToCarusalInModal(data, modal) {
  var img = modal.find("img");
  // 加载到模态窗口中轮播图片的src属性
  img.each(function (index, element) {
    $(this).attr("src", data[index]);
  });
}

/* 优化：获取模态窗口的src与ajax后的判断，全部相等就不用处理； */
/*
 * function getUserInfoImgPathInModal(modal) { var path = []; var img =
 * modal.find("img"); }
 * 
 * function checkAryIsConsitent(ary1, ary2) { }
 */





/*
 * 
 * 
 * 
 * 
 * 
 * 用户信息页面
 * 
 * 
 * 
 * 
 * 
 * 
 */
var addressData;

/* 获取地址json和执行函数 */
jQuery(getAddressJSONByAjaxAndInit($));

function getAddressJSONByAjaxAndInit() {
  if (!addressData) {
    $.getJSON(contextPath + '/scripts/provinceCity2018.json', function (data) {
      addressData = data;
      loadAddressListToSelect(data, "select[id='province']");
    });
  } else {
    loadAddressListToSelect(addressData, "select[id='province']");
  }
}

function filterAddress(data, code) {
  var d = data.filter(function (item, index, array) {
    return (item["code"] == code);
  })[0];
  return d;
}

/* 加载数据到指定select */

function loadAddressListToSelect(data, select) {
  $.each(data, function (index, value) {
    // value = data[index]
    var code = value['code'];
    var name = value['name'];
    var option = $("<option code=" + code + " value=" + code + ">" + name +
      "</option>");
    option.appendTo(select);
  });
}

/* 清空指定select下的第一个option后的option */

function clearNotFirstOptionInSelect(selectSelector) {
  $(selectSelector + " option[code]").remove();
}

jQuery(selectAddress($));

function selectAddress() {
  var province = $("select[id='province']");
  var city = $("select[id='city']");
  var area = $("select[id='area']");
  var cs = [];
  province.change(function (e) {
    clearNotFirstOptionInSelect("select[id='city']");
    clearNotFirstOptionInSelect("select[id = 'area']");
    showAddress(fetechAddress());
    var code = province.val();
    if (!code) {
      // console.log(code + " 为空");
      return false;
    }
    var p = addressData.filter(function (item, index, array) {
      return (item["code"] == code);
    })[0];

    var p = filterAddress(addressData, code);
    cs = p["cityList"];
    loadAddressListToSelect(cs, "select[id='city']");

  });
  city.change(function (e) {
    clearNotFirstOptionInSelect("select[id = 'area']");
    showAddress(fetechAddress());
    var code = city.val();
    // console.log(code);
    if (!code) {
      // console.log(code + " 为空");
      return false;
    }
    var c = filterAddress(cs, code);
    var as = c["areaList"];
    loadAddressListToSelect(as, "select[id='area']");

  });
  area.change(function (e) {
    showAddress(fetechAddress());
  });
}

function fetechAddress() {
  var addressSelect = $("select[name^='address']");
  var addressOption = addressSelect.find("option:selected");
  var address = [];
  addressOption.each(function (index, element) {
    var text = $(this).text();
    var val = $(this).val();
    if (!address.includes(text) && val) {
      address.push(text);
    }
  });
  return address;
}


function showAddress(address) {
  var addressInput = $("input[name=address]");
  // var addressShow = $(".address-show");
  var addressText = "";
  $.each(address, function (index, value) {
    addressText += value;
  });
  // addressShow.text(addressText);
  addressInput.val(addressText);
}

jQuery(userInfoForm($));
/* 用户信息表单 */
function userInfoForm() {
  var form = $(".userinfo-form");
  initFormValidErrMsg(form);

  var userForm = $(".user-form");
  initFormValidErrMsg(userForm);

}



/* 清空登陆历史 */

jQuery(clearLoginHistory($));

function clearLoginHistory() {
  var btnSel = ".clear-loginhistory-btn";
  var loginhistoryTable = $("#loginhistory-table");
  var failLoginhistoryTable = $("#fail-loginhistory-table");
  var tr = loginhistoryTable.find("tr").not("tr:first");
  var tr2 = failLoginhistoryTable.find("tr").not("tr:first");
  $("body").on("click", btnSel, function () {
    var url = contextPath + "/foreclearLoginHistoryAsync";
    $.get(url,
      function (data, textStatus, jqXHR) {
        if ("success" == data) {
          tr.slideUp(function () {
            tr.remove();
          });
          tr2.slideUp(function () {
            tr2.remove();
          });
          showAndHideSuccessTipToast("清空登陆历史成功");
        } else {
          showAndHideNormalTipToast(data);
        }
      },
      "text"
    );
  });
}




/*
 * 
 * 
 * 
 * 
 * 
 * 
 * 用户页面
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 */

/* 悬浮菜单 */

/* 随窗口变化初始化侧边菜单 */
function initsuspendMenu(suspendMenu, className) {
  var mask = $(".mask");
  var categoryUlNav = $(".category-ul-nav");

  var windowWidth = $(window).width();
  if (windowWidth < 768) {
    if (!suspendMenu.hasClass(className)) {
      suspendMenu.addClass(className).css("left", "-50rem");
    }
    if (categoryUlNav.length != 0) {
      categoryUlNav.addClass("nav-justified");
    }

  } else {
    mask.css("display", "none");
    suspendMenu.removeClass(className).css("left", "0");
    if (categoryUlNav.length != 0) {
      categoryUlNav.removeClass("nav-justified");
    }
  }
}

function suspendMenu() {
  $(".suspend-menu-btn").click(function (e) {
    e.preventDefault();

  });
}

/* reSize悬浮菜单 */
jQuery(reSizesuspendMenu($));

function reSizesuspendMenu() {
  var suspendMenu = $(".suspend-menu");
  var xssuspendMenuClassName = "suspend-menu-xs";
  initsuspendMenu(suspendMenu, xssuspendMenuClassName);
  $(window).resize(function () {
    initsuspendMenu(suspendMenu, xssuspendMenuClassName);
  });
  // 操作悬浮菜单
  opsuspendMenu(suspendMenu);
}

/* 操作悬浮菜单 */
function opsuspendMenu(suspendMenu) {
  var categoryUlNav = $(".category-ul-nav");
  var opensuspendMenu = $(".open-suspend-menu");
  var closesuspendMenu = $(".close-suspend-menu");
  var suspendMenuLeft = suspendMenu.css("left");
  var mask = $(".mask");
  opensuspendMenu.click(function (e) {
    var windowWidth = $(window).width();
    if (windowWidth < 768) {
      mask.css("display", "block");
      // mask.animate({
      // "display": "block",
      // });
      suspendMenu.animate({
        left: "0",
      });
      if (categoryUlNav.length != 0) {
        categoryUlNav.addClass("nav-justified");
      }
    }
  });
  closesuspendMenu.click(function (e) {
    var windowWidth = $(window).width();
    if (windowWidth < 768) {
      // mask.animate({
      // "display": "none",
      // });
      var suspendMenuWidth = suspendMenu.outerWidth();
      suspendMenu.animate({
        left: -suspendMenuWidth
      });
      mask.css("display", "none");
      if (categoryUlNav.length != 0) {
        categoryUlNav.removeClass("nav-justified");
      }
    }
  });
}


/* 侧边菜单 */

/* reSize侧边菜单 */
jQuery(reSizeSideMenu($));

function reSizeSideMenu() {
  var sideMenu = $(".side-menu");
  // 操作侧边菜单
  opsideMenu(sideMenu);
}

/* 操作侧边菜单 */
function opsideMenu(sideMenu) {
  var opensideMenu = $(".open-side-menu");
  var closesideMenu = $(".close-side-menu");
  var tipDialog = $(".tip-dialog");
  var sideMenuLeft = sideMenu.css("left");
  var mask = $(".mask");
  opensideMenu.click(function (e) {

    mask.css("display", "block");
    // mask.animate({
    // "display": "block",
    // });
    sideMenu.animate({
      right: "0",
    });
    tipDialog.animate({
      top: sideMenu.offset().top + sideMenu.height() * 2,
    })
  });
  closesideMenu.click(function (e) {
    var sideMenuWidth = sideMenu.outerWidth();
    sideMenu.animate({
      right: -sideMenuWidth
    });
    mask.css("display", "none");
    tipDialog.animate({
      top: "10%",
    })
  });
}









/* 初始化滑块 */
function initSlider(slider, left, width) {
  var sty = {
    left: left,
    width: width
  };
  slider.css(sty);
}

// jQuery(slideContentBottomSliderAsMouseEnter($))
/* 滑动内容底部滑块随鼠标进入 */
function slideContentBottomSliderAsMouseEnter() {
  var bottomSlider = $(".bottom-slider");
  var firstLi = bottomSlider.find("li:first");
  var width = firstLi.outerWidth();
  var otherLi = bottomSlider.find("li").not(firstLi);
  var contentBottomSlider = otherLi.next().find(".content-bottom-slider");
  // var otherLiWidth = 0;
  // otherLi.each(function (index, element) {
  // otherLiWidth += $(this).outerWidth();
  // });
  // var otherLen = otherLi.length;
  // var lastIndex = otherLen - 1;
  // var lastLiOffsetLeft = otherLi[lastIndex].offsetLeft;
  // var offset = (lastLiOffsetLeft - firstLiOffsetLeft - otherLiWidth) /
  // otherLen;
  initSlider(contentBottomSlider, 0, width);
  var firstLiOffsetLeft = firstLi.offset().left;
  $(window).resize(function () {
    firstLiOffsetLeft = firstLi.offset().left;
  });
  otherLi.on({
    "mouseenter": function () {
      var ooWidth = $(this).outerWidth();
      var otherLiOffsetLeft = $(this).offset().left;

      contentBottomSlider.stop().width(ooWidth).animate({
        left: otherLiOffsetLeft - firstLiOffsetLeft
      }, "fast");
    },
    "mouseleave": function () {
      contentBottomSlider.stop().width(width).animate({
        left: 0
      }, "fast");
    }
  });

  var li = bottomSlider.find("li");
  li.click(function (e) {
    li.find("a").css("color", "#292a2b");
    $(this).find("a").css("color", "#C40000")
  });
}



/* 同步检查是否自身用户的文章及其状态 */

function checkOwnArticle(aid) {
  var url = contextPath + "/forecheckOwnArticle";
  var data = {
    aid: aid,
  };
  var result = "";
  $.ajax({
    type: "POST",
    url: url,
    data: data,
    dataType: "text",
    async: false,
    success: function (response) {
      result = response;
    },
  });

  var check = result.split("-");
  return check;
}



/* 编辑文章模态窗口 */

jQuery(editArticleModal($));

function editArticleModal() {
  var modal = $("#edit-article-modal");
  var form = $("#edit-article-form-modal");
  var fieldsOption = {
    id: {
      message: "文章ID无效",
      validators: {
        notEmpty: {
          message: "文章ID不能为空"
        },
      }
    },
    title: {
      message: "文章标题无效",
      validators: {
        notEmpty: {
          message: "文章标题不能为空"
        },
        stringLength: {
          min: 5,
          max: 25,
          message: "文章标题长度必须在 5 - 25 之间"
        },
      }
    },
    subTitle: {
      message: "文章副标题无效",
      validators: {
        notEmpty: {
          message: "文章副标题不能为空"
        },
        stringLength: {
          min: 5,
          max: 60,
          message: "文章副标题长度必须在 5 - 60 之间"
        },
      }
    },
    cid: {
      message: "文章分类类型无效",
      validators: {
        notEmpty: {
          message: "文章分类类型不能为空"
        },
      }
    }
  };

  loadFieldMapDataToFormInModalOnClickBtnSelAndParentSelInParentsSel(modal, form, ".article-ul", ".edit-article-link", ".article-item", fieldsOption, editArticleModalFunc);
  loadFieldMapDataToFormInModalOnClickBtnSelAndParentSelInParentsSel(modal, form, ".group-ul", ".edit-article-link", ".group-item", fieldsOption, editArticleModalFunc);
}
/* 编辑文章模态窗口函数 */
function editArticleModalFunc(form, parent) {

  var aid = form.find("[name=id]").val();

  // 同步检查文章
  var check = checkOwnArticle(aid);
  // console.log(check);
  var isOwn = check[0];
  var articleStatu = check[1];

  if ("no" == isOwn) {
    showDangerTipModal("编辑文章", "失败：你不配编辑此文章");
    return;
  }
  if ("DELETED" == articleStatu) {
    showDangerTipModal("编辑文章", "失败：不能编辑垃圾文章");
    return;
  }
  var fieldAry = ["title", "subTitle", "cid"];
  var newFieldMap = extractAsFieldAryToAndReturnNewFieldMap(form, fieldAry);
  var url = contextPath + "/foreeditArticleAsync";
  // var formData = new FormData(form.get(0));
  var data = form.serialize();
  $.ajax({
    type: "POST",
    url: url,
    data: data,
    dataType: "text",
    success: function (response) {
      if (response.startsWith("fore")) {
        loadDataAsFieldMapInEle(newFieldMap, parent);
        window.location.assign(contextPath + "/" + response);
      } else {
        var formOpErrmsg = form.find(".form-op-errmsg");
        var errMsg = formOpErrmsg.find(".errmsg");
        errMsg.text(response);
        formOpErrmsg.css("visibility", "visible");
      }
    },
  });
}


/* 编辑文章表格模态窗口 */
jQuery(editArticleTableModal($));

function editArticleTableModal() {
  var modal = $("#only-edit-article-modal");
  var form = $("#only-edit-article-form-modal");
  var table = $("#article-table");
  var fieldsOption = {
    id: {
      message: "文章ID无效",
      validators: {
        notEmpty: {
          message: "文章ID不能为空"
        },
      }
    },
    title: {
      message: "文章标题无效",
      validators: {
        notEmpty: {
          message: "文章标题不能为空"
        },
        stringLength: {
          min: 5,
          max: 25,
          message: "文章标题长度必须在 5 - 25 之间"
        },
      }
    },
    subTitle: {
      message: "文章副标题无效",
      validators: {
        notEmpty: {
          message: "文章副标题不能为空"
        },
        stringLength: {
          min: 5,
          max: 60,
          message: "副标题长度必须在 5 - 60 之间"
        },
      }
    },
    cid: {
      message: "文章分类类型无效",
      validators: {
        notEmpty: {
          message: "文章分类类型不能为空"
        },
      }
    }
  };

  loadFieldMapDataFromTableToFormInModalOnClickBtnSelAndParentSel(modal, table, form, ".edit-article-container", ".edit-article-link", fieldsOption, onlyEditArticleModalFunc);
}

/* 仅编辑文章模态窗口 */
function onlyEditArticleModalFunc(form, btn, table) {
  var modal = form.parents(".modal");
  var aid = form.find("[name=id]").val();

  // 同步检查文章
  var check = checkOwnArticle(aid);
  var isOwn = check[0];
  var articleStatu = check[1];

  if ("no" == isOwn) {
    showDangerTipModal("编辑文章", "失败：你不配编辑此文章");
    return;
  }
  if ("DELETED" == articleStatu) {
    showDangerTipModal("编辑文章", "失败：不能编辑垃圾文章");
    return;
  }
  var fieldAry = ["title", "subTitle", "cid"];
  var newFieldMap = extractAsFieldAryToAndReturnNewFieldMap(form, fieldAry);
  var url = contextPath + "/foreonlyEditArticleAsync";
  var data = form.serialize();
  var fieldAry = ["title", "subTitle", "cid"];
  var newFieldMap = extractAsFieldAryToAndReturnNewFieldMap(form, fieldAry);
  $.ajax({
    type: "POST",
    url: url,
    data: data,
    dataType: "text",
    success: function (response) {
      if ("success" == response) {
        modal.modal("hide");
        showAndHideSuccessTipToast("仅编辑文章成功");
        loadDataAsFieldMapInTable(newFieldMap, btn, table);
      } else {
        var formOpErrmsg = form.find(".form-op-errmsg");
        var errMsg = formOpErrmsg.find(".errmsg");
        errMsg.text(response);
        formOpErrmsg.css("visibility", "visible");
      }
    }
  });
}




/* 增加文章模态窗口 */
/* 写文章按钮[先登录] */
jQuery(writeArticle($));
/* 点击按钮后根据状态 */
function writeArticle() {
  var addArticleModal = $("#add-article-modal");
  var modalTitle = addArticleModal.find(".modal-title");
  var form = addArticleModal.find("#add-article-form-modal");
  var resetBtn = form.find("[type=reset]");
  var opErrMsg = form.find(".form-op-errmsg");
  var errMsg = opErrMsg.find(".errmsg");
  var fieldsOption = {
    title: {
      message: "文章标题无效",
      validators: {
        notEmpty: {
          message: "文章标题不能为空"
        },
        stringLength: {
          min: 5,
          max: 25,
          message: "文章标题长度必须在 5 - 25 之间"
        },
      }
    },
    subTitle: {
      message: "文章副标题无效",
      validators: {
        notEmpty: {
          message: "文章副标题不能为空"
        },
        stringLength: {
          min: 5,
          max: 60,
          message: "文章副标题长度必须在 5 - 60 之间"
        },
      }
    },
    cid: {
      message: "文章分类类型无效",
      validators: {
        notEmpty: {
          message: "文章分类类型不能为空"
        },
      }
    }
  };

  // jQuery内置委托
  $("body").on("click", ".write-article-btn", function (e) {
    e.preventDefault();
    // 登陆检查
    if (!checkIsLogin()) return;

    var btn = $(this);
    var articleStatu = btn.attr("articlestatu");
    var fieldMap = new Map();
    if ("draft" == articleStatu) {
      var draftText = "草稿";
      fieldMap.set("articleStatu", draftText);
      modalTitle.text(draftText);
    } else if ("article" == articleStatu || !articleStatu || "" == articleStatu) {
      var articleText = "文章";
      fieldMap.set("articleStatu", articleText);
      modalTitle.text(articleText);
    }
    loadDataToFormAsFieldMap(form, fieldMap);
    addArticleModal.modal("show");
    boostrapValidate(form, fieldsOption);
    form.on('success.form.bv', function (e) {
      e.preventDefault();
      var url = contextPath + "/" + form.attr("action");
      var data = form.serialize();
      $.ajax({
        type: "POST",
        url: url,
        data: data,
        dataType: "text",
        success: function (response) {
          if ("表单有误" == response) {
            errMsg.text(response);
            opErrMsg.css("visibility", "visible");
          } else {
            window.location.assign(contextPath + "/" + response);
          }
        }
      });
    });
  });

  resetBtn.click(function (e) {
    e.preventDefault();
    form.find("[name]").not("[name=articleStatu]").val("");
    form.data('bootstrapValidator').resetForm();
  });

  addArticleModal.on('hidden.bs.modal', function () {
    form.data('bootstrapValidator').resetForm();
    resetBtn.click();
    opErrMsg.css("visibility", "hidden");
  })
}



/* 删除文章 */
jQuery(deleteArticle($));

function deleteArticle() {
  var modal = $("#thorough-delete");
  deleteArticleFunc(modal, ".article-ul", ".delete-article-btn", ".article-item");
  deleteArticleFunc(modal, ".group-ul", ".delete-article-btn", ".group-item");
}

/* 删除文章函数 */
function deleteArticleFunc(modal, parentsSel, btnSel, parentSel) {
  var confirmBtn = modal.find("[type=submit]");
  $(parentsSel).on("click", btnSel, function () {
    if (!checkIsLogin()) return;
    var btn = $(this);
    var parent = btn.parents(parentSel);
    var aid = btn.attr("data-id");
    var check = checkOwnArticle(aid);
    var articleStatu = check[1];
    if (!"DELETED" == articleStatu) {
      showDangerTipModal("彻底删除文章", "失败：不能彻底删除(该文章不在垃圾箱)");
      return;
    }
    modal.modal("show");
    confirmBtn.click(function (e) {
      var url = contextPath + "/foredeleteArticleAsync";
      var data = {
        aid: aid,
      };
      e.preventDefault();
      $.post(url, data,
        function (data, textStatus, jqXHR) {
          if ("success" == data) {
            parent.remove();
            modal.modal("hide");
            showSuccessTipModal("彻底删除文章", "成功！！！");
            hideTipModal();
          } else {
            showDangerTipModal("彻底删除文章", data);
          }
        },
        "text"
      );
    });

  });
}

function boostrapValidate(form, fieldsOption) {
  if (form.length == 0) return;
  form.bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
      valid: 'glyphicon glyphicon-ok',
      invalid: 'glyphicon glyphicon-remove',
      validating: 'glyphicon glyphicon-refresh'
    },
    fields: fieldsOption
  });
}




/* 标签页 */
jQuery(ontAndOtherTab($));

function ontAndOtherTab() {
  // var tabContent = $(".cust-tab-content");
  // var tabOp = $(".cust-tab-op");
  // var addBtn = $(".add-group");
  // var existBtn = $(".cancle-add-group");
  // var oneTabBtn = $(".one-tab-btn");
  // var otherTabBtn = $(".other-tab-btn");
  $(".cust-tab-op").on("click", ".one-tab-btn", function () {
    var btn = $(this);
    btn.hide();
    btn.parents(".cust-tab-op").find(".other-tab-btn").show();
  });
  $(".cust-tab-op").on("click", ".other-tab-btn", function () {
    var btn = $(this);
    btn.hide();
    btn.parents(".cust-tab-op").find(".one-tab-btn").show();
  });
}


/* 显示隐藏随按钮是否选中 */
jQuery(showAndHideAsChecked($));

function showAndHideAsChecked() {
  var parentsSel = ".show-hide-checked";
  var btnSel = "input[type=checkbox]";
  $(parentsSel).on("change", btnSel, function () {
    var btn = $(this);
    var parents = btn.parents(parentsSel);
    var checkedArea = parents.find(".checked-area");
    var uncheckedArea = parents.find(".unchecked-area");

    if (btn.prop("checked")) {
      uncheckedArea.hide();
      checkedArea.fadeIn();
    } else {
      checkedArea.hide();
      uncheckedArea.fadeIn();
    }
  });
}



// TODO
/* 表中只读的字段用另一个map保存 */
/*
 * onlyread=true 就存，没有或为false就跳过
 */

/* 增加分组 */
jQuery(addGroup($));

function addGroup() {
  var modal = $("#add-group-modal");
  var modalTitle = modal.find(".modal-title");
  var form = modal.find("#add-group-modal-form");
  var opErrMsg = form.find(".form-op-errmsg");
  var errMsg = form.find(".errmsg");
  var resetBtn = form.find("[type=reset]");
  var fieldsOption = {
    name: {
      message: "分组名无效",
      validators: {
        notEmpty: {
          message: "分组名不能为空"
        },
        stringLength: {
          min: 1,
          max: 25,
          message: "分组名长度必须在 1 - 25 之间"
        },
      }
    },
    visibility: {
      message: "显示/隐藏无效",
      validators: {
        notEmpty: {
          message: "显示/隐藏不能为空"
        },
      }
    },
    groupType: {
      message: "分组类型无效",
      validators: {
        notEmpty: {
          message: "分组类型不能为空"
        },
      }
    },
  };

  $("body").on("click", ".add-group-btn", function () {
    var btn = $(this);
    var parent = btn.parents(".group-title");
    var groupType = btn.attr("grouptype");
    var groupTypeMap = new Map();
    if ("articlefavority" == groupType) {
      groupTypeMap.set("groupType", "文章收藏");
      modalTitle.text("增加文章收藏分组");
    } else if ("userfollow" == groupType) {
      groupTypeMap.set("groupType", "用户关注");
      modalTitle.text("增加用户关注分组");
    }
    loadDataToFormAsFieldMap(form, groupTypeMap);
    modal.modal("show");
    boostrapValidate(form, fieldsOption);
    form.on('success.form.bv', function (e) {
      e.preventDefault();
      // var formData = new FormData(form.get(0));
      var data = form.serialize();
      var url = contextPath + "/" + form.attr("action");
      $.ajax({
        type: "POST",
        url: url,
        data: data,
        dataType: "text",
        success: function (response) {
          // var group = '<div class="menu-item group-title"
          // data-id="${g.id}"><div class="group-name"><a
          // href='/fore/user/g.uid/articleFavorities/"+g.id+"
          // class="text-info" field="name">"+g.name+"</a>·<span
          // field="visibility">显示</span><span
          // field="visibility">隐藏</span><span class="hidden"
          // field="id">"+g.id+"</span> <span class="hidden"
          // field="groupType">文章收藏</span></div><div class='btn-group
          // btn-group-sm'><button class="btn btn-default edit-group-btn"
          // grouptype="articlefavority">编辑</button><button class="btn
          // btn-danger delete-group-btn"
          // grouptype="articlefavority">删除</button></div></div>'
          var isSuccess = response.substr(0, response.indexOf("-"));
          var group = response.substr(response.indexOf("-") + 1);
          if ("success" == isSuccess) {
            modal.modal("hide");
            showSuccessTipModal(modalTitle.text(), "成功");
            hideTipModal();
            window.location.reload();
          } else {
            errMsg.text(response);
            opErrMsg.css("visibility", "visible");
          }
        }
      });
    }).on('error.field.bv', function (e, data) {
      if (data.field == 'groupType') {
        loadDataToFormAsFieldMap(form, groupTypeMap);
      }
    });
    // 重置 填充组类型
    resetBtn.click(function (e) {
      e.preventDefault();
      form.get(0).reset();
      loadDataToFormAsFieldMap(form, groupTypeMap);
      form.data('bootstrapValidator').resetForm();
    });

    modal.on('hidden.bs.modal', function () {
      form.get(0).reset();
      form.data('bootstrapValidator').resetForm();
      opErrMsg.css("visibility", "hidden");
    })
  });
}

/* 检查自身组 */
function checkOwnGroup(gid) {
  if (!checkIsLogin()) return;
  var url = contextPath + "/forecheckOwnGroup";
  var isOwn = false;
  var data = {
    gid: gid,
  };
  $.ajax({
    type: "POST",
    url: url,
    data: data,
    dataType: "text",
    async: false,
    success: function (response) {
      if ("yes" == response) {
        isOwn = true;
      } else {
        showDangerTipModal("编辑文章", "失败：你不配编辑此分组");
      }
    }
  });
  return isOwn;
}

/* 编辑分组 */
jQuery(editGroup($));

function editGroup() {
  var modal = $("#edit-group-modal");
  var modalTitle = modal.find(".modal-title");
  var form = modal.find("#edit-group-form-modal");
  var opErrMsg = form.find(".form-op-errmsg");
  var errMsg = form.find(".errmsg");
  var resetBtn = form.find("[type=reset]");
  var fillBtn = form.find(".fill-btn");
  var fieldsOption = {
    id: {
      message: "分组ID无效",
      validators: {
        notEmpty: {
          message: "分组ID不能为空"
        },
      }
    },
    name: {
      message: "分组名无效",
      validators: {
        notEmpty: {
          message: "分组名不能为空"
        },
        stringLength: {
          min: 1,
          max: 25,
          message: "分组名长度必须在 1 - 25 之间"
        },
      }
    },
    visibility: {
      message: "显示/隐藏无效",
      validators: {
        notEmpty: {
          message: "显示/隐藏不能为空"
        },
      }
    },
    groupType: {
      message: "分组类型无效",
      validators: {
        notEmpty: {
          message: "分组类型不能为空"
        },
      }
    },
  };

  $("body").on("click", ".edit-group-btn", function () {
    var btn = $(this);
    var parent = btn.parents(".group-title");
    var groupType = btn.attr("grouptype");
    var fieldTextMap = getFieldAttrTextReturnFieldMapFromBtnParentsSel(btn, ".group-title");
    var fieldMap = getFieldAttrTextReturnFieldMapFromBtnParentsSel(btn, ".group-title");
    var groupTypeMap = new Map();
    groupTypeMap.set("groupType", fieldMap.get("groupType"));

    if ("articlefavority" == groupType) {
      modalTitle.text("编辑文章收藏分组");
    } else if ("userfollow" == groupType) {
      modalTitle.text("编辑用户关注分组");
    }
    loadDataToFormAsFieldMap(form, fieldMap);
    modal.modal("show");
    boostrapValidate(form, fieldsOption);
    form.unbind("success.form.bv").bind("success.form.bv", function (e) {
      e.preventDefault();
      if (checkFormRepeatAsFieldMap(form, fieldMap)) {
        errMsg.text("改都没改还想提交");
        opErrMsg.css("visibility", "visible");
      } else {
        if (!checkOwnGroup(fieldMap.get("id"))) {
          showDangerTipModal(modalTitle.text(), "失败：你不配编辑此分组");
          return;
        }
        var formData = new FormData(form.get(0));
        var url = contextPath + "/" + form.attr("action");
        $.ajax({
          type: "POST",
          url: url,
          data: formData,
          cache: false,
          contentType: false,
          processData: false,
          dataType: "text",
          success: function (response) {
            if ("success" == response) {
              var gid = formData.get("id");
              var fieldAry = ["name", "visibility"];
              var newFieldMap = extractAsFieldAryToAndReturnNewFieldMap(form, fieldAry);
              modal.modal("hide");
              showSuccessTipModal(modalTitle.text(), "成功");
              hideTipModal();
              var menuItem = $(".menu-item[data-id=" + gid + "]");
              var groupName = $(".group-name[data-id=" + gid + "]");
              loadDataAsFieldMapInEle(newFieldMap, groupName);
              loadDataAsFieldMapInEle(newFieldMap, menuItem);
              // window.location.reload();
            } else {
              errMsg.text(response);
              opErrMsg.css("visibility", "visible");
            }
          }
        });
      }
    }).on('error.field.bv', function (e, data) {
      if (data.field == 'id') {
        form.find("[name=id]").val(fieldMap.get("id"));
      } else if (data.field == 'groupType') {
        loadDataToFormAsFieldMap(form, groupTypeMap);
      }
    });

    // 填充原有信息
    fillBtn.click(function (e) {
      loadDataToFormAsFieldMap(form, fieldMap);
      form.data('bootstrapValidator').resetForm();
    });
    // 重置 填充组类型
    resetBtn.click(function (e) {
      e.preventDefault();
      form.get(0).reset();
      form.find("[name=id]").val(fieldMap.get("id"));
      loadDataToFormAsFieldMap(form, groupTypeMap);
      form.data('bootstrapValidator').resetForm();
    });
  });

  modal.on('hidden.bs.modal', function () {
    form.data('bootstrapValidator').resetForm();
    resetBtn.click();
    opErrMsg.css("visibility", "hidden");
  })
}


/* 删除分组 */
jQuery(deleteGroup($));

function deleteGroup() {
  var modal = $("#delete-group-modal");
  var isSave = modal.find("[name=isSave]");
  isSave.change(function (e) {
    // console.log(isSave.serialize());
  });
  var modalTitle = modal.find(".modal-title");
  var modalBody = modal.find(".modal-body");
  var confirmBtn = modal.find(".confirm-btn");

  $("body").on("click", ".delete-group-btn", function () {
    var btn = $(this);
    var groupType = btn.attr("grouptype");
    // 要操作的dom元素 删除-移除
    var groupMenuItem = btn.parents(".menu-item");
    // var parent = btn.parents(".group-title");
    var group = $("group-content").find("[field=" + id + "]").parents(".group-item");
    // var fieldMap = getFieldAttrTextReturnFieldMapFromBtnParentsSel(btn,
    // ".group-title");
    var id = getIdOnEle(groupMenuItem);
    if ("articlefavority" == groupType) {
      modalTitle.text("删除文章收藏分组");
      modalBody.text("确认删除该文章收藏分组吗？");
    } else if ("userfollow" == groupType) {
      modalTitle.text("删除用户关注分组");
      modalBody.text("确认删除该用户关注分组吗？");
    }
    modal.modal("show");

    confirmBtn.click(function (e) {
      // if (!checkOwnGroup(id)) return;
      var url = contextPath + "/foredeleteGroupAsync";
      var data = {
        gid: id,
        isSave: modal.find("input[name=isSave]:checked").val()
      };
      $.post(url, data,
        function (data, textStatus, jqXHR) {
          modal.modal("hide");
          if ("delete" == data || "deleteAll" == data) {
            groupMenuItem.remove();
            group.remove();
          }
          if ("delete" == data) {
            showAndHideSuccessTipToast("删除分组成功");
            showAndHideSuccessTipToast("已将分组相关放到默认组");
          } else if ("deleteAll" == data) {
            showAndHideSuccessTipToast("删除分组成功");
          } else {
            showDangerTipModal("删除分组", data);
          }

        },
        "text"
      );
    });
  });
  modal.on('hide.bs.modal', function () {
    isSave.prop("checked", false);
    var checkedArea = modal.find(".checked-area");
    var uncheckedArea = modal.find(".unchecked-area");
    checkedArea.hide();
    uncheckedArea.fadeIn();
  });
}

/*
 * 异步： 编辑【更新数据】-删除【移除】 目前是jq，不是vue，删除还好说 编辑-更新
 * 要实现并不难，但将会是有很多要改，因此，直接就是根据字段map加载数据到按钮对应的父元素中
 * （先从表单根据字段数组提取数据到字段Map，后根据在父元素加载数据） 但部分要异步更新数据还是要的 list-group 的新建分组
 */

/* 根据字段数组从表单提取到字段Map并返回map */
function extractAsFieldAryToAndReturnNewFieldMap(form, fieldAry) {
  var newFieldMap = new Map();
  $.each(fieldAry, function (index, value) {
    var formEle = form.find("[name=" + value + "]");
    var tag = formEle.prop("nodeName");
    var type = formEle.attr("type");
    if ("INPUT" == tag) {
      if ("radio" == type) {
        var checkedFormEle = form.find("[name=" + value + "]:checked");
        newFieldMap.set(value, checkedFormEle.nextAll("span").not("span[class]").text());
      } else if ("checkbox" == type) {
        formEle.each(function (index, element) {
          var ele = $(this);
          if (ele.prop("checked")) {
            newFieldMap.set(value, ele.next().text());
            return false;
          }
        });
      } else {
        newFieldMap.set(value, formEle.val());
      }
    } else if ("SELECT" == tag) {
      var checkedOption = formEle.find("option:checked");
      newFieldMap.set(value, checkedOption.text());
    } else if ("TEXTAREA" == tag) {
      newFieldMap.set(value, formEle.val());
    }
  });
  return newFieldMap;
}

/* 根据字段Map加载数组到元素中 */
function loadDataAsFieldMapInEle(fieldMap, ele) {
  if (ele.length == 0) return;
  for (var [key, value] of fieldMap) {
    var field = ele.find("[field=" + key + "]");
    field.text(value);
  }
}

/* 根据字段Map加载数组到表格中 */
function loadDataAsFieldMapInTable(fieldMap, btn, table) {
  // 找出按钮对应的行，根据fieldMap找出次序，然后根据次序赋值
  var fieldIndex = getFieldIndexFromTableTh(table);
  var td = btn.parents("tr").find("td");
  for (var [key, value] of fieldIndex) {
    if (fieldMap.has(value)) {
      $(td.get(key)).text(fieldMap.get(value));
    }
  }
}

/* list-group-modal */
jQuery(listGroup($));

function listGroup() {
  var modal = $("#list-group-modal");
  // var modalTitle = modal.find(".modal-title");
  // var newGroupBtn = modal.find(".new-group-btn");
  // var custCheckbox = modal.find(".cust-checkbox");
  // var otherTabBtn = modal.find(".other-tab-btn");

  // var listForm = modal.find("#list-group-form-tab");
  // var addForm = modal.find("#add-group-form-tab");
  // var opErrMsg = addForm.find(".form-op-errmsg");
  // var errMsg = addForm.find(".errmsg");
  // var resetBtn = addForm.find("[type=reset]");

  var fieldsOption = {
    name: {
      message: "分组名无效",
      validators: {
        notEmpty: {
          message: "分组名不能为空"
        },
        stringLength: {
          min: 1,
          max: 25,
          message: "分组名长度必须在 1 - 25 之间"
        },
      }
    },
    visibility: {
      message: "显示/隐藏无效",
      validators: {
        notEmpty: {
          message: "显示/隐藏不能为空"
        },
      }
    },
    groupType: {
      message: "分组类型无效",
      validators: {
        notEmpty: {
          message: "分组类型不能为空"
        },
      }
    },
  };
  listGroupAsIdAndGroupTypeOnBtnInEle(modal);

  newGroup(modal, fieldsOption);
}

/* 列出分组随在按钮上的data-id、grouptype 返回组ID数组 */
function listGroupAsIdAndGroupTypeOnBtnInEle(modal) {
  var modalTitle = modal.find(".modal-title");
  var addForm = modal.find("#add-group-form-tab");
  var newGroupBtn = modal.find(".new-group-btn");
  var listForm = modal.find("#list-group-form-tab");
  var custCheckbox = modal.find(".cust-checkbox");
  $("body").on("click", ".list-group-btn", function () {
    if (!checkIsLogin()) return;
    var btn = $(this);
    var id = btn.attr("data-id");
    var groupType = btn.attr("grouptype");
    switch (groupType) {
      case "userfollow":
        groupType = 0;
        modalTitle.text("关注用户");
        listForm.attr("action", "forefollowUserAsync");
        newGroupBtn.attr("grouptype", "userfollow");
        break;
      case "articlefavority":
        groupType = 1;
        listForm.attr("action", "forecollectArticleAsync");
        modalTitle.text("收藏文章");
        newGroupBtn.attr("grouptype", "articlefavority");
        break;
    }
    var url = contextPath + "/forelistGroupAsync";
    var data = {
      id: id,
      groupType: groupType,
    };
    var groupIdAry = [];
    custCheckbox.empty();
    $.ajax({
      type: "POST",
      url: url,
      data: data,
      dataType: "text",
      async: false,
      success: function (data) {
        var groups = data.substr(0, data.indexOf("]") + 1);
        var abouts = data.substr(data.indexOf("]") + 2);
        $.each($.parseJSON(groups), function (index, group) {
          var label = "<label class='cust-checkbox-label'><input type='checkbox' value=" + group.id + " name='gid'><span class='text-muted'>" + group.name + "</span></label>";
          custCheckbox.append(label);
        });
        $.each($.parseJSON(abouts), function (index, about) {
          var id = about.gid;
          var checkbox = custCheckbox.find("input[value=" + id + "]");
          checkbox.prop("checked", true);
          groupIdAry.push(about.gid);
        });
        var selectedNum = listForm.find(".selected-num");
        selectedNum.text(groupIdAry.length);
        modal.modal("show");
      }
    });
    modal.on('hide.bs.modal', function () {
      listForm.get(0).reset();
      addForm.get(0).reset();
      groupIdAry = [];
    });
    listGroupForm(modal, btn, listForm, groupIdAry);
  });
}

function newGroup(modal, fieldsOption) {
  var otherTabBtn = modal.find(".other-tab-btn");
  var newGroupBtn = modal.find(".new-group-btn");
  var custCheckbox = modal.find(".cust-checkbox");
  var modalTitle = modal.find(".modal-title");
  var addForm = modal.find("#add-group-form-tab");
  var opErrMsg = addForm.find(".form-op-errmsg");
  var errMsg = addForm.find(".errmsg");
  var resetBtn = addForm.find("[type=reset]");
  /* 新建分组 */
  $("body").on("click", ".new-group-btn", function () {
    var btn = $(this);
    var groupType = btn.attr("grouptype");
    var groupTypeMap = new Map();
    if ("articlefavority" == groupType) {
      groupTypeMap.set("groupType", "文章收藏");
      modalTitle.text("增加文章收藏分组");
    } else if ("userfollow" == groupType) {
      groupTypeMap.set("groupType", "用户关注");
      modalTitle.text("增加用户关注分组");
    }
    loadDataToFormAsFieldMap(addForm, groupTypeMap);
    modal.modal("show");
    boostrapValidate(addForm, fieldsOption);
    addForm.on('success.form.bv', function (e) {
      e.preventDefault();
      var url = contextPath + "/" + addForm.attr("action");
      var addFormData = new FormData(addForm.get(0));
      var data = {
        name: addFormData.get("name"),
        visibility: addFormData.get("visibility"),
        groupType: addFormData.get("groupType"),
      };
      $.ajax({
        type: "POST",
        url: url,
        data: data,
        dataType: "text",
        success: function (response) {
          var data = response.split("-");
          var statu = data[0];
          var group = JSON.parse(data[1]);
          if ("success" == statu) {
            var label = "<label class='cust-checkbox-label'><input type='checkbox' value=" + group.id + " name='gid' checked><span class='text-muted'>" + group.name + "</span></label>";
            custCheckbox.append(label);
            otherTabBtn.click();
          } else {
            errMsg.text(response);
            opErrMsg.css("visibility", "visible");
          }
        }
      });

    }).on('error.field.bv', function (e, data) {
      if (data.field == 'groupType') {
        loadDataToFormAsFieldMap(form, groupTypeMap);
      }
    });
    // 重置 填充组类型
    resetBtn.click(function (e) {
      e.preventDefault();
      addForm.get(0).reset();
      loadDataToFormAsFieldMap(addForm, groupTypeMap);
      addForm.data('bootstrapValidator').resetForm();
    });

    modal.on('hidden.bs.modal', function () {
      addForm.get(0).reset();
      addForm.data('bootstrapValidator').resetForm();
      otherTabBtn.click();

    })
  });
}

/* 选中后【与之前的ids不同】发送添加id到分组 */
function listGroupForm(modal, btn, form, groupIdAry) {
  var opSuccessMsg = form.find(".form-op-successmsg");
  var successMsg = opSuccessMsg.find("errmsg");
  var opErrMsg = form.find(".form-op-errmsg");
  var errMsg = opErrMsg.find("errmsg");
  var selectedNum = form.find(".selected-num");
  var confirmBtn = form.find(".confirm-btn");
  var newGroupIdAry = [];
  confirmBtn.attr("disabled", true);
  form.on("change", ".cust-checkbox-label", function () {
    var checkedBox = form.find("input[type=checkbox]:checked");
    selectedNum.text(checkedBox.length);
    newGroupIdAry = [];
    $.each(checkedBox, function (index, value) {
      var gid = $(value).val();
      if (!newGroupIdAry.includes(gid)) {
        newGroupIdAry.push(gid);
      }
    });
    if (checkAryValueIsConsitent(groupIdAry, newGroupIdAry)) {
      // disabled
      confirmBtn.attr("disabled", true);
    } else {
      confirmBtn.attr("disabled", false);
    }
  });
  // unbind() 取消绑定事件，防止多次调用
  confirmBtn.unbind("click").bind("click", function (e) {
    e.preventDefault();
    if (checkAryValueIsConsitent(groupIdAry, newGroupIdAry)) return;
    var url = contextPath + "/" + form.attr("action");
    if (!form.serialize()) {
      href = url.concat("?id=" + btn.attr("data-id"));
    } else {
      href = url.concat("?id=" + btn.attr("data-id") + "&" + form.serialize());
    }
    $.ajax({
      type: "POST",
      url: href,
      dataType: "text",
      success: function (response) {
        modal.modal("hide");
        if ("yes" == response || "no" == response) {
          var isOp = ("yes" == response) ? true : false;
          opAfterlistGroup(btn, isOp);
          return;
        }
        showAndHideDangerTipToast(response);
      }
    });
  });

}

function opAfterlistGroup(btn, isOp) {
  var groupType = btn.attr("grouptype");
  switch (groupType) {
    case "articlefavority":
      if (isOp) {
        showAndHideSuccessTipToast("收藏文章成功");
        btn.addClass("btn-success");
      } else {
        showAndHideSuccessTipToast("取消收藏文章成功");
        btn.removeClass("btn-success");
      }
      break;
    case "userfollow":
      if (isOp) {
        showAndHideSuccessTipToast("关注用户成功");
        btn.addClass("btn-success");
      } else {
        showAndHideSuccessTipToast("取消关注用户成功");
        btn.removeClass("btn-success");
      }
      break;
  }
}
/* 清除组内指定失效 */
jQuery(clearOneArticleFavorityInGroup($));

function clearOneArticleFavorityInGroup() {
  $(".container-group").on("click", ".clear-af-btn", function () {
    if (!checkIsLogin()) return;
    var btn = $(this);
    var articleItem = btn.parents(".article-item");
    var groupItem = btn.parents(".group-item");
    var parent = (articleItem.length != 0) ? articleItem : groupItem;
    var id = btn.attr("data-id");
    var url = contextPath + "/foreclearDsgtInvalidArticleFavorityInGroupAsync";
    var data = {
      afid: id,
    };
    $.post(url, data,
      function (data, textStatus, jqXHR) {
        if (id == data) {
          parent.slideUp(function () {
            parent.remove();
          });
          showAndHideSuccessTipToast("清除组内指定失效成功");
        } else {
          showDangerTipModal("清除组内指定失效", data);
        }
      },
      "text"
    );
  });
}


/* 父元素内指定invalid属性的元素 移除失效文章收藏 */
function removeInvalidArticleFavority(ids, parentSel, parentsSel) {
  var parents = $(parentsSel);
  // 先找出所有属性 为invalid的parentSel
  var invalidParent = parents.find(parentSel + "[invalid]");
  $.each(invalidParent, function (index, value) {
    var ele = $(this);
    var invalidId = ele.attr("invalid");
    if (ids.includes(invalidId)) {
      ele.remove();
    }
    return true;
  });
}


/* 清除指定组内失效 */
jQuery(clearInvalidArticleFavoritiesInDsgtGroupAsync($));

function clearInvalidArticleFavoritiesInDsgtGroupAsync() {
  var parentsSel = ".container-group";
  var parentSel = ".group-item";
  var btnSel = ".clear-dgst-group-btn";
  var url = contextPath + "/foreclearInvalidArticleFavoritiesInDsgtGroupAsync";

  $(parentsSel).on("click", btnSel, function () {
    if (!checkIsLogin()) return;
    var btn = $(this);
    var data = {
      gid: btn.attr("data-id"),
    };
    $.post(url, data,
      function (data, textStatus, jqXHR) {
        var response = data.split("-");
        var isSuccess = response[0];
        if ("success" == isSuccess) {
          var ids = response[1];
          removeInvalidArticleFavority(ids, parentSel, parentsSel);
          showSuccessTipModal("清除指定组内失效文章", "成功清除！！！");
          hideTipModal();
        } else {
          showDangerTipModal("清除指定组内失效文章", data);
        }
      },
      "text"
    );
  });
}

/* 清除所有组内失效 */
jQuery(clearInvalidArticleFavoritiesInAllGroupAsync($));

function clearInvalidArticleFavoritiesInAllGroupAsync() {
  var parentsSel = "body";
  var parentSel = ".group-item";
  var btnSel = ".clear-all-group-btn";
  var url = contextPath + "/foreclearInvalidAFInAllGroupsAsync";
  $(parentsSel).on("click", btnSel, function () {
    if (!checkIsLogin()) return;
    $.post(url,
      function (data, textStatus, jqXHR) {
        var response = data.split("-");
        var isSuccess = response[0];
        if ("success" == isSuccess) {
          var ids = response[1];
          removeInvalidArticleFavority(ids, parentSel, parentsSel);
          showSuccessTipModal("清除所有组内失效文章", "成功清除！！！");
          hideTipModal();
        } else {
          showDangerTipModal("清除所有组内失效文章", data);
        }
      },
      "text"
    );
  });
}






/* 用户页面-关注用户页面 */


/* 文章页面 */

/* 用户面板 */
jQuery(openAndCloseUserOpPanel($));
/* 展开关闭用户操作面板 */
function openAndCloseUserOpPanel() {
  $(".op-user-panel").click(function (e) {
    var opUserPanel = $(this);
    var open = "open";
    var close = "close";
    var userOpPanel = opUserPanel.prev();
    if (opUserPanel.hasClass(open)) {
      userOpPanel.stop().slideDown();
      opUserPanel.css("transform", "rotate(0)").attr("title", "点击关闭").removeClass(open).addClass(close);
    } else {
      userOpPanel.stop().slideUp();
      opUserPanel.css("transform", "rotate(180deg)").attr("title", "点击打开").removeClass(close).addClass(open);
    }
  });
}


/* 同步检查是否登陆 */
function checkIsLogin() {
  var url = contextPath + "/forecheckIsLogin";
  var isLogin = false;
  $.ajax({
    type: "GET",
    url: url,
    dataType: "text",
    async: false,
    success: function (response) {
      if ("yes" == response) {
        isLogin = true;
      } else {
        // 弹出登陆模态窗口
        $("#login-modal").modal("show");
      }
    }
  });
  return isLogin;
}


/* 公共ajax */
jQuery(publicAjax($));

function publicAjax() {
  $(document).ajaxError(function () {
    showDangerTipModal("发送请求", "失败：请检查网络");
    hideTipModal();
  });
}

/* 异步刷新 */

function loadingAsync(btnSel, successFunc) {
  var asyncEle = $(".async");
  var asyncLoading = asyncEle.find(".async-loading");
  var asyncContainer = asyncEle.find(".async-container");
  if (asyncLoading.length == 0) {
    asyncEle.append("<div class='async-loading'><span class='glyphicon glyphicon-refresh'></span><span class='text-muted'>刷新中。。。</span></div>");
    asyncLoading = asyncEle.find(".async-loading");
  }
  asyncEle.on("click", btnSel, function () {
    $.ajax({
      type: "POST",
      url: "fore/dfadf",
      data: "data",
      dataType: "text",
      beforeSend: function (xhr) {
        asyncContainer.fadeOut();
        asyncLoading.css("display", "flex");
      },
      success: function (response) {
        successFunc(response, asyncContainer);
      },
      error: function () {
        asyncContainer.fadeIn();
        asyncLoading.fadeOut();
        showDangerTipModal("发送请求", "失败：请检查网络");
        hideTipModal();
      }
    });
  });
}




/* 公共模态窗口页面 */

/* 加载字段错误信息map到指定表单 */
function loadFieldErrMsgMapToForm(fieldErrMsgMap, form) {
  // console.log(fieldErrMsgMap);
  for (var [key, value] of fieldErrMsgMap) {
    var jqTd = $(td[key]);
    fieldMap.set(value, jqTd.text());
  }

}

/* 加载操作错误信息到指定表单 */
function loadOpErrMsgToForm(opErrMsg, form) {
  var jqOpErrMsg = form.find(".form-op-errmsg .errmsg");
  jqOpErrMsg.text(opErrMsg).css("visibility", "visible");
}




/*
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 模态窗口页面
 * 
 * 
 * 
 * 
 * 
 * 
 */


/* 登陆模态窗口 */
jQuery(loginModal($));

function loginModal() {
  var modal = $("#login-modal");
  var opErrMsg = modal.find(".form-op-errmsg");
  var errMsg = opErrMsg.find(".errmsg");
  var form = modal.find("#login-form-modal");
  var btn = form.find("button");
  var fieldsOption = {
    name: {
      message: "用户名无效",
      validators: {
        notEmpty: {
          message: "用户名不能为空"
        },
        stringLength: {
          min: 2,
          max: 25,
          message: "标题长度必须在 2 - 25 之间"
        },
      }
    },
    password: {
      message: "密码无效",
      validators: {
        notEmpty: {
          message: "密码不能为空"
        },
        stringLength: {
          min: 5,
          max: 60,
          message: "密码长度必须在 5 - 60 之间"
        },
        identical: {
          field: 'repassword',
          message: "确认密码必须与密码相同",
        },
      }
    },
    repassword: {
      message: "确认密码无效",
      validators: {
        notEmpty: {
          message: "确认密码不能为空"
        },
        identical: {
          field: 'password',
          message: "确认密码必须与密码相同",
        },
      }
    }
  };
  boostrapValidate(form, fieldsOption);
  form.on('success.form.bv', function (e) {
    e.preventDefault();
    var url = contextPath + "/foreloginAsync";
    var data = form.serialize();
    $.ajax({
      type: "POST",
      url: url,
      data: data,
      dataType: "text",
      success: function (response) {
        if (response.startsWith("fore")) {
          window.location.assign(contextPath + "/" + response);
        } else {
          errMsg.text(response);
          opErrMsg.css("visibility", "visible");
        }
      }
    });
  });
}

function getFieldIdFormParentsSelAndExcuteFunc(parentsSel, changeBtn, parentSel, func) {
  $(parentsSel).on("click", changeBtn, function (e) {

    e.preventDefault();
    var btn = $(this);
    var parent = btn.parents(parentSel);
    var id = getIdOnEle(parent);
    func(parent, btn, id);
  });
}

function changeArticleStatuAsync(parent, btn, id) {
  // 检查
  var check = checkOwnArticle(id);
  var isOwn = check[0];
  var articleStatu = check[1];
  if ("no" == isOwn) {
    showDangerTipModal("改变文章状态", "失败：你不配改变此文章状态");
  } else {
    var url = contextPath + "/" + btn.attr("data-href");
    var oldAs = getArticleStatuDesc(articleStatu);
    var newAs = getArticleStatuDesc(getArticleStatuFormUrl(url));
    var modal = $("#change-" + getArticleStatuFormUrl(url));
    modal.modal("show");
    var confirmBtn = modal.find(".confirm-btn");
    confirmBtn.click(function (e) {
      e.preventDefault();
      $.post(url, function (data, textStatus, jqXHR) {
          if ("success" == data) {
            parent.remove();
            modal.modal("hide");
            showSuccessTipModal("改变文章状态", "成功：已由 " + oldAs + " 转到 " + newAs);
            hideTipModal();
          } else {
            showDangerTipModal("改变文章状态", data);
          }
        },
        "text"
      );
    });
  }
}

/* 改变文章状态 */
jQuery(changeArticleStatu($));

function changeArticleStatu() {
  getFieldIdFormParentsSelAndExcuteFunc(".article-ul", ".change-articlestatu-link", ".article-item", changeArticleStatuAsync);
  getFieldIdFormParentsSelAndExcuteFunc(".group-ul", ".change-articlestatu-link", ".group-item", changeArticleStatuAsync);
}

function getArticleStatuDesc(articleStatu) {
  switch (articleStatu) {
    case "WAIT_PUBLISH", "Drafts", "drafts":
      return "草稿箱";
    case "PUBLISH", "Articles", "articles", "article":
      return "文章箱";
    case "DELETED", "Dustbin", "dustbin":
      return "垃圾箱";
  }
  if ("WAIT_PUBLISH" == articleStatu) {
    return "草稿箱";
  } else if ("PUBLISH" == articleStatu) {
    return "文章箱";
  } else if ("DELETED" == articleStatu) {
    return "垃圾箱";
  }
}

function getArticleStatuFormUrl(url) {

  if (url.search("Article") != -1) {
    return "article";
  } else if (url.search("Drafts") != -1) {
    return "drafts";
  } else if (url.search("Dustbin") != -1) {
    return "dustbin";
  }
}







/* 编辑用户信息页面 */
jQuery(editUserForm($));

function editUserForm() {
  var editUserForm = $(".user-form");
  var parent = editUserForm.parents("#userpwd-setting");
  var susccessOpMsg = parent.find();
  var errOpMsg = parent.find(".form-op-errmsg");
  var errMsg = errOpMsg.find(".errmsg");
  var fieldsOption = {
    password: {
      message: "密码无效",
      validators: {
        notEmpty: {
          message: "密码不能为空"
        },
        stringLength: {
          min: 5,
          max: 60,
          message: "密码长度必须在 5 - 60 之间"
        },
        identical: {
          field: 'repassword',
          message: "确认密码必须与密码相同",
        },
      }
    },
    repassword: {
      message: "确认密码无效",
      validators: {
        notEmpty: {
          message: "确认密码不能为空"
        },
        identical: {
          field: 'password',
          message: "确认密码必须与密码相同",
        },
      }
    }
  };
  boostrapValidate(editUserForm, fieldsOption);
  /*
	 * editUserForm.on('success.form.bv', function (e) { e.preventDefault(); var
	 * data = editUserForm.serialize(); var url = editUserForm.attr("action");
	 * $.post(url, data, function (data, textStatus, jqXHR) { if ("success" ==
	 * data) { showAndHideSuccessTipToast("修改密码成功"); } else { errMsg.text(data);
	 * errOpMsg.css("visibility", "visible"); } }, "dataType" ); });
	 */
}






/* 错误页面 */
jQuery(backToNextPage($));

function backToNextPage() {
  var backNextPage = $(".back-to-next-page");
  backNextPage.click(function (e) {
    window.history.back();
  });
}

/* 拖拽 */
jQuery(drag($));

// 拖拽部件最好不要用动画，transition
function drag() {
  // var dragPart = $(".drag-part");
  $("body").on("mousedown", ".drag-part", function (e) {
    var dragPart = $(this);
    dragPart.draggable({
      /* containment: "body" */
    }).delay(3000).draggable({
      revert: true
    });
  });
}


/* 在指定选择器展示倒计时时间 */
function showCountDownSeconds(intervalVar, spanSel, initCountDownNum, delay) {
  clearInterval(intervalVar);
  var temp = initCountDownNum;
  $(spanSel).text(temp);
  intervalVar = setInterval(function () {
    temp -= 1;
    $(spanSel).text(temp);
    if (temp == 0) {
      clearInterval(intervalVar);
      /* intervalVar = null; */
    }
  }, delay);
}



/* 编辑文章页面 */

$(function () {
  $("[data-toggle='popover']").popover();
});
$(function () {
  $("[data-toggle='tooltip']").tooltip();
});


/* 检查文章和文章内容 */
function checkOwnArticleConetnt(aid, acid) {
  var url = contextPath + "/forecheckOwnArticleContent";
  /* isOwn-isMatch */
  var data = {
    aid: aid,
    acid: acid,
  };
  var check = "";
  $.ajax({
    type: "POST",
    url: url,
    data: data,
    async: false,
    dataType: "text",
    success: function (response) {
      check = response.split("-");
    }
  });
  return check;
}



/* 自动保存文章内容 */
jQuery(autoSaveArticleContent($));

function autoSaveArticleContent() {
  var form = $("#edit-articlecontent-form");
  var fieldsOption = {
    id: {
      message: "文章内容ID无效",
      validators: {
        notEmpty: {
          message: "文章内容ID不能为空"
        },
      }
    },
    aid: {
      message: "文章ID无效",
      validators: {
        notEmpty: {
          message: "文章ID不能为空"
        },
      }
    },
  };
  // 表单验证
  boostrapValidate(form, fieldsOption);
  form.on('error.form.bv', function (e) {
    // form.data('bootstrapValidator').resetForm();
    showAndHideDangerTipToast("老弟，表单有误");
  }).on('success.form.bv', function (e) {
    if (!showArticleMarkdown.getMarkdown()) {
      e.preventDefault();
      form.data('bootstrapValidator').resetForm();
      showAndHideDangerTipToast("老弟，文章内容不能为空");
      return;
    } else if (showArticleMarkdown.getMarkdown().length < 5) {
      e.preventDefault();
      form.data('bootstrapValidator').resetForm();
      showAndHideDangerTipToast("老弟，文章内容至少要在5以上");
      return;
    }
  });

  // 监听自动保存按钮的值是否改变(有 当文章内容改变后间隔指定秒数后保存、没有 销毁计数器手动保存)
  var autoSave = $("input[name=isAutoSave]");
  // var textarea = $("#edit-articlecontent-form textarea");
  var spanSel = ".countdown-time";
  var initCountDownNum = 10;
  var editArticleTimeOut, delay = initCountDownNum * 1000;
  var countDownSeconds;
  autoSave.change(function (e) {
    if (autoSave.prop("checked")) {
      showAndHideSuccessTipToast("已开启自动保存文章");
      showArticleMarkdown.on("change", function () {
        // 判断是否验证
        if (!form.data('bootstrapValidator').isValid()) {
          // 手动验证
          form.data('bootstrapValidator').validate();
        }
        if (!showArticleMarkdown.getMarkdown()) {
          e.preventDefault();
          showAndHideDangerTipToast("老弟，文章内容不能为空");
          clearTimeout(editArticleTimeOut);
          return;
        } else if (showArticleMarkdown.getMarkdown().length < 5) {
          e.preventDefault();
          // form.data('bootstrapValidator').resetForm();
          showAndHideDangerTipToast("老弟，文章内容至少要在5以上");
          clearTimeout(editArticleTimeOut);
          return;
        }
        /* countDownSeconds = null; */
        showCountDownSeconds(countDownSeconds, spanSel, initCountDownNum, 1000);
        clearTimeout(editArticleTimeOut);
        $(spanSel).text(initCountDownNum);

        editArticleTimeOut = setTimeout(function () {
          var formData = new FormData(form.get(0));
          // console.log(formData);
          // console.log(formData.get("mdContent"));
          // 检查文章内容
          var check = checkOwnArticleConetnt(formData.get("aid"), formData.get("id"));
          var isOwn = check[0];
          var isMatch = check[1];
          if ("no" == isOwn) {
            showDangerTipModal("编辑文章内容", "失败：你不配编辑此文章");
            return;
          }
          if ("no" == isMatch) {
            showDangerTipModal("编辑文章内容", "失败：文章与文章内容的ID不符合");
            return;
          }
          if ("yes" == isOwn && "yes" == isMatch) {
            var url = contextPath + "/foreeditArticleContentAsync";
            var data = {
              id: formData.get("id"),
              aid: formData.get("aid"),
              mdContent: formData.get("mdContent"),
            };
            $.post(url, data,
              function (data, textStatus, jqXHR) {
                if ("success" == data) {
                  showAndHideSuccessTipToast("成功保存文章");
                } else {
                  showAndHideDangerTipToast(data);
                }
              },
              "text"
            );
          }
        }, delay);
      });
    } else {
      showAndHideSuccessTipToast("已取消自动保存文章");
      showArticleMarkdown.off("change");
      clearInterval(countDownSeconds);
      clearTimeout(editArticleTimeOut);
      $(spanSel).text(initCountDownNum);
    }
  });
}


/* 编辑文章内容 */
function editArticleContent() {
  var saveArticleBtn = $(".save-article-btn");
  var fieldsOption = {

  };
  saveArticleBtn.click(function (e) {
    e.preventDefault();
    var form = $(this).parents("form");
    var aid = form.find("[name=aid]").val();
    var check = checkOwnArticle(aid);
    var isOwn = check[0];
    var articleStatu = check[1];
    var isOwn = check[0];
    var articleStatu = check[1];
    if ("no" == isOwn) {
      showDangerTipModal("编辑文章", "失败：你不配编辑此文章");
      return;
    }
    if ("DELETED" == articleStatu) {
      showDangerTipModal("编辑文章", "失败：不能编辑垃圾文章");
      return;
    }
    if ("yes" == isOwn && !"DELETED" == articleStatu) {
      var url = form.attr("action");
      var formData = new FormData(form.get(0));
      $.ajax({
        type: "POST",
        url: url,
        data: formData,
        dataType: "text",
        success: function (response) {
          if ("success" == response) {
            showSuccessTipModal("编辑文章内容", "成功：已保存");
            hideTipModal();
          } else {
            showAndHideDangerTipToast(response);
          }
        }
      });
    }

  });
}


/* 搜索页面 */

/* 搜索栏 */
jQuery(searchBar($));

function searchBar() {
  var form = $(".search-user-article-form");
  var fieldsOption = {
    title: {
      message: "文章标题无效",
      validators: {
        notEmpty: {
          message: "文章标题不能为空"
        },
      },
    },
  };
  boostrapValidate(form, fieldsOption);
}


/* 用户设置页面 */

/* 保存部分用户设置 */
jQuery(savePartOfUserSetting($));

function savePartOfUserSetting() {
  var parentsSel = ".user-setting-panel";
  var btnSel = ".save-part-usersetting-btn";
  var inputSel = "input[type=checkbox]";
  $(parentsSel).on("click", inputSel, function () {

    var input = $(this);
    var inputName = input.attr("name");
    var parent = input.parents(parentsSel);
    var panelFooter = parent.find(".panel-footer");
    var btn = parent.find(btnSel);
    var origin = parent.find("[field=" + inputName + "]");
    var originVal = origin.text();
    var inputVal = (input.prop("checked")) ? 1 : 0;
    if (originVal == inputVal) {
      btn.attr("disabled", true);
      panelFooter.slideUp();
      return;
    } else {
      btn.attr("disabled", false);
      panelFooter.slideDown();
    }
    btn.unbind("click").bind("click", function () {
      var formData = new FormData();
      formData.append(inputName, inputVal);
      var url = contextPath + "/foresaveUserSettingOfHistoryAsync";
      $.ajax({
        type: "POST",
        url: url,
        data: formData,
        dataType: "text",
        cache: false,
        contentType: false,
        processData: false,
        mimeType: "multipart/form-data",
        success: function (response) {
          if ("fail" == response) {
            input.click();
            showAndHideDangerTipToast("用户设置失败")
          } else {
            origin.text(inputVal);
            showAndHideSuccessTipToast(response);
            btn.attr("disabled", true);
            panelFooter.slideUp();
          }
        }
      });
    })
  });
}

/* 文章历史页面 */

/* 删除文章历史 */
jQuery(deleteArticleHistory($));

function deleteArticleHistory() {
  var btnSel = ".delete-ah-btn";
  var parentSel = ".article-history-item";
  var parentsSel = ".article-history-body";
  var parents = $(parentsSel);
  parents.on("click", btnSel, function () {
    var btn = $(this);
    var parent = btn.parents(parentSel);
    var url = contextPath + "/foredeleteArticleHistoryAsync";
    var data = {
      ahid: btn.attr("data-id"),
    };
    $.post(url, data,
      function (data, textStatus, jqXHR) {
        if ("success" == data) {
          parent.slideUp("fast", function () {
            parent.remove();
            showAndHideSuccessTipToast("删除文章历史成功");
            showNoArticleHistoryHtml(parentsSel, parentSel);
          });
        } else {
          showAndHideDangerTipToast(data);
        }
      },
      "text"
    );
  });
}

/* 清空文章历史 */
jQuery(clearArticleHistory($));

function clearArticleHistory() {
  var btnSel = ".clear-ah-btn";
  var parentSel = ".article-history-item";
  var parentsSel = ".article-history";
  var parents = $(parentsSel);
  var parent = parents.find(parentSel);
  parents.on("click", btnSel, function () {
    var url = contextPath + "/foreclearArticleHistoryAsync";
    $.post(url, function (data, textStatus, jqXHR) {
        if ("success" == data) {
          parent.slideUp(function () {
            parent.remove();
            showAndHideSuccessTipToast("清空文章历史成功");
            showNoArticleHistoryHtml(".article-history-body", parentSel);
          });
        } else {
          showAndHideNormalTipToast(data);
        }
      },
      "text"
    );
  });
}
/* 当没有父元素时往祖父元素添加html 展示没有文章历史Html */
function showNoArticleHistoryHtml(parentsSel, parentSel) {
  var parents = $(parentsSel);
  var parent = parents.find(parentSel);
  if (parent.length != 0) return;
  var noArticleHistory = $(`<div class="jumbotron no-articlehistory"><h2>目前还未有 <span class="glyphicon glyphicon-time"></span>文章历史，请去<a href="${contextPath}/forehome">首页</a></h2></div>`);
  if ($(".no-articlehistory").length == 0) {
    parents.append(noArticleHistory);
  }
}