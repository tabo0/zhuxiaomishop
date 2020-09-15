<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'product_detail.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	function findcomment(page, pid) {
		if (page == null || pid == null) {
			return;
		}
		//实现ajax的分页查询
		$.ajax({
			type : "post",
			url : "commentServlet?type=commentList",
			data : "page=" + page + "&pid=" + pid,
			datetype : "text",
			//请求成功后调用
			success : function(objstr) {
				var objs = eval("(" + objstr + ")");
				var trs = "";
				for (var i = 0; i < objs.length; i++) {
				var obj = objs[i];
				trs += "<tr><td style='font-size: 24px;color: #FF7E00;'>"
						+ obj.uid
						+ "</td>"
						+ "<td style='text-align: center;'>"
						+ obj.cdate
						+ "</td>"
						+ "<td style='text-align: center;'>图片</td>"
						+ "</tr>"
						+ "<tr>"
						+ "<td width='450px;' height='150px;' style='font-size: 20px;'>"
						+ obj.ccontent
						+ "</td>"
						+ "<td width='300px;' style='color: #FF7E00;font-size: 26px; text-align: center;'>"
						+ obj.pscore
						+ "分</td>"
						+ "<td height='150px;' style='text-align: center;'><img alt='' src='image_comm/"+obj.cimage+" ' height='150'></td>"
						+ "</tr>"
						+ "<tr><td colspan='3'><hr></td></tr>";
				}
				$("#commTab").html(trs);
			},
			//请求失败后调用
			error : function() {
				alert("失败了");
			}
		});

	}
</script>

