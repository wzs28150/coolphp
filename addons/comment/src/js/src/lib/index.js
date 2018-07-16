define(["jquery", "easyEditor", "alertinfo"], function($, easyEditor, alertinfo) {
  var indexModule, myeditor, submit, editor = easyEditor('easyEditor'),
    emojiBtn = document.getElementById('emoji_btn'),
    emojiBox = document.getElementById('emoji_list'),
    emojiList = emojiBox.getElementsByTagName('img'),
    maskClick, isParent, addEvent, htmlEncode;

  maskClick = function(el, func) {
    var str = str == undefined ? 'maskClick' : str;
    addEvent(document, 'mouseup', function(event) {
      var event = event || window.event;
      var target = event.target;
      if (!isParent(target, el)) {
        func && func();
      }
    });
  }

  isParent = function(obj, parentObj) {
    while (obj != undefined && obj != null && obj.tagName != 'HTML' && obj.tagName.toUpperCase() != 'BODY') {
      if (obj == parentObj) {
        return true;
      }
      obj = obj.parentNode;
    }
    return false;
  }
  // 事件辦定
  addEvent = function(element, type, callback) {
    if (element.addEventListener) {
      element.addEventListener(type, callback, false);
    } else if (element.attachEvent) {
      element.attachEvent('on' + type, callback)
    }
  }
  // 正则转换
  htmlEncode = function(html) {
    var temp = document.createElement("div");
    (temp.textContent != undefined) ? (temp.textContent = html) : (temp.innerText = html);
    var output = temp.innerHTML;
    temp = null;
    return output;
  }
  // 编辑器显示
  myeditor = function() {
    editor.placeholder('请输入评论内容...');
    editor.closePlaceholder();
    //辦定事件添加表情
    for (var i = 0; i < emojiList.length; i++) {
      addEvent(emojiList[i], 'click', function() {
        var src = this.getAttribute('src');
        var remark = this.getAttribute('alt');
        editor.insertEmoji({
          src: src,
          remark: remark,
        }); //添加表情
        emojiBox.style.display = 'none';
      });
    }

    //表情面板顯示
    addEvent(emojiBtn, 'click', function() {
      emojiBox.style.display = 'block';
    });
    //表情面板消失
    maskClick(emojiBox, function() {
      emojiBox.style.display = 'none';
    });

  }

  submit = function() {
    var content = htmlEncode(editor.getContent({
      emojiSign: '|', //表情分隔符
      blockSign: '%' //行块分隔符
    }));
    var flag = 0;
    $('#comment-form input').each(function(index, el) {
      var msg = $(this).data('msg');
      if (!$(this).val()) {
        flag = 1;
        alertinfo(msg);
        return false;
      }
    });
    var t = $('#comment-form').serializeArray();
    t.push({
      name: "content",
      value: content
    });
    var url = $('#comment-form').data('url');
    if (flag != 1) {
      $.post(url, t, function(result) {
        alertinfo(result.msg);
        listshow();
      });
    }
  }

  listshow = function() {
    var aid = $('#comment-aid').val();
    var url = $('#comment-list').data('url');
    $.post(url, {
        'aid': aid
      },
      function(result) {
        if ('1' == result.code) {
          // console.log(result.data);
          var html = '';
          $.each(result.data, function(index, item) {
            html += '<li>';　
            html += '<img src="/addons/comment/src/img/none.png" class="avatar" height="50" width="50">';　
            html += '<h6 class="uk-comment-title uk-clearfix">';
            html += '<cite>' + item.name + '</cite>';
            // html += '<span class="fa fa-heart-o" data-id="' + item.id + '" ></span>';
            html += '<time> ' + item.addtime + '</time>';
            html += '</h6>';
            html += '<p>' + item.content + '</p>';
            html += '</li>';　　　　
          });
          var num = result.data.length;
          $('#comment-list ul').html(html);
          $('.comment h2 i').html(num);
        } else {
          var html = '';
          html += '<li class="no">';　
          html += '<p>还没有评论，快来抢沙发吧！</p>';
          html += '</li>';　　
          $('#comment-list ul').html(html);
        }
      }, "json"
    );
  }

  zanclick = function() {
    $('body').on('click', '.comment .comment-list ul li h6 span', function() {
      var id = $(this).data('id');
      $.post('/addons_execute_comment-index-zan.html', {
          'id': id
        },
        function(result) {
          if ('1' == result.code) {
            alertinfo(result.msg);
          }
        }, "json"
      );
    })

  }

  likes = function functionName() {
    $('body').on('click','.likes a',function () {
      var aid = $('#likes-aid').val();
      var title = $('#likes-title').val();
      var url = $('#likes-url').val();
      $.post('/addons_execute_comment-index-likes.html', {
          'aid': aid,
          'title': title,
          'url': url
        },
        function(result) {
          console.log(result);
          if ('1' == result.code) {
            // alertinfo(result.msg);
            $('.likes a').removeClass('fa-heart-o').addClass('fa-heart');
          }
        }, "json"
      );
    })
  }

  indexModule = function() {
    $(document).ready(function() {
      myeditor();
      //提交
      $('body').on('click', '#comment-submit', function() {
        submit();
      })
      zanclick()

      listshow();
      //判断是否开启点赞
      if($('.likes').index()>0){
        likes();
      }
    });
  };

  return indexModule;
});
