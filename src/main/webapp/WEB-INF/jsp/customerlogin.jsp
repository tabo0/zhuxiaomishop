<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登陆小米账号</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>

<script type="text/javascript">

	//更换验证码
	function changeYzm() {
		document.getElementById("yzmImg").src = "randomcode?num=" + Math.random();
	}

</script>

<style type="text/css">
input:focus {
	border: 2px solid #FF7E00;
}

hr {
	border: 1px solid #EDEDED;
}
/* 顶部菜单导航栏 */
#topbar {
	background-color: #3B3B3B;
	width: 1890px;
	height: 40px;
}

.sep {
	color: #3B3B3B
}

#topbar a {
	text-decoration: none;
	color: #BDBDBD;
	font-family: 黑体;
	font-size: 14;
}

#topbar a:hover {
	color: white;
}

#topbar_left {
	width: 700px;
	margin-left: 350px;
	padding-top: 10px;
	float: left;
}

#topbar_right {
	width: 400px;
	margin-left: 1300px;
	padding-top: 10px;
}

#menu {
	background-color: white;
	height: 95px;
}

#logo {
	margin-left: 350px;
	padding-top: 20px;
	float: left;
}

#menu_nav {
	margin-left: 100px;
	padding-top: 40px;
	width: 800px;
	float: left;
}

#menu_nav a {
	text-decoration: none;
	color: black;
	font-family: 黑体;
	font-size: 16;
}

#menu_nav a:hover {
	color: #FF7E00;
}

#search {
	margin-left: 1300px;
	width: 300px;
	padding-top: 30px;
}

#searchinput {
	width: 200px;
	height: 40px;
	font-size: 16px;
	border: 1px solid #EDEDED;
}

#searchbtn {
	background-color: white;
	width: 60px;
	height: 40px;
	border: 1px solid #EDEDED;
	cursor: pointer;
	font-size: 16px;
	font-family: 黑体;
}
/* 登陆部分 */
.logininput {
	width: 250px;
	height: 40px;
	font-size: 16px;
	border: 1px solid #EDEDED;
}

#loginbtn {
	background-color: #FF7E00;
	width: 250px;
	height: 50px;
	line-height: 50px;
	border: 1px solid #EDEDED;
	cursor: pointer;
	font-size: 16px;
	font-family: 黑体;
}

#login {
	text-align: center;
	background-color: white;
	width: 510px;
	height: 600px;
	margin-left: 1210px;
	margin-top: 182px;
}

#loginlogo {
	width: 55px;
	margin: 0px auto;
}

#login_title {
	width: 200px;
	margin: 0px auto;
	font-family: 黑体;
}

#login_form {
	margin: 0px auto;
	width: 300px;
	height: 300px;
}

#xy {
	width: 450px;
	margin: 0px auto;
	color: gray;
}

#video {
	position: absolute;
	left: 160px;
	top: 230px;
}
</style>
</head>

<body
	style="background-image: url(resources/image/login.jpg); background-color: #EDEDED; font-family: 黑体;">
	<!-- 顶部菜单导航栏 -->
	<div id="header">
		<div id="topbar">
			<div id="topbar_left">
				<a href="">小米商城</a><span class="sep">|</span> <a href=""
					target="_blank">MIUI</a><span class="sep">|</span> <a href=""
					target="_blank">米聊</a><span class="sep">|</span> <a href=""
					target="_blank">游戏</a><span class="sep">|</span> <a href=""
					target="_blank">多看阅读</a><span class="sep">|</span> <a href=""
					target="_blank">云服务</a><span class="sep">|</span> <a href=""
					target="_blank">金融</a><span class="sep">|</span> <a href=""
					target="_blank">米币</a><span class="sep">|</span> <a href=""
					target="_blank">手机版</a><span class="sep">|</span> <a href=""
					target="_blank">问题反馈</a>
			</div>
			<div id="topbar_right">
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
				<a href="${pageContext.request.contextPath}/toregisterpage">注册</a><span class="sep">|</span>
			</div>
		</div>
	</div>

	<!-- 登录部分 -->
	<div id="login">
		<div id="loginlogo">
			<img alt="" src="${pageContext.request.contextPath}/image/milogo.jpg">
		</div>
		<br> <br>
		<div id="login_title">
			<h1>登录小米账号</h1>
		</div>
		<div id="login_form">
			<form action="${pageContext.request.contextPath}/customerlogin" method="post">
				账号<br> <input type="text" id="cname" name="cname" value=""
					class="logininput" onmouseover="this.style.borderColor='#FF7E00';"
					onmouseout="this.style.borderColor='#EDEDED';" /> <br> <br>
				密码<br> <input type="password" id="cpass" name="cpass"
					class="logininput" value=""
					onmouseover="this.style.borderColor='#FF7E00';"
					onmouseout="this.style.borderColor='#EDEDED';" /> <br> <br>
				验证码<img alt="" src="${pageContext.request.contextPath}/randomcode" id="yzmImg"
					onclick="changeYzm()"> <br> <input type="text" id="yzm"
					name="yzm" class="logininput" value=""
					onmouseover="this.style.borderColor='#FF7E00';"
					onmouseout="this.style.borderColor='#EDEDED';" /> <br> <br>
				<input type="submit" id="loginbtn" value="立即登录"
					onmouseover="this.style.color='white';"
					onmouseout="this.style.color='black';"> <br>
				<p id="errormsg" style="color: red;">${error}</p>
			</form>
		</div>
		<br> <br>
		<div id="xy">一定要牢记帐号密码！因为我还没做忘记密码功能......</div>
	</div>

	<div id="video">
		<object id="NSPlay" width=1065 height=600
			classid="CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95" codebase=""
			standby="Loading Microsoft Windows Media Player components..."
			type="application/x-oleobject" align="left" hspace="0">
			<param name="AutoRewind" value=1>
			<param name="FileName" value="D:\xmNote3_2.mp4">
			<param name="ShowControls" value="0">
			<param name="ShowPositionControls" value="0">
			<param name="ShowAudioControls" value="0">
			<param name="ShowTracker" value="0">
			<param name="ShowDisplay" value="0">
			<param name="ShowStatusBar" value="0">
			<param name="ShowGotoBar" value="0">
			<param name="ShowCaptioning" value="0">
			<param name="AutoStart" value=1>
			<param name="Volume" value="-2000">
			<param name="AnimationAtStart" value="0">
			<param name="TransparentAtStart" value="0">
			<param name="AllowChangeDisplaySize" value="0">
			<param name="AllowScan" value="0">
			<param name="EnableContextMenu" value="0">
			<param name="ClickToPlay" value="0">
		</object>
	</div>



</body>
</html>