<style type="text/css">
/* 顶部菜单导航栏 */
a {text-decoration: none;color: black;}
a:hover {color: #FF7E00;}
hr {border: 1px solid #EDEDED;}
#header {background-color: white;}
#ad {height: 119px;width: 1890px;;}
#topbar {background-color: #3B3B3B;width: 1890px;height: 40px;}
.sep {color: #3B3B3B}
#topbar a {text-decoration: none;color: #BDBDBD;font-family: 黑体;font-size: 14;}
#topbar a:hover {color: white;}
#topbar_left {width: 700px;margin-left: 350px;padding-top: 10px;float: left;}
#topbar_right {width: 400px;margin-left: 1300px;padding-top: 10px;}
#menu {height: 95px;background-color: white;}
#logo {margin-left: 350px;padding-top: 20px;float: left;}
#menu_nav {margin-left: 500px;padding-top: 40px;width: 1100px;}
#menu_nav a {text-decoration: none;color: black;font-family: 黑体;font-size: 16;}
#menu_nav a:hover {color: #FF7E00;}
/* 明细菜单 */
#detail_menu {background-color: white;width: 1890px;height: 50px;}
#detail_menu_left {width: 100px;margin-left: 350px;padding-top: 10px;float: left;}
#detail_menu_right {width: 350px;margin-left: 1250px;padding-top: 15px;}
/* 商品购买 */
#buy {background-color: white;width: 1890px;height: 800px;}
#buy_left {float: left;margin-left: 350px;}
#buy_right {width: 580px;height: 600px;margin-left: 1000px;}
/* 细节图片 */
#detailimg{ width: 1890px; text-align: center; }
#canshuimg{background-color:gray; width: 1890px; text-align: center; }
/* 商品评价 */
#comment {background-color: white;width: 1226px;margin-left: 350px;}
#comment_table {width: 900px;margin: 0px auto;}
#pages {margin: 0px auto;width: 350px;height: 100px;text-align: center;font-size: 20px;}
.pages {float: left;display: block;background-color: #FF7E00;width: 40px;height: 30px;line-height: 30px;margin-left: 20px;}
#pages a {color: black;}
#pages a:hover {color: white;}
/* 包装清单 */
#bzqd {width: 1226px;margin-left: 350px;}
/* 三包服务 */
#sbfw {width: 1226px;margin-left: 350px;}
/* 尾部 */
#foot {width: 1890px;}
</style>
</head>
<script type="text/javascript">

	//减少数量
	function subtract(){
		var obj = document.getElementById("number");
		var number = obj.value;
		if(number > 1){
			obj.value = number - 1;
			document.getElementById("totalprice").innerHTML = "${product.price}" * obj.value + "&nbsp;元";
		}
	}
	//增加数量
	function add(){
		var obj = document.getElementById("number");
		var number = obj.value;
		obj.value = parseInt(number) + 1;
		document.getElementById("totalprice").innerHTML = "${product.price}" * obj.value + "&nbsp;元";
	}
	
	//添加购物车
	function addcarshop(){
		if("${customer}" == ''){
			alert("你还没有登录，请先登录");
			document.getElementById("addcar").setAttribute("href","${pageContext.request.contextPath}/tocustomerloginpage");
		}else{
			var obj = document.getElementById("number");//<input  id="number" value="1"/>
			var numbers = obj.value;//获取输入的数量
			if(numbers > "${product.number}"){
				alert("购买的数量不能大于库存的数量");
			}else{
				document.getElementById("addcar").setAttribute("href","${pageContext.request.contextPath}/addcarshop?customerid=${customer.cid}&pid=${product.id}&numbers="+numbers)
			}
		}
	}
	
	//显示购物车
	function showCarShop(){
/* 		if("${customer}" == ''){
			alert("你还没有登录，请先登录");
			document.getElementById("showcar").setAttribute("href",
					"${pageContext.request.contextPath}/tocustomerloginpage");
		}else{ */
			document.getElementById("showcar").setAttribute("href",
					"${pageContext.request.contextPath}/showcarshopbycustomerid?customerid=${customer.cid}")
/* 		} */
	}
	
</script>
<c:remove var="carshoperr"></c:remove>
<body style=" background-color: #EDEDED; font-family: 黑体; ">
	<!-- 顶部菜单导航栏 -->
	<div id="header">
		<div id="topbar">
			<div id="topbar_left">
				<a href="${pageContext.request.contextPath}/index">小米商城</a><span class="sep">|</span> 
				<a href=""
					target="_blank">MIUI</a><span class="sep">|</span> 
				<a href="" target="_blank">米聊</a><span class="sep">|</span> 
				<a href="" target="_blank">游戏</a><span class="sep">|</span> 
				<a href="" target="_blank">多看阅读</a><span class="sep">|</span> 
				<a href="" target="_blank">云服务</a><span class="sep">|</span> 
				<a href="" target="_blank">金融</a><span class="sep">|</span> 
				<a href="" target="_blank">米币</a><span class="sep">|</span> 
				<a href="" target="_blank">手机版</a><span class="sep">|</span> 
				<a href="" target="_blank">问题反馈</a>
			</div>
			<div id="topbar_right">
				<c:if test="${empty customer }">
					<a href="login.jsp">登陆</a>
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
				<a href="customerlogout" target="_blank">注册</a><span class="sep">|</span>
			</div>
		</div>
		<div id="menu">
			<div id="logo">
				<a href="">
					<img alt="" src="resources/image/milogo.jpg"
						onmouseover="this.src='resources/image/milogo2.jpg'"
						onmouseout="this.src='resources/image/milogo.jpg'"></a>
			</div>
			<div id="menu_nav">
				<a href="mainServlet">全部商品</a><span class="sep">&nbsp;</span>
				<a href="mainServlet?typeId=1">小米手机</a><span class="sep">&nbsp;</span>
				<a href="mainServlet?typeId=1">红米</a><span class="sep">&nbsp;</span>
				<a href="mainServlet?typeId=2">平板电脑</a><span class="sep">&nbsp;</span>
				<a href="mainServlet?typeId=3">电视</a><span class="sep">&nbsp;</span>
				<a href="" target="_blank">盒子影音</a><span class="sep">&nbsp;</span> 
				<a href="" target="_blank">路由器</a><span class="sep">&nbsp;</span> 
				<a href="" target="_blank">智能硬件</a><span class="sep">&nbsp;</span> 
				<a href="" target="_blank">服务</a><span class="sep">&nbsp;</span> 
				<a href="" target="_blank">社区</a><span class="sep">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<input type="text" id="search">
				<a href="" target="_blank">搜索</a>
			</div>
		</div>
		<hr>
	</div>

	<!-- 商品购买 -->
	<div id="buy">
		<div id="buy_left">
			<img  src="${pageContext.request.contextPath}/resources/image_big/${product.image}">
		</div>

		<div id="buy_right">
			<br>
			<h2>${product.name}</h2>
			<p style="color: #FF7E00;">【“小米手机品牌日” 64GB 直降100元，下单赠米粉卡。128GB下单立减100元。全版本享花呗6期免息，小米分期3/6/12期免息】</p>
			<p style="color: gray;">5.99"大屏 / 骁龙835旗舰处理器 / 4轴光学防抖 /6模43频，全球频段 / 双ADC高清录音</p>
			<hr>
			<br> <span style="font-size: 20px;">颜色版本</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 24px; color: #FF7E00;">${product.content}</span>
			<br>
			<br>
			<br> <span style="font-size: 20px;">库存剩余</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 24px; color: #FF7E00;">${product.number}&nbsp;件</span>
			<br>
			<br>
			<br> <span style="font-size: 20px;">商品单价</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 24px; color: #FF7E00;">${product.price}&nbsp;元</span>
			<br>
			<br>
			<br> <span style="font-size: 20px;">购买数量</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 24px; color: #FF7E00;">
			    <input type="button" value="-" id="subtract" onclick="subtract()">
				<input type="text" value="1" id="number" size="2">
				<input type="button" value="+" id="add" onclick="add()">&nbsp;件
			</span> <br>
			<hr>
			<br> <span style="font-size: 26px; color: #FF7E00;">商品总价</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 30px; color: #FF7E00;" id="totalprice">${product.price}&nbsp;元</span>
			<br>
			<br> 
			<a href="" onclick="addcarshop()" id="addcar"
					style="display:inline-block; width: 200px; height: 50px; line-height: 50px; background-color: #FF7E00; font-size: 20; text-align: center;"
					onmouseover="this.style.color='white';"
					onmouseout="this.style.color='black';">加入购物车</a>&nbsp;&nbsp;
			                
			<a href="" onclick="showCarShop()" id="showcar"
					style="display:inline-block; width: 200px; height: 50px; line-height: 50px; background-color: #FF7E00; font-size: 20; text-align: center;"
					onmouseover="this.style.color='white';"
					onmouseout="this.style.color='black';">查看购物车 </a>
		</div>
		<div id="info"></div>
	</div>
</body>
</html>
