<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<title></title>

</head>

<body>
	<div id="login">
		<div id="top">
			<img src="${pageContext.request.contextPath}/resources/images/cloud.jpg" /><span>LOGIN</span>
		</div>
		<span style="color: red">${info}</span>
		<div id="bottom">
			<form action="${pageContext.request.contextPath}/login" method="post">
				<table id="table">
					<tr>
						<td class="td1">用户名：</td>
						<td><input type="text" placeholder="Username" class="td2" name="uname"></td>
					</tr>
					<tr>
						<td></td>
						<td><span id="nameerr"></span></td>
					</tr>
					<tr>
						<td class="td1">密码：</td>
						<td><input type="password" placeholder="Password" class="td2" name="upass"></td>
					</tr>
					<tr>
						<td></td>
						<td><span id="pwderr"></span></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<input type="submit" value="登录" class="td3">
						</td>
					</tr>
				</table>
			</form>
		</div>

	</div>
</body>

</html>