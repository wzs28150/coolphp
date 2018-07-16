require.config({
  urlArgs: "bust=" + (new Date()).getTime(),

  shim: {

  },
  paths: {
    domReady: './domReady',
    jquery: "package/jquery/jquery-2.1.4.min",
    easyEditor: "package/easyEditor/easyEditor",
    alertinfo:"package/core/alertinfo/alertinfo"
  }
});
require(["domReady", './lib/index'], function (domReady, index) {
  index();
});
