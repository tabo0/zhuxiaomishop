<%@ page language="java"	import="java.util.*"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>我的订单</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	//查看订单明细
	function openDetailDiv(oid) {
		var detailDiv = document.getElementById("detailDiv_" + oid);
		if (detailDiv.style.display == "block") {
			detailDiv.style.display = "none";
		} else {
			detailDiv.style.display = "block";
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
#order_title {background-color: white;width: 1890px;height: 95px;}
#logo {float: left;width: 60px;margin-left: 350px;padding-top: 20px;}
#order_text {width: 900px;margin-left: 500px;padding-top: 30px;}
#hr {height: 2px;border: none;border-top: 2px solid #FF7E00;margin-top: 25px;}
#order_menu {background-color: white;width: 1226px;height: 50px;margin-left: 350px;}
#order_menu a {text-decoration: none;font-family: 黑体;font-size: 20;color: black;}
#order_menu a:hover {color: #FF7E00;}
#order_menu_left {width: 400px;padding-top: 15px;margin-left: 150px;float: left;}
#order_menu_right {width: 250px;height: 30px;margin-left: 900px;padding-top: 15px;}
.myorder {background-color: white;width: 1226px;margin-left: 350px;}
.myorder hr {border: 1px solid #EDEDED;}
/* 尾部 */
#foot {width: 1890px;}
</style>
</head>

<body style=" background-color: #EDEDED; font-family: 黑体; ">
	<!-- 顶部菜单导航栏 -->
	<div id="header">
		<div id="topbar">
			<div id="topbar_left">
				<a href="">小米商城</a><span class="sep">|</span> 
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
				<c:if test="${empty user }">
					<a href="login.jsp">登陆</a>
					<span class="sep">|</span>
				</c:if>
				<c:if test="${not empty user }">
					<a href="">${user.uname }</a>
					<span class="sep">|</span>
					<a href="userServlet?type=loginout">注销</a>
					<span class="sep">|</span>
					<a href="productServlet?type=myorder" target="_blank">我的订单</a>
					<span class="sep">|</span>
					<a href="${pageContext.request.contextPath}/fore/product?flag=showCarShop" target="_blank">购物车</a>
					<span class="sep">|</span>
				</c:if>
				<a href="register.jsp" target="_blank">注册</a><span class="sep">|</span>
			</div>
		</div>
	</div>

	<!-- 我的订单 -->
	<div id="order_title">
		<div id="logo">
			<a href="">
				<img alt="" src="image/milogo.jpg"
				onmouseover="this.src='image/milogo2.jpg'"
				onmouseout="this.src='image/milogo.jpg'"></a>
		</div>
		<div id="order_text">
			<span style="font-family: 黑体;font-size: 34;">我的订单</span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="font-size: 30px;color: #FF7E00;">${msg }</span>
		</div>
		<hr id="hr">
	</div>
	<br>

	<div id="order_menu">
		<div id="order_menu_left">
			<a href="">全部订单</a>&nbsp;&nbsp; 
			<a href="">未支付</a>&nbsp;&nbsp; 
			<a href="">待收货</a>&nbsp;&nbsp; 
			<a href="">已关闭</a>
		</div>
		<div id="order_menu_right">
			<input type="text" id="search">
			<a href="" target="_blank">搜索</a>
		</div>
	</div>
	<br>

	
	<c:forEach var="order" items="${orderList }">
		<div class="myorder">
			<table border="0px" width="1226" style="text-align: center;">
				<tr>


					<td width="100" height="70;">${order.odate }</td>
					<td width="100">订单号：${order.oid }</td>
					<td width="100">购买人：${user.uname }</td>
					<td width="250">备注：${order.remarks }</td>
					<td width="100">状态：<span style="color: #FF7E00; font-size: 16px;">${order.status }</span></td>
					<td width="200">订单总额：<span style="color: #FF7E00; font-size: 26px;">${order.totalPrice }</span>元</td>
					<td width="100">
						<a href="javascript:openDetailDiv('${order.oid }')"
							style="display: block; width: 100px; height: 30px;line-height:30px; background-color: #FF7E00;text-align: center; "
							onmouseover="this.style.color='white';"
							onmouseout="this.style.color='black';"> 查看详情▼</a></td>
				</tr>
			</table>

			<div id="detailDiv_${order.oid }" style="display: none;">
				<table border="0px" width="1226" style="text-align: center;">
					<tr>
						<td colspan="8"><hr></td>
					</tr>
					<tr>
						<td colspan="3">收货地址：${order.address.address }</td>
						<td colspan="2">收货人：${order.address.cnee }</td>
						<td colspan="3">电话：${order.address.phone }</td>
					</tr>
					<tr>
						<td colspan="8"><hr></td>
					</tr>
					<c:forEach var="detail" items="${order.detailList}">
						<tr style="font-size: 18px;">
							<td width="100"><img alt="" src="image/${detail.product.pImage }" height="100px;"></td>
							<td width="100">${detail.product.pName }</td>
							<td width="100">${detail.product.pPrice }元</td>
							<td width="100">${detail.pNumber }件</td>
							<td width="250">${detail.product.pContent }</td>
							<td width="250">小计：${detail.ptotal}元</td>
							<td width="100">
								<c:if test="${order.status eq '已发货' }">
									<a href="prod.do?flag=comment&pid=${detail.product.pId }"
										style="display: block; width: 80px; height: 30px;line-height:30px; background-color: #FF7E00;text-align: center; "
										onmouseover="this.style.color='white';"
										onmouseout="this.style.color='black';"> 评价</a>
								</c:if></td>
						</tr>
						<tr>
							<td colspan="7"><hr></td>
						</tr>
						
					</c:forEach>
				</table>
			</div>
		</div>
		<br>
	</c:forEach>
	<br>
	<br>
	<br>

	<!-- 推荐 -->
	<div>
		<img alt="" src="image/carshop_tj.jpg" width="1890px;">
	</div>

	<!-- 尾部 -->
	<div id="foot">
		<img alt="" src="image/foot.jpg" width="1890px;">
	</div>

</body>
</html>

