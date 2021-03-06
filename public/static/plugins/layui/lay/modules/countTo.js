layui.define('jquery', function(exports){
  var $ = layui.jquery;

  $.fn.countTo = function(a) {
      a = a || {};
      return $(this).each(function() {
          var c = $.extend({},
          $.fn.countTo.defaults, {
              from: $(this).data("from"),
              to: $(this).data("to"),
              speed: $(this).data("speed"),
              refreshInterval: $(this).data("refresh-interval"),
              decimals: $(this).data("decimals")
          },
          a);
          var h = Math.ceil(c.speed / c.refreshInterval),
          i = (c.to - c.from) / h;
          var j = this,
          f = $(this),
          e = 0,
          g = c.from,
          d = f.data("countTo") || {};
          f.data("countTo", d);
          if (d.interval) {
              clearInterval(d.interval)
          }
          d.interval = setInterval(k, c.refreshInterval);
          b(g);

          function k() {
              g += i;
              e++;
              b(g);
              if (typeof(c.onUpdate) == "function") {
                  c.onUpdate.call(j, g)
              }

              if (e >= h) {
                  f.removeData("countTo");
                  clearInterval(d.interval);
                  g = c.to;
                  if (typeof(c.onComplete) == "function") {
                      c.onComplete.call(j, g)
                  }
              }
          }
          function b(m) {
              var l = c.formatter.call(j, m, c);
              // console.log(j);
              f.html(l)
          }
      })
  };
  $.fn.countTo.defaults = {
      from: 0,
      to: 0,
      speed: 1000,
      refreshInterval: 100,
      decimals: 0,
      formatter: formatter,
      onUpdate: null,
      onComplete: null
  };
  function formatter(b, a) {
      return Math.round(b)
  }
  $("#count-number").data("countToOptions", {
      formatter: function(b, a) {
          return Math.ceil(b).replace(/\B(?=(?:\d{3})+(?!\d))/g, ",")
      }
  });

  function count(a) {
      var b = $(this);
      a = $.extend({},
      a || {},
      b.data("countToOptions") || {});
      b.countTo(a)
  };

  var obj = {
    init: function(str){
      $(".timer").each(count);
    }
  };

  //输出test接口
  exports('countTo', obj);
});
