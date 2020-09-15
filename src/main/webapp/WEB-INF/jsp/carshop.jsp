<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:remove var="errmsg"></c:remove>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>我的购物车</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script language="javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	/* 加减商品数量 */
	$("[name=jian]").live("click",function(){
		var numstr = $(this).next("input").val();
		if(numstr!="1"){
			$(this).next("input").val(parseInt(numstr)-1);
		}
	});
	$("[name=jia]").live("click",function(){
		var numstr = $(this).prev("input").val();
		$(this).prev("input").val(parseInt(numstr)+1);
		
	});
	/* 删除商品 */
	function dropconfirm(pid){
		var op = confirm("确定要删除该商品吗？");
		if(op == true){
			$.ajax({
				type : "post",
				url : "productServlet?type=dropcar",
				data : "&pid=" + pid,
				datetype : "text",
				//请求成功后调用
				success : function() {
					alert("删除成功");
					window.location.reload();
				},
				//请求失败后调用
				error : function() {
					alert("删除失败");
				}
			});
		}
	}
</script>

<style type="text/css">
a {text-decoration: none;color: black;}
a:hover {color: #FF7E00;}
/* 顶部菜单导航栏 */
#topbar {background-color: #3B3B3B;width: 1890px;height: 40px;}
.sep {color: #3B3B3B}
#topbar a {text-decoration: none;color: #BDBDBD;font-family: 黑体;font-size: 14;}
#topbar a:hover {color: white;}
#topbar_left {width: 700px;margin-left: 350px;padding-top: 10px;float: left;}
#topbar_right {width: 400px;margin-left: 1300px;padding-top: 10px;}
/* 我的购物车 */
#car_title {background-color: white;width: 1890px;height: 95px;}
#logo {float: left;width: 60px;margin-left: 350px;padding-top: 20px;}
#car_text {width: 700px;margin-left: 500px;padding-top: 30px;}
#hr {height: 2px;border: none;border-top: 2px solid #FF7E00;margin-top: 25px;}
#jiesuan {background-color: white;width: 1226px;height: 100px;margin-left: 350px;}
#jiesuan a {text-decoration: none;font-family: 黑体;font-size: 20;color: black;}
#jiesuan a:hover {color: #FF7E00;}
#jiesuan_left {width: 400px;padding-top: 25px;margin-left: 40px;float: left;}
#jiesuan_right {width: 400px;height: 40px;margin-left: 650px;padding-top: 25px;}
#total_span {color: #FF7E00;}
#total_num {font-size: 40px;}
#carshop {background-color: white;width: 1226px;margin-left: 350px;}
#carshop hr {border: 1px solid #EDEDED;}
/* 尾部 */
#foot {width: 1890px;}
</style>
</head>
<script type="text/javascript">	
	if ("${msg}" != '') {
		alert("${msg}");
	}	
</script>
<c:remove var="msg" />

<body style=" background-color: #EDEDED; font-family: 黑体; ">
	<!-- 顶部菜单导航栏 -->
	<div id="header">
		<div id="topbar">
			<div id="topbar_left">
				<a href="${pageContext.request.contextPath}/index">小米商城</a><span class="sep">|</span>
				<a href="" target="_blank">MIUI</a><span class="sep">|</span>
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
	</div>

	<!-- 我的购物车 -->
	<div id="car_title">
		<div id="logo">
			<a href="">
			<img alt="" src="image/milogo.jpg"
				onmouseover="this.src='${(pageContext.request.contextPath)}/image/milogo2.jpg'"
				onmouseout="this.src='${(pageContext.request.contextPath)}/image/milogo.jpg'">
			</a>
		</div>
		<div id="car_text">
			<span style="font-family: 黑体;font-size: 34;">我的购物车</span>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-family: 黑体;font-size: 16;">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</span>
		</div>
		<hr id="hr">
	</div>
	<br>
	<div id="allcarshop">
	<div id="carshop">
		<br>
		<table border="0px" width="1200" style="text-align: center;">
			<tr>
				<td>图片</td>
				<td>名称</td>
				<td>型号</td>
				<td>单价</td>
				<td>数量</td>
				<td>小计</td>
				<td>操作</td>
			</tr>
			<c:set var="total" value="0" ></c:set>
			<c:forEach items="${carlist}" var="car">
				<tr>
					<td colspan="7"><hr></td>
				</tr>
				<tr style="font-size: 18px;">
					<td width="300" height="150">
						<img alt="" src="${pageContext.request.contextPath}/resources/image_big/${car.image}" style="height: 150;">
					</td>
					<td width="100">
						${car.name}</td>
					<td width="400">
						${car.content}</td>
					<td width="100">${car.price }</td>
					<td width="210">
						<c:if test="${car.numbers>1 }">
						<a href="javascript:changeN(${car.id},${car.numbers-1})">-</a>
						</c:if>
						<c:if test="${car.numbers==1 }">
						-
						</c:if>
						<input type="text" readonly="readonly" value="${car.numbers }" style="width: 40px; height: 30px; line-height: 30px;border: 0px;text-align: center;font-size: 26px;color:#FF7E00 "/>
						<a href="javascript:changeN(${car.id},${car.numbers+1})">+</a>
					</td>
					<td width="200" style="color: #FF7E00;">${car.price*car.numbers }元</td>
					<c:set var="total" value="${total+car.price*car.numbers }"></c:set>
					<td width="100">
						<a href="${(pageContext.request.contextPath)}/deletecarshop?cid=${car.cid}&customerid=${customer.cid}" onclick="return confirm('确定删除吗？')" style="display: block; background-color: #EDEDED;width: 100px; height: 40px; line-height: 40px;"
							onmouseover="this.style.backgroundColor='red';" onmouseout="this.style.backgroundColor='#EDEDED';">
							删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>

	<script type="text/javascript">
		function changeN(cid,num) {
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/changenumber",
				data:"cid="+cid+"&num="+num,
				success : function() {
					window.location.href="";
				}
			});
		}
	</script>
	
	<!-- 结算栏 -->
	<div id="jiesuan">
		<div id="jiesuan_left">
			<a href="index" style="display: block; width: 150px; height: 50px; line-height: 50px; background-color: #FF7E00; font-size: 20; text-align: center;"
				onmouseover="this.style.color='white';"
				onmouseout="this.style.color='black';">
				继续购物</a>
		</div>
		<div id="jiesuan_right">
			<span>活动优惠：减0元&nbsp;&nbsp;</span>
			<span id="total_span">合计：
			<span id="total_num"></span> <fmt:formatNumber pattern="#0.00" value="${total}"></fmt:formatNumber>元&nbsp;&nbsp;&nbsp;
			</span>
			<div style="position: absolute;margin-left: 350px; margin-top: -45px;">
				<span  style="display: block; width: 200px; height: 50px; line-height: 50px; background-color: #FF7E00; font-size: 26; text-align: center;"
					onmouseover="this.style.color='white';"
					onmouseout="this.style.color='black';">
					去结算 </span>
			</div>
		</div>
	</div>
</div>

	<br>
	<br>
	<br>

	<div>
		<img alt="" src="resources/image/carshop_tj.jpg" width="1890px;">
	</div>

	<!-- 尾部 -->
	<div id="foot">
		<img alt="" src="resources/image/foot.jpg" width="1890px;">
	</div>

</body>
</html>
