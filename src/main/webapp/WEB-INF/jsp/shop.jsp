<%@ page language="java" errorPage="/err.jsp" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shop.css" />
<title>小米商城</title>
</head>


<body>
	<div id="top-header">
		<div class="width_1200">
			<div class="left_nav fl">
				<ul>
					<li><a href="">小米商城</a><span>|</span></li>
					<li><a href="">云服务</a><span>|</span></li>
					<li><a href="">水滴</a><span>|</span></li>
					<li><a href="">金融</a><span>|</span></li>
					<li><a href="">有品</a><span>|</span></li>
				</ul>
			</div>
			<div class="right_login fr clearfix">
				<c:if test="${empty customer }">
					<a href="${pageContext.request.contextPath}/tocustomerloginpage">登陆</a>
					<span class="sep">|</span>
				</c:if>
				<c:if test="${not empty customer }">
					<a href="">${customer.cname }</a>
					<span class="sep">|</span>
					<a href="${pageContext.request.contextPath}/customerlogout">注销</a>
					<span class="sep">|</span>
					<span class="sep">|</span>
					<a href="${pageContext.request.contextPath}/showcarshopbycustomerid?customerid=${customer.cid}" target="_blank">购物车</a>
					<span class="sep">|</span>
				</c:if>
				<a href="${pageContext.request.contextPath}/toregisterpage" target="_blank">注册</a><span class="sep">|</span>
			</div>
		</div>
	</div>
	<div id="header">
		<div class="header-child">
			<div class="width_1200">
				<ul>
					<li><a href="" target="_blank"><span>热卖</span><img
							src="https://i1.mifile.cn/f/i/g/2015/cn-index/mix2s320-220white.png"
							alt=""><strong>小米MIX 2S <b>3299起</b></strong></a></li>
					<li><a href="" target="_blank"><span>热卖</span><img
							src="https://i1.mifile.cn/f/i/g/2015/cn-index/note2320x220.png"
							alt=""><strong>小米Note <b>1799起</b></strong></a></li>
					<li><a href="" target="_blank"><span>热卖</span><img
							src="https://i1.mifile.cn/f/i/g/2015/cn-index/mix2320-220.png"
							alt=""><strong>小米MIX 2 <b>2999起</b></strong></a></li>
					<li><a href="" target="_blank"><img
							src="https://i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png" alt=""><strong>小米6
								<b>2299起</b></strong></a></li>
					<li><a href="" target="_blank"><img
							src="https://i1.mifile.cn/f/i/g/2015/cn-index/max2_toubu.png"
							alt=""><strong>小米MAX 2 <b>1399起</b></strong></a></li>
				</ul>
				<ul>
					<li><a href="" target="_blank"><span>热卖</span><img
							src="https://i1.mifile.cn/f/i/g/2015/cn-index/note5-320-220.png"
							alt=""><strong>红米Note 5 <b>1099起</b></strong></a></li>
				</ul>
				<ul>
					<li>
						<a href="productdetail.jsp" target="_blank">
							<span>热卖</span>
							<img src="https://i1.mifile.cn/f/i/g/2015/4S55320-220-.png" alt="">
							<strong>小米电视4S 55英寸 <b>29991</b></strong>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="width_1200">
			<div class="logo">
				<a href=""><img	src="${pageContext.request.contextPath}/resources/img/sys/logo.png"></a>
			</div>
			<div class="nav">
				<a href="" class="gg">
					<img src="${pageContext.request.contextPath}/resources/img/g/g.gif">
				</a>
				<ul id="header-ul">
					<li><a href="">小米手机</a></li>
					<li><a href="">红米</a></li>
					<li><a href="">电视</a></li>
					<li><a href="">笔记本</a></li>
					<li><a href="">盒子</a></li>
					<li><a href="">新品</a></li>
					<li><a href="">路由器</a></li>
					<li><a href="">智能硬件</a></li>
					<li><a href="">服务</a></li>
					<li><a href="">社区</a></li>
				</ul>
			</div>
			<div class="search">
				<input type="text">
				<button class="search_btn">Q</button>
			</div>
		</div>
	</div>
	<!--开始-->
	<div id="banner">
		<div class="width_1200">
			<!--中间插图-->
			<div class="container">
				<div class="box">
					<img class="lunboimg" src="${pageContext.request.contextPath}/resources/img/lunbo/xiaomi1.jpg">
					<img class="lunboimg" src="${pageContext.request.contextPath}/resources/img/lunbo/xiaomi2.jpg">
					<img class="lunboimg" src="${pageContext.request.contextPath}/resources/img/lunbo/xiaomi3.jpg">
					<img class="lunboimg" src="${pageContext.request.contextPath}/resources/img/lunbo/xiaomi4.jpg">
					<img class="lunboimg" src="${pageContext.request.contextPath}/resources/img/lunbo/xiaomi5.jpg">
				</div>
				<div class="circle">
					<b class="current"></b> <b></b> <b></b> <b></b> <b></b>
				</div>
			</div>
			<!--左边的菜单开始-->
			<div class="banner_nav rgba-black">
				<ul>
					<li><a href="">手机 电话卡</a></li>
					<li><a href="">电视 盒子</a></li>
					<li><a href="">笔记本</a></li>
					<li><a href="">智能 家电</a></li>
					<li><a href="">健康 家居</a></li>
					<li><a href="">出行 儿童</a></li>
					<li><a href="">路由器 手机配件</a></li>
					<li><a href="">移动电源 插线板</a></li>
					<li><a href="">耳机 音箱'</a></li>
					<li><a href="">生活 米兔</a></li>
				</ul>
				<div class="small_box">
					<ul>
						<li><a href=""><img
								src="https://i1.mifile.cn/f/i/g/2015/cn-index/mix2s320-220white.png"
								alt="">小米MIX 2S</a></li>
						<li><a href=""><img
								src="https://i1.mifile.cn/f/i/g/2015/cn-index/mix2320-220.png"
								alt="">小米MIX 2</a></li>
						<li><a href=""><img
								src="https://i1.mifile.cn/f/i/g/2015/cn-index/note2320x220.png"
								alt="">小米Note 3</a></li>
						<li><a href=""><img
								src="https://i1.mifile.cn/f/i/g/2015/cn-index/xm6-320.png"
								alt="">小米6</a></li>
						<li><a href=""><img
								src="https://i1.mifile.cn/f/i/g/2015/5x-2.jpg" alt="">小米5X</a></li>
						<li><a href=""><img
								src="https://i1.mifile.cn/f/i/g/2015/cn-index/max2_toubu.png"
								alt="">小米Max 2</a></li>
						<li><a href=""><img
								src="https://i1.mifile.cn/f/i/g/2015/cn-index/note5-320-220.png"
								alt="">红米Note 5</a></li>
						<li><a href=""><img
								src="https://i1.mifile.cn/f/i/g/2015/cn-index/5P-320-220.png"
								alt="">红米5 Plus</a></li>
						<li><a href=""><img
								src="https://i1.mifile.cn/f/i/g/2015/cn-index/5-320-220.png"
								alt="">红米5</a></li>
						<li><a href=""><img
								src="https://i1.mifile.cn/f/i/g/2015/cn-index/320-220-1.png"
								alt="">红米5A</a></li>
						<li><a href=""><img
								src="https://i1.mifile.cn/f/i/g/2015/cn-index/3205a.png" alt="">红米Note
								5A</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div style="width: 1200px;margin: 0 auto;font-size:20px;margin-bottom: 5px;">小米手机
	</div>
	<div style="width: 1200px;margin: 0 auto;">
		<c:forEach items="${ products}" var="p">
	    	<div style="width: 238px;height: 300px;float: left;">
	    		<div style="margin-left: 30px;margin-top: 9px;">
	    			<a href="${pageContext.request.contextPath}/getproductdetail?id=${p.id}">
	    				<img src="${pageContext.request.contextPath}/resources/image_big/${p.image}" width="190px" height="190px"/>
	    			</a>
	    		</div>
	    		<div style="margin-left: 36px;margin-top: 9px;" align="center">${p.content }</div>
	    		<div style="margin-left: 103px;margin-top: 13px;color: #ff6700;"><b>${p.price }（元）</b></div>
	    	</div>
    	</c:forEach>    	
    </div>
	
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
		/*获取元素*/
