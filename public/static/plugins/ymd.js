var SYT="-请选择年份-";
var SMT="-请选择月份-";
var SDT="-请选择日期-";
var BYN=50;//年份范围往前50年
var AYN=5;//年份范围往后0年
function YMDselect(){
	this.SelY=document.getElementsByName(arguments[0])[0];
	this.SelM=document.getElementsByName(arguments[1])[0];
	this.SelD=document.getElementsByName(arguments[2])[0];
	this.DefY=this.SelD?arguments[3]:arguments[2];
	this.DefM=this.SelD?arguments[4]:arguments[3];
	this.DefD=this.SelD?arguments[5]:arguments[4];
	this.SelY.YMD=this;
	this.SelM.YMD=this;
	this.SelY.onchange=function(){YMDselect.SetM(this.YMD)};
	if(this.SelD)this.SelM.onchange=function(){YMDselect.SetD(this.YMD)};
	YMDselect.SetY(this)
};
//设置年份
YMDselect.SetY=function(YMD){
	var dDate = new Date();
	var dCurYear = dDate.getFullYear();
	YMD.SelY.options.add(new Option(SYT,'0'));
	for(var i = dCurYear+AYN; i>(dCurYear-BYN); i--){
		var YMDYT=i+'年';
		var YMDYV=i;
		var OptY = new Option(YMDYT,YMDYV);
		YMD.SelY.options.add(OptY);
		if(YMD.DefY==YMDYV) OptY.selected=true
	}
	YMDselect.SetM(YMD)
};
//设置月份
YMDselect.SetM=function(YMD){
	YMD.SelM.length = 0;
	YMD.SelM.options.add(new Option(SMT,'0'));
	if(YMD.SelY.value>0){
		for(var i=1;i<=12;i++){
			var YMDMT=i+'月';
			var YMDMV=i;
			var OptM=new Option(YMDMT,YMDMV);
			YMD.SelM.options.add(OptM);
			if(YMD.DefM==YMDMV) OptM.selected=true
		}
	}
	if(YMD.SelD)YMDselect.SetD(YMD)
};
//设置日期
YMDselect.SetD=function(YMD){
	var YI=YMD.SelY.value;
	var MI=YMD.SelM.value;
	YMD.SelD.length = 0;
	YMD.SelD.options.add(new Option(SDT,'0'));
	if(YI>0 && MI>0){
		var dPrevDate = new Date(YI, MI, 0);
		var daysInMonth=dPrevDate.getDate();
		for (var d = 1; d <= parseInt(daysInMonth); d++) {
			var YMDDT=d+'日';
			var YMDDV=d;
			var OptD=new Option(YMDDT,YMDDV);
			YMD.SelD.options.add(OptD);
			if(YMD.DefD==YMDDV)OptD.selected=true
		}
	}
}
