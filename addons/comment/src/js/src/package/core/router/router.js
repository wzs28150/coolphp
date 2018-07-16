define(["debouncedresize"], function (debouncedresize) {
  var initModule, router, navactive, sub_nav, backtotop;

  /**
   * 回到顶部
   * @return {[type]} [description]
   */
  backtotop = function () {
    // console.log(1);
    var min_height = 500;
    $(window).scroll(function () {
      //获取窗口的滚动条的垂直位置
      var s = $(window).scrollTop();
      //当窗口的滚动条的垂直位置大于页面的最小高度时，让返回顶部元素渐现，否则渐隐
      if (s > min_height) {
        $(".backtotop").fadeIn(100);
      } else {
        $(".backtotop").fadeOut(200);
      };
    });
    $('.backtotop a.totop').on('click', function (event) {
      event.preventDefault();
      $('body,html').animate({
        scrollTop: 0,
      }, 700);
    });
  };
  /**
   * 导航选中状态
   * @param  {[type]} i [description]
   * @return {[type]}   [description]
   */
  navactive = function (i) {
    $('nav a').removeClass('on');
    $('nav a').eq(i).addClass('on');
    if ($(window).width() < 980) {
      $('nav a').click(function () {
        $('#myInput').attr('checked', false);
      });
    }
    $(window).on('debouncedresize', function () {
      if ($(window).width() < 980) {
        $('nav a').click(function () {
          $('#myInput').attr('checked', false);
        });
      }
    });

  };
  /**
   * 二级导航
   * @return {[type]} [description]
   */
  sub_nav = function (i) {
    $('.er-bar .er-nav a').removeClass('on');
    $('.er-bar .er-nav a').eq(i).addClass('on');

    if ($(window).width() < 980) {
      $('.er-bar .er-nav a').click(function () {
        $('#ermenu').attr('checked', false);
      });
    }
    $(window).on('debouncedresize', function () {
      if ($(window).width() < 980) {
        $('.er-bar .er-nav a').click(function () {
          $('#ermenu').attr('checked', false);
        });
      }
    });

    if ($(".er-bar-targat").length > 0 && $(window).width() > 980) {
      $(window).scroll(function () {
        var navH = $(".er-bar-targat").offset().top;
        //获取滚动条的滑动距离
        var scroH = $(this).scrollTop();
        //滚动条的滑动距离大于等于定位元素距离浏览器顶部的距离，就固定，反之就不固定
        if (scroH >= navH) {
          $(".er-bar").addClass('on');
        } else if (scroH < navH) {
          $(".er-bar").removeClass('on');
        }
      })
    }

  }
  /**
   * 路由设置
   * @return {[type]} [description]
   */
  router = function (article, state) {
    var action = $(article).attr('data-main');
    var eraction = $('.eraction').attr('data-fun');
    //console.log(action);
    //console.log(eraction);
    // 判断主action
    if (action) {
      //判断主二级action
      if (eraction) {
        //判断是否无刷新
        if (state && localStorage.mainaction && localStorage.mainaction == action) {
          require(['./lib/' + action], function (action) {
            var str = "action." + eraction + "(function(a){sub_nav(a);})"
            eval(str);
            //console.log(str);
          });
        } else {
          localStorage.mainaction = action;
          require(['./lib/' + action], function (action) {
            //console.log(action);
            action.initModule(function (a) {
              navactive(a);
            });
            var str = "action." + eraction + "(function(a){sub_nav(a);})"
            //console.log(str);
            eval(str);
          });
        }
      } else {
        localStorage.mainaction = action;
        require(['./lib/' + action], function (action) {
          action.initModule(function (a) {
            navactive(a);
            sub_nav();
          });
        });
      }

    }
  };
  initModule = function (article, state) {

    router(article, state);

  };
  return {
    initModule: initModule
  };
})