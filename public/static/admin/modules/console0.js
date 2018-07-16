/** layuiAdmin.std-v1.0.0 LPPL License By http://www.layui.com/admin/ */ ;
layui.define(function(e) {
  layui.use(["admin", "carousel"], function() {
    var e = layui.$,
      t = (layui.admin,
        layui.carousel),
      a = layui.element,
      i = layui.device();
    e(".layadmin-carousel").each(function() {
        var a = e(this);
        t.render({
          elem: this,
          width: "100%",
          arrow: "none",
          interval: a.data("interval"),
          autoplay: a.data("autoplay") === !0,
          trigger: i.ios || i.android ? "click" : "hover",
          anim: a.data("anim")
        })
      }),
      a.render("progress")
  });
  layui.use(["carousel", "echarts"], function() {
    var e = layui.$;
    e.get('/admin/index/getpv', function(data, textStatus, xhr) {
      if (data) {
        var t = layui.carousel,
          a = layui.echarts,
          i = [],
          l = [{
            title: {
              text: "今日流量趋势",
              x: "center",
              textStyle: {
                fontSize: 14
              }
            },
            tooltip: {
              trigger: "axis"
            },
            legend: {
              data: ["", ""]
            },
            xAxis: [{
              type: "category",
              boundaryGap: false,
              data: data.riqistr
            }],
            yAxis: [{
              type: "value"
            }],
            series: [{
              name: "PV",
              type: "line",
              smooth: !0,
              itemStyle: {
                normal: {
                  areaStyle: {
                    type: "default"
                  }
                }
              },
              data: data.pvstr
            },
            {
              name: "UV",
              type: "line",
              smooth: !0,
              itemStyle: {
                normal: {
                  areaStyle: {
                    type: "default"
                  }
                }
              },
              data: data.uvstr
            }]
          }],
          n = e("#LAY-index-dataview").children("div"),
          r = function(e) {
            i[e] = a.init(n[e], layui.echartsTheme),
              i[e].setOption(l[e]),
              window.onresize = i[e].resize
          };
        if (n[0]) {
          r(0);
          var o = 0;
          t.on("change(LAY-index-dataview)", function(e) {
              r(o = e.index)
            }),
            layui.admin.on("side", function() {
              setTimeout(function() {
                r(o)
              }, 300)
            }),
            layui.admin.on("hash(tab)", function() {
              layui.router().path.join("") || r(o)
            })
        }
      }
    }, 'json');
  });
  layui.use("table", function() {
      var e = (layui.$,
        layui.table);
      e.render({
          elem: "#LAY-index-topSearch",
          url: "",
          page: !0,
          cols: [
            [{
              type: "numbers",
              fixed: "left"
            }, {
              field: "keywords",
              title: "关键词",
              minWidth: 300,
              templet: '<div><a href="https://www.baidu.com/s?wd={{ d.keywords }}" target="_blank" class="layui-table-link">{{ d.keywords }}</div>'
            }, {
              field: "frequency",
              title: "搜索次数",
              minWidth: 120,
              sort: !0
            }, {
              field: "userNums",
              title: "用户数",
              sort: !0
            }]
          ],
          skin: "line"
        }),
        e.render({
          elem: "#LAY-index-topCard",
          url: "",
          page: !0,
          cellMinWidth: 120,
          cols: [
            [{
              type: "numbers",
              fixed: "left"
            }, {
              field: "title",
              title: "标题",
              minWidth: 300,
              templet: '<div><a href="{{ d.href }}" target="_blank" class="layui-table-link">{{ d.title }}</div>'
            }, {
              field: "username",
              title: "发帖者"
            }, {
              field: "channel",
              title: "类别"
            }, {
              field: "crt",
              title: "点击率",
              sort: !0
            }]
          ],
          skin: "line"
        })
    }),
    layui.use('element', function() {
      var $ = layui.jquery,
        element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

      $.get('/admin/index/getsysinfo/type/cpu', function(data, textStatus, xhr) {
        if (data) {
          element.progress('demo', data.cpu + '%');
          element.progress('demo2', data.memory + '%');
        }
      }, 'json');

      // timer2 = setInterval(function() {
      //   $.get('/admin/index/getsysinfo/type/memory', function(data, textStatus, xhr) {
      //     if(data){
      //       element.progress('demo2', data + '%');
      //     }
      //   },'json');
      //
      // }, 3000 );

    })
  e("console", {})
});
