define([], function() {
  var initModule, $config = {
    isdebug: true,
    isdebugauth: 0
  };

  initModule = function($str, $auth) {
    if (!$auth) {
      $auth = 1;
    }
    if ($config.isdebug || $auth == 1) {
      if ($config.isdebugauth == 0) {
        //全部显示
        console.log($str + ' - Created by wzs')
      } else if ($config.isdebugauth == 1) {
        //显示权限1
        if ($auth == 1) {
          console.log($str + ' - Created by wzs')
        }
      }else if ($config.isdebugauth == 2) {
        //显示权限2
        if ($auth == 2) {
          console.log($str + ' - Created by wzs')
        }
      }
    }

  };

  return {
    initModule: initModule
  };
})
