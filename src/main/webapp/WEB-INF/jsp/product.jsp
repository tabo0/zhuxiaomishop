<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 用于格式化时间 -->
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script type="text/javascript">
    function addpro(){
    	window.location.href="${pageContext.request.contextPath}/addproductpage";//get
    }
</script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/base.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bright.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/addBook.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<title></title>
<style type="text/css">
	#batchdelpro {
		background-color: orangered;
		width: 150px;
		height: 48px;
		margin-top: 15px;
		margin-left: 25px;
		font-size: 18px;
	}
</style>

<script type="text/javascript">
	$(function(){
		$("#checkAll").click(function(){
			if($(this).prop("checked")){
                $("input[type='checkbox']").not(this).prop("checked",true);
            }else{
                $("input[type='checkbox']").not(this).prop("checked",false);
            }
		});
		
		$("#batchdelpro").click(function(){
			 var ids = new Array(); //定义一个数组存储id
			 $("input[name='id']:checked").each(function() {
			      ids.push($(this).val()); // 把值push进入数组里面
			 });
			 if(ids.length == 0){
			      alert('请选择至少一条记录删除');
			      return;
			 }
			 location.href="${pageContext.request.contextPath}/batchdelproduct?ids="+ids;
		});
	});
</script>
</head>

<body>

    <!-- 判断否登录  登录成功会将users保存到session ,如果没有登录 session中的users为空 -->
    <!--UsersController.java中的登录中的登录成功保存用户信息到session的代码 
    session.setAttribute("users", users); -->
	<c:if test="${sessionScope.users == null }">
		<!--  没有登录，重新去登录页面登录  对应UsersController.java中的
		@RequestMapping(value="/login",method=RequestMethod.GET)-->
		<c:redirect url="login"></c:redirect>
	</c:if>
	<div id="brall">
		<div id="nav">
			<p>商品管理>商品列表</p>
		</div>
		<div id="condition" style="text-align: center">
			<form action="${pageContext.request.contextPath}/getprobypage" id="myform">
				商品名称：<input name="name" id="name" value="${name }">
				商品类型:<select name="typeid">
							<option value="-1">请选择</option>
							<c:forEach items="${ptlist}" var="type">
							<option value="${type.id}"
							<c:if test="${type.id==typeid}">
							selected="selected"
							</c:if>>
							${type.name}
							</option>
							</c:forEach>
				        </select>
				<input type="submit" value="查询">
			</form>
		</div>
		<br>
		<div id="table">
			<div id="top">
			    <input type="button" class="btn btn-warning" id="batchdelpro" value="批量删除">
				<input type="button" class="btn btn-warning" id="btn1" value="新增商品" onclick="addpro()">
			</div>
			<!--显示没有分页的商品信息-->
			<div id="middle">
				<table class="table table-bordered table-striped">
					<tr>
					    <th style="width: 50px;text-align: center;">
					    	<input type="checkbox" style="width: 20px;height: 20px;" id="checkAll">
					    </th>
						<th>商品名称</th>
						<th>商品介绍</th>
						<th>定价（元）</th>
						<th>商品图片</th>
						<th>商品数量</th>
						<th>日期</th>
						<th>商品类型</th>
						<th>操作</th>
					</tr>
					<!-- products为pagebean分页实体 list属性为当前页的数据 -->
					<c:forEach items="${products.list}" var="p">
						<tr>
						    <td style="width: 50px;text-align: center;">
						    	<input type="checkbox" name="id" value="${p.id}" style="width: 20px;height: 20px;">
						    </td>
							<td>${p.name}</td>
							<td>${p.content}</td>
							<td>${p.price}</td>
							<td><img width="55px" height="45px"
								src="${pageContext.request.contextPath}/resources/image_big/${p.image}"></td>
							<td>${p.number}</td>
							<td><fmt:formatDate value="${p.date}" pattern="yyyy-MM-dd hh:mm:ss"/>
							</td>
							<td>${p.typename}</td>
							<td>
								<button type="button" class="btn btn-info myupdate"
									onclick="pmodify(${p.id})">修改</button>
								<button type="button" class="btn btn-warning" id="mydel"
									onclick="pdel(${p.id})">删除</button>
							</td>
						</tr>
					</c:forEach>
				</table>
				<!--分页栏-->
				<div class="footNum">
					<ul>
						<c:choose>
							<c:when test="${products.page eq 1 }">
								<li class="pre"><a href="javascript:void(0)">上一页</a></li>
							</c:when>
							<c:otherwise>
								<li class="pre"><a
									href="${pageContext.request.contextPath}/getprobypage?page=${products.page-1}&name=${name}">
										上一页</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="1" end="${products.pages}" step="1" var="index">
							<c:choose>
								<c:when test="${products.page eq index}">
									<li class="num current"><a href="javascript:void(0)">${index}</a></li>
								</c:when>
								<c:otherwise>
									<li class="num"><a
										href="${pageContext.request.contextPath}/getprobypage?page=${index}&name=${name}">${index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${products.page eq products.pages}">
								<li class="last"><a href="javascript:void(0)">下一页</a></li>
							</c:when>
							<c:otherwise>
								<li class="last"><a
									href="${pageContext.request.contextPath}/getprobypage?page=${products.page+1}&name=${name}">
										下一页</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
    /*删除商品  */
    function pdel(id) {
        if (confirm("确定删除吗")) {
            location.href = "${pageContext.request.contextPath}/delproduct?id="+id;//get
        }
    }
    /*修改商品  */
    function pmodify(id) {
        location.href = "${pageContext.request.contextPath}/getproductbyid?id="+id;
    }
</script>
</html>