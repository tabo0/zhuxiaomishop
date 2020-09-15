<%@ page language="java"
	import="java.util.*"
	pageEncoding="UTF-8"%>
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

<title>注册小米账号</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	//更换验证码
	function changeYzm() {
		document.getElementById("yzmImg").src = "randomcode?num=" + Math.random();
	}
	
	//注册
	function checkRegister(){
		//正则表达式
		//注册的账号的规则可以使用小写的a-z和大写的A-Z，长度是2到8
		var regname = /^[a-zA-Z]{2,8}$/;
		//注册时的密码的规则\d只能是整数，长度为6到10位
		var regpass = /^\d{6,10}$/;
		//获取参数
		var cname = document.getElementById("cname").value;
		var cpass = document.getElementById("cpass").value;
		var cpass2 = document.getElementById("cpass2").value;
		var yzm = document.getElementById("yzm").value;
		var info = document.getElementById("info").innerHTML;
		if(cname==""||cpass=="" ||cpass2==""||yzm==""){
			document.getElementById("errormsg").innerHTML="信息输入不完整";
			return false;
		}
		if(!regname.test(cname)){
			document.getElementById("errormsg").innerHTML="账号必须2到8位字母";
			return false;
		}
		if(!regpass.test(cpass)){
			document.getElementById("errormsg").innerHTML="密码必须6到10位数字";
			return false;
		}
		if(cpass!=cpass2){
			document.getElementById("errormsg").innerHTML="两次密码不一致";
			return false;
		}
		if(info=="该账号已经存在,请修改"){
			document.getElementById("errormsg").innerHTML="账号已经存在，请修改注册的账号";
			return false;
		}
		return true;
	}
	
	//检查用户名称是否存在
	function checkCname(){
 		$("#info").html("");
		var cname = $("#cname").val();
		$.ajax({
			   type: "POST",
			   url: "${pageContext.request.contextPath}/docheckcname",
			   data: "cname="+cname,
			   dataType: "json",
			   success: function(msg){
			     $("#info").html(msg.info);
			   }
		});
	};
	
</script>


<style type="text/css">
input:focus {border: 2px solid #FF7E00;}
/* 顶部菜单导航栏 */
#topbar {background-color: #3B3B3B;width: 1890px;height: 40px;}
.sep {color: #3B3B3B}
#topbar a {text-decoration: none;color: #BDBDBD;font-family: 黑体;font-size: 14;}
#topbar a:hover {color: white;}
#topbar_left {width: 700px;margin-left: 350px;padding-top: 10px;float: left;}
#topbar_right {width: 400px;margin-left: 1300px;padding-top: 10px;}
/* 注册部分 */
.searchinput {width: 250px;height: 40px;font-size: 16px;border: 1px solid #EDEDED;}
#searchbtn {background-color: #FF7E00;width: 250px;height: 50px;line-height: 50px;border: 1px solid #EDEDED;cursor: pointer;font-size: 16px;font-family: 黑体;}
#register {text-align: center;background-color: white;width: 510px;height: 600px;margin: 182px 200px;}
#logo {width: 55px;margin: 0px auto;}
#reg_title {width: 200px;margin: 0px auto;font-family: 黑体;}
#reg_form {margin: 0px auto;width: 300px;height: 400px;}
#xy {width: 450px;margin: 0px auto;color: gray;}
#video {position: absolute;left: 710px;top: 230px;}
</style>
</head>

<body id="body" style="background-image: url(resources/image/register.jpg);; background-color: #EDEDED;font-family: 黑体; background-repeat: no-repeat; height: 990px;">
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

	<!-- 注册部分 -->
	<div id="register">
		<div id="logo">
			<img alt="" src="image/milogo.jpg">
		</div>

		<div id="reg_title">
			<h1>注册小米账号</h1>
		</div>
		<!--onsubmit="return checkRegister();"  -->
		<!--在提交数据时  如果函数checkRegister()返回为false不允许提交  -->
		<!--在提交数据时  如果函数checkRegister()返回为true就可以提交  -->
		<form action="${pageContext.request.contextPath}/doregister" method="post" onsubmit="return checkRegister();">
			<div id="reg_form">
				账号<br> <input type="text" id="cname" name="cname" value="" onblur="checkCname()"
					class="searchinput" onmouseover="this.style.borderColor='#FF7E00';"
					onmouseout="this.style.borderColor='#EDEDED';" />
				<br>
				<label style="color:red;" id="info" ></label>
				<br>
				密码<br>
				<input type="password" id="cpass" name="cpass" value=""
					class="searchinput" onmouseover="this.style.borderColor='#FF7E00';"
					onmouseout="this.style.borderColor='#EDEDED';" />
				<br>
				<br>
				确认密码<br>
				<input type="password" id="cpass2" name="cpass2" value=""
					class="searchinput" onmouseover="this.style.borderColor='#FF7E00';"
					onmouseout="this.style.borderColor='#EDEDED';" />
				<br>
				<br> 
				验证码
					<img alt="" src="${pageContext.request.contextPath}/randomcode" id="yzmImg"
						onclick="changeYzm()"> <br> <input type="text"
						id="yzm" name="yzm" value="" class="searchinput"
						onmouseover="this.style.borderColor='#FF7E00';"
						onmouseout="this.style.borderColor='#EDEDED';" />
				<br>
				<br>
				<input type="submit" id="searchbtn" value="立即注册"
					onmouseover="this.style.color='white';"
					onmouseout="this.style.color='black';"> <br>
				<p id="errormsg" style="color: red;"></p>
				<div style="color:red;">${error }</div>
			</div>
		</form>
		<br>
		<div id="xy">一定要牢记帐号密码！因为我还没做忘记密码功能......</div>
	</div>

	<div id="video">
		<object id="NSPlay" width=1065 height=600
			classid="CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95" codebase=""
			standby="Loading Microsoft Windows Media Player components..."
			type="application/x-oleobject" align="left" hspace="0">
			<param name="AutoRewind" value=1>
			<param name="FileName" value="D:\xmNote3.mp4">
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
