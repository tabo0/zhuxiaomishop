/*获取元素*/
function Mi(v){return document.querySelector(v)}

/*公共方法*/
function displays(f,v){ /*display*/
	Mi(f).style.display = v;
}
function displays2(f,v){ /*display*/
	f.style.display = v;
}
/*数据*/
var topbar = new Array();
var header = new Array();
var headerChild = new Array();
var bannerNav = new Array();
var banner = new Array();
var bannerNavChild = new Array();

topbar = [
	[
		{'href':'javascript:;','txt':'小米商城'},
		{'href':'javascript:;','txt':'MIUI'},
		{'href':'javascript:;','txt':'IoT'},
		{'href':'javascript:;','txt':'云服务'},
		{'href':'javascript:;','txt':'水滴'},
		{'href':'javascript:;','txt':'金融'},
		{'href':'javascript:;','txt':'有品'},
		{'href':'javascript:;','txt':'Select Region'},
	],
	[
		{'href':'javascript:;','txt':'登录'},
		{'href':'javascript:;','txt':'注册'},
		{'href':'javascript:;','txt':'消息通知'},
	]
];
header = [
	{'typeid':0,'child':1,'href':'javascript:;','txt':'小米手机'},
	{'typeid':1,'child':1,'href':'javascript:;','txt':'红米'},
	{'typeid':2,'child':1,'href':'javascript:;','txt':'电视'},
	{'typeid':3,'child':1,'href':'javascript:;','txt':'笔记本'},
	{'typeid':4,'child':1,'href':'javascript:;','txt':'盒子'},
	{'typeid':5,'child':1,'href':'javascript:;','txt':'新品'},
	{'typeid':6,'child':1,'href':'javascript:;','txt':'路由器'},
	{'typeid':7,'child':1,'href':'javascript:;','txt':'智能硬件'},
	{'typeid':8,'child':0,'href':'javascript:;','txt':'服务'},
	{'typeid':9,'child':0,'href':'javascript:;','txt':'社区'},
];
headerChild = [
	[
		{'price':'333','src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2s320-220white.png','href':'https://www.mi.com/mix2s/','txt':'小米MIX 2S'},
		{'price':'222','src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
	],
	[
		{'price':'333','src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2s320-220white.png','href':'https://www.mi.com/mix2s/','txt':'小米MIX 2S'},
		{'price':'222','src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2320-220.png','href':'https://www.mi.com/mix2/','txt':'小米MIX 2'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/note2320x220.png','href':'https://www.mi.com/minote3/','txt':'小米Note 3'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
	],
	[
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2s320-220white.png','href':'https://www.mi.com/mix2s/','txt':'小米MIX 2S'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2320-220.png','href':'https://www.mi.com/mix2/','txt':'小米MIX 2'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/note2320x220.png','href':'https://www.mi.com/minote3/','txt':'小米Note 3'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
	],
	[
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2s320-220white.png','href':'https://www.mi.com/mix2s/','txt':'小米MIX 2S'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2320-220.png','href':'https://www.mi.com/mix2/','txt':'小米MIX 2'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/note2320x220.png','href':'https://www.mi.com/minote3/','txt':'小米Note 3'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
	],
	[
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2s320-220white.png','href':'https://www.mi.com/mix2s/','txt':'小米MIX 2S'},
	],
	[
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2s320-220white.png','href':'https://www.mi.com/mix2s/','txt':'小米MIX 2S'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2320-220.png','href':'https://www.mi.com/mix2/','txt':'小米MIX 2'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/note2320x220.png','href':'https://www.mi.com/minote3/','txt':'小米Note 3'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
	],
	[
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2s320-220white.png','href':'https://www.mi.com/mix2s/','txt':'小米MIX 2S'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2320-220.png','href':'https://www.mi.com/mix2/','txt':'小米MIX 2'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/note2320x220.png','href':'https://www.mi.com/minote3/','txt':'小米Note 3'},
	],
	[
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2320-220.png','href':'https://www.mi.com/mix2/','txt':'小米MIX 2'},
		{'price':'444','src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
	],
];
bannerNav = [
	{'typeid':'1','href':'javascript:;','txt':'手机 电话卡'},
	{'typeid':'2','href':'javascript:;','txt':'电视 盒子'},
	{'typeid':'3','href':'javascript:;','txt':'笔记本'},
	{'typeid':'4','href':'javascript:;','txt':'智能 家电'},
	{'typeid':'5','href':'javascript:;','txt':'健康 家居'},
	{'typeid':'6','href':'javascript:;','txt':'出行 儿童'},
	{'typeid':'7','href':'javascript:;','txt':'路由器 手机配件'},
	{'typeid':'8','href':'javascript:;','txt':'移动电源 插线板'},
	{'typeid':'9','href':'javascript:;','txt':'耳机 音箱'},
	{'typeid':'10','href':'javascript:;','txt':'生活 米兔'},
];
banner = [
	{'txt':'标题','href':'javascript:;','img':'//i1.mifile.cn/a4/T1a5JjBbVT1RXrhCrK.jpg'},
	{'txt':'标题','href':'javascript:;','img':'//i1.mifile.cn/a4/xmad_15206016284836_xjlad.jpg'},
	{'txt':'标题','href':'javascript:;','img':'//i1.mifile.cn/a4/xmad_15221454912161_bsGRM.jpg'},
	{'txt':'标题','href':'javascript:;','img':'//i1.mifile.cn/a4/xmad_15222923867508_soCnQ.jpg'},
	{'txt':'标题','href':'javascript:;','img':'//i1.mifile.cn/a4/xmad_15221426844518_moLSI.jpg'},
];
bannerNavChild = [
	[
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2s320-220white.png','href':'https://www.mi.com/mix2s/','txt':'小米MIX 2S'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/mix2320-220.png','href':'https://www.mi.com/mix2/','txt':'小米MIX 2'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/note2320x220.png','href':'https://www.mi.com/minote3/','txt':'小米Note 3'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
		{'src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/max2_toubu.png','href':'https://www.mi.com/max2/','txt':'小米Max 2'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/note5-320-220.png','href':'https://www.mi.com/redminote5','txt':'红米Note 5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5P-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5 Plus'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/320-220-1.png','href':'https://www.mi.com/redmi5a/','txt':'红米5A'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/3205a.png','href':'https://www.mi.com/redminote5a/','txt':'红米Note 5A'},
	],
	[

		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
		{'src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/max2_toubu.png','href':'https://www.mi.com/max2/','txt':'小米Max 2'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/note5-320-220.png','href':'https://www.mi.com/redminote5','txt':'红米Note 5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5P-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5 Plus'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/320-220-1.png','href':'https://www.mi.com/redmi5a/','txt':'红米5A'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/3205a.png','href':'https://www.mi.com/redminote5a/','txt':'红米Note 5A'},
	],
	[

		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
		{'src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/max2_toubu.png','href':'https://www.mi.com/max2/','txt':'小米Max 2'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/note5-320-220.png','href':'https://www.mi.com/redminote5','txt':'红米Note 5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5P-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5 Plus'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/320-220-1.png','href':'https://www.mi.com/redmi5a/','txt':'红米5A'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/3205a.png','href':'https://www.mi.com/redminote5a/','txt':'红米Note 5A'},
	],
	[

		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
		{'src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/max2_toubu.png','href':'https://www.mi.com/max2/','txt':'小米Max 2'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/max2_toubu.png','href':'https://www.mi.com/max2/','txt':'小米Max 2'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/max2_toubu.png','href':'https://www.mi.com/max2/','txt':'小米Max 2'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/note5-320-220.png','href':'https://www.mi.com/redminote5','txt':'红米Note 5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5P-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5 Plus'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/320-220-1.png','href':'https://www.mi.com/redmi5a/','txt':'红米5A'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/3205a.png','href':'https://www.mi.com/redminote5a/','txt':'红米Note 5A'},
	],
	[

		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
		{'src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
		{'src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/max2_toubu.png','href':'https://www.mi.com/max2/','txt':'小米Max 2'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/note5-320-220.png','href':'https://www.mi.com/redminote5','txt':'红米Note 5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/max2_toubu.png','href':'https://www.mi.com/max2/','txt':'小米Max 2'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5P-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5 Plus'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/320-220-1.png','href':'https://www.mi.com/redmi5a/','txt':'红米5A'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/3205a.png','href':'https://www.mi.com/redminote5a/','txt':'红米Note 5A'},
	],
	[

		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
		{'src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/max2_toubu.png','href':'https://www.mi.com/max2/','txt':'小米Max 2'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/note5-320-220.png','href':'https://www.mi.com/redminote5','txt':'红米Note 5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5P-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5 Plus'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/320-220-1.png','href':'https://www.mi.com/redmi5a/','txt':'红米5A'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/3205a.png','href':'https://www.mi.com/redminote5a/','txt':'红米Note 5A'},
	],
	[

		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
		{'src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
		{'src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/max2_toubu.png','href':'https://www.mi.com/max2/','txt':'小米Max 2'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/note5-320-220.png','href':'https://www.mi.com/redminote5','txt':'红米Note 5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5P-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5 Plus'},
		{'src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/320-220-1.png','href':'https://www.mi.com/redmi5a/','txt':'红米5A'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/3205a.png','href':'https://www.mi.com/redminote5a/','txt':'红米Note 5A'},
	],
	[

		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
		{'src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/max2_toubu.png','href':'https://www.mi.com/max2/','txt':'小米Max 2'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/note5-320-220.png','href':'https://www.mi.com/redminote5','txt':'红米Note 5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/note5-320-220.png','href':'https://www.mi.com/redminote5','txt':'红米Note 5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5P-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5 Plus'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/320-220-1.png','href':'https://www.mi.com/redmi5a/','txt':'红米5A'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/3205a.png','href':'https://www.mi.com/redminote5a/','txt':'红米Note 5A'},
	],
	[

		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5P-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5 Plus'},
		{'src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/max2_toubu.png','href':'https://www.mi.com/max2/','txt':'小米Max 2'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/note5-320-220.png','href':'https://www.mi.com/redminote5','txt':'红米Note 5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5P-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5 Plus'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5P-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5 Plus'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/320-220-1.png','href':'https://www.mi.com/redmi5a/','txt':'红米5A'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/3205a.png','href':'https://www.mi.com/redminote5a/','txt':'红米Note 5A'},
	],
	[

		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png','href':'https://www.mi.com/mi6/','txt':'小米6'},
		{'src':'//i1.mifile.cn/f/i/g/2015/5x-2.jpg','href':'https://www.mi.com/mi5x/','txt':'小米5X'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/5-320-220.png','href':'https://www.mi.com/redmi5/','txt':'红米5'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/320-220-1.png','href':'https://www.mi.com/redmi5a/','txt':'红米5A'},
		{'src':'//i1.mifile.cn/f/i/g/2015/cn-index/3205a.png','href':'https://www.mi.com/redminote5a/','txt':'红米Note 5A'},
	]
];