/* 		function Mi(v) {
			return document.querySelector(v)
		} */
		/*公共方法*/
/* 		function displays(f, v) {
			Mi(f).style.display = v;
		}

		function displays2(f, v) {
			f.style.display = v;
		} */
		/*top-header 购物车栏目触碰效果*/
/* 		Mi('#top-header .right_login .top_btn a').onmouseover = function() { //触碰
			displays('#top-header .right_login .top_btn .msg', 'block');
		}
		Mi('#top-header .right_login .top_btn a').onmouseout = function() { //离开
			displays('#top-header .right_login .top_btn .msg', 'none');
		}
		for(var i = 0; i < Mi('#header-ul').children.length; i++) {
			Mi('#header-ul').children[i].index = i;
			Mi('#header-ul').children[i].onmouseover = function() {
				headerStart(this.index);
			}
			Mi('#header-ul').children[i].onmouseout = function() {
				headerClose(this.index);
			}
		} */
		/*banner 左侧导航触碰*/
/* 		for(var l = 0; l < Mi('#banner .banner_nav>ul').children.length; l++) {
			Mi('#banner .banner_nav>ul').children[l].index = l;
			Mi('#banner .banner_nav>ul').children[l].onmouseenter = function() {
				bannerNavStart(this.index);
			}
			Mi('#banner .banner_nav>ul').children[l].onmouseleave = function() {
				bannerNavClose(this.index);
			}
		} */

		function headerStart(n) {
			var child = Mi('#header .header-child>div');
			var box = Mi('#header-ul');
			if(n < box.children.length - 2) {
				displays('#header .header-child', 'block');
				Mi('#header .header-child').onmouseover = function() {
					displays('#header .header-child', 'block');
				}
				for(var i = 0; i < child.children.length; i++) {
					child.children[i].style.display = 'none';
				}
				child.children[n].style.display = 'block';
			} else {}
		}

		function headerClose(n) {
			var box = Mi('#header-ul');
			if(n < box.children.length - 2) {
				displays('#header .header-child', 'none');
				Mi('#header .header-child').onmouseout = function() {
					displays('#header .header-child', 'none');
				}
			} else {}
		}
		/*事件*/
		function bannerNavStart(n) {
			var box = Mi('#banner .banner_nav .small_box');
			displays2(box, 'block');
			for(var i = 0; i < box.children.length; i++) {
				displays2(box.children[i], 'none');
			}
			box.style.width = Math.ceil(box.children[n].children.length / 6) * 240 + 'px';
			box.children[n].style.width = Math.ceil(box.children[n].children.length / 6) * 240 + 'px';
			displays2(box.children[n], 'block');
			box.onmouseover = function() {
				displays2(this, 'block');
			}
		}

		function bannerNavClose(n) {
			var box = Mi('#banner .banner_nav .small_box');
			displays2(box, 'none');
			box.onmouseout = function() {
				displays2(this, 'none');
			}
		}
		//轮播
		var i = 0;
		var timer;
		$(function() {
			//设置页面刚加载出来显示的是第一张图片
			$(".lunboimg").eq(0).show().siblings().hide();
			//siblings() 获得匹配集合中每个元素的同胞，通过选择器进行筛选是可选的。
			start();
			/*鼠标移入小圆点的时候
			首先清除定时器
			找到当前圆点的索引
			改变当前显示的图片
			使其变换成圆点对应的图片，
			当前圆点变换样式*/
			$("b").hover(function() {
				clearInterval(timer); //清除定时器
				i = $(this).index();
				change();
			}, function() {
				//鼠标移出的时候，重新启动定时器
				start();
			});
			//点击左边的按钮
			$(".lunboleft").click(function() {
				i--;
				//当图片已经是第一个，点击变成最后一个
				if(i == 0) {
					i = 5;
				}
				change();
			});
			//点击右边的按钮
			$(".lunboright").click(function() {

				i++;
				//当图片已经是最后一个，点击变成第一个
				if(i == 5) {
					i = 0;
				}
				change();
			});
		});

		//开始轮播
		function start() {
			timer = setInterval(function() {
				i++;
				if(i == 5) {
					i = 0;
				}
				change();
			}, 4000); //停留4S
		}

		function change() {
			//每张图片切换的时间
			$(".lunboimg").eq(i).fadeIn(300).siblings().stop(true, true).fadeOut(300);
			//让小圆点变样式
			$("b").eq(i).addClass("current").siblings().removeClass("current");
		}
	</script>
</html>














