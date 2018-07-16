define(['pjax', 'debug', 'alertinfo'], function(pjax, debug, alertinfo) {
  var initModule, pageajax, targetelement, debug = debug.initModule,
    pclick, psend;

  /**
   * pclick 处理点击
   * @type {[type]}
   */

  pclick = function(article) {
    $(document).off('click', 'a[data-ajax!=no]').on('click', 'a[data-ajax!=no]', function(event) {
      event.preventDefault();
      var container = article,
        url = $(this).attr("href"),
        container = $(this).attr("data-container"),
        fragment = $(this).attr("data-fragment"),
        istop = $(this).attr('data-istop');
      targetelement = $(this).attr('data-target');
      debug(url, 2);
      //判断url是否为空
      if (!url) {
        alertinfo.initModule('网站维护中...')
      }
      if (container) {
        container = '.' + container;
      } else {
        container = article;
      }

      if (fragment) {
        fragment = '.' + fragment;
      } else {
        fragment = article;
      }

      $('.pjaxcontainer').removeClass('pjaxcontainer');
      $(container).addClass('pjaxcontainer');
      $('.pjaxcontainer').addClass('on');
      $.pjax({
        url: url,
        container: container,
        fragment: fragment,
        timeout: 8000,
        scrollTo: false
      });
      $.pjax.click(event, container);
      if (!istop) {
        if (targetelement && $('article').attr('data-main') == localStorage.mainaction) {

        } else {
          $('html,body').animate({
            scrollTop: 0,
          }, 400);
        }
      }
    });
  }

  /**
   * psend 发送
   * @type {[type]}
   */
  psend = function(start) {
    $(document).on('pjax:send', function(event) { //pjax链接点击后显示加载动画
      $("#progress").removeClass("done"); //完成，隐藏进度条
      $('.pjaxcontainer').removeClass('on');
      start();
      $({
        property: 0
      }).animate({
        property: 100
      }, {
        duration: 1000,
        step: function() {
          var percentage = Math.round(this.property);

          $('#progress').css('width', percentage + "%");
          if (percentage == 100) {
            $("#progress").addClass("done"); //完成，隐藏进度条
          }
        }
      });
    });
  }
  /**
   * pajax 页面无刷新
   * @return {[type]} [description]
   */
  pageajax = function(article, start, callbak) {
    if ($.support.pjax) {
      //点击
      pclick(article);
      //无刷新前
      psend(start);
      //加载完成后替换title
      $(document).on('pjax:success', function(data, status, xhr, options) {
        $(window).unbind('scroll');
      });

      $(document).on('pjax:complete', function() {
        $("#progress").addClass("done"); //完成，隐藏进度条
      });

      $(document).on('pjax:end', function(data, status, xhr, options) {
        //console.log(data);
        $('title').text(data.currentTarget.title);
        $('.pjaxcontainer').removeClass('on');
        if (xhr.container != 'main') {
          callbak(targetelement, true);
        } else {
          callbak(targetelement, false);
        }
        //$('title').text(data.relatedTarget.innerText + ' - 润泰');
      });
      
      $(document).on('pjax:error', function() {
        console.log("加载失败!");
      });
      $(document).on('pjax:popstate', function(data, status, xhr, options) {});
    }
  };

  initModule = function(article, start, callbak) {
    pageajax(article, start, callbak);
  };
  return {
    initModule: initModule
  };
})
