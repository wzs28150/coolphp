define([], function() {
  var initModule,alertinfo;



  /**
   * 弹窗
   * @param  {[type]} info [description]
   * @param  {[type]} aurl [description]
   * @return {[type]}      [description]
   */
  initModule = function(info, aurl) {
    if($('.alert_player').index()>0){
      $('.alert_player').fadeIn();
      $('.alert_player .info').html(info);
      if (aurl === undefined) {} else {
        $('.alert_player .queren_btn,.alert_player .bg').click(function() {
          location.href = aurl;
        })
      }
      $('.alert_player .bg,.alert_player .queren_btn').click(function() {
        $('.alert_player').fadeOut();
      });
    }else{
      alert(info);
      if (aurl === undefined) {} else {
        location.href = aurl;
      }
    }

  };

  return initModule;
})
