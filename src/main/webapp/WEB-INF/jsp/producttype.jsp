<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script type="text/javascript">
    function addproducttypepage(){
    	window.location.href="${pageContext.request.contextPath}/addproducttypepage";//get
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/kkpage.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/kkpage.js"></script>
<title></title>
</head>

<body>
	<div id="brall">
		<div id="nav">
			<p>商品类型管理>商品类型列表</p>
		</div>
		<div id="condition" style="text-align: center">
			<form  id="myform">
			        商品类型ID：<input name="tid" id="tid" value="${tid }" placeholder="请输入商品类型ID">
				商品类型名称：<input name="tname" id="tname" value="${tname }" placeholder="请输入商品类型名称">
				<input id="search" type="button"  value="查询" />
			</form>
		</div>
		<br>
		<div id="table">
			<div id="top">
				<input type="button" class="btn btn-warning" id="btn1" value="新增商品类型" onclick="addproducttypepage()">
			</div>
			<!--显示没有分页的商品信息-->
			<div id="middle">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
						    <th>商品类型ID</th>
							<th>商品类型名称</th>
							<th>操作</th>
						</tr>
					</thead>
					<!-- 动态生成数据，做数据的显示的局部刷新 -->
					<tbody id="producttypelist"></tbody>
				</table>
				<!--分页栏 动态生成-->
				<div id="kkpager"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
    //修改函数
    function modify(id) {
        location.href = "${pageContext.request.contextPath}/toupdateprotypepage?id="+id;//get
    }
    //删除函数
	$(document).ready(function(){
		  $(document).on("click",".del",function(){
			  	var id = $(this).attr("name");
				if(confirm("确定要删除吗？")){
					location.href="${pageContext.request.contextPath}/delproducttype?id="+id;//get
				}
		   });
	});
    
    //分页的js代码
    //第一次进入页面默认显示第一页的数据
	var currentPage = 1;
	//查询  
	function loadData(page) {
		currentPage = page;
		//获取查询的参数
		//商品类型的ID值
		var tid = $("#tid").val();
		if(tid == ''){
			tid = -1;
		}
		//商品类型的名称值
		var tname = $("#tname").val();
		//异步加载数据 参数的格式为json格式的参数{currentPage:page} 参数的名称currentPage 参数的值page
		//在springmvc中使用Map集合接受参数，还需要注解@RequestParam
		//数据返回的对象名称为data,名称可以自定义，返回的格式有时json
		$.post('${pageContext.request.contextPath}/producttype_list_ajax', {currentPage:page,typeId:tid,typeName:tname}, function(data){
				//先清除前一步的数据tbody
 				$("#producttypelist").html("");
				//先清除前一步的分页div
				$("#kkpager").html("");
				//遍历数据 生成动态的数据 附加到tbody里面去 ，data就是我们的分页的实体类PageBean转换后的Map集合,list键就是数据
				if (data.list != null && data.list.length > 0) {
					for (var i = 0; i < data.list.length; i++) {
					    //将数据动态的附加到<tbody id="producttypelist"></tbody>
						$("#producttypelist").append("<tr>"+
						"<td>"+data.list[i].id+"</td>"+
						"<td>"+data.list[i].name+"</td>"+
						"<td><a href='#' onclick=location.href='${pageContext.request.contextPath}/producttypemodify?id="+data.list[i].id+"'>修改</a>"+
						"<a  href='#' class='del'  name="+data.list[i].id+">删除 </a>"+
						"</td></tr>");	
					}
				}
				//分页脚标 ：data.pageSize每页显示数， data.pageCount总的页数， data.rowCount总的行数
				createPageInfo(page,data.pageSize,data.pageCount,data.rowCount,goToPage);
		},"json" ); 
	}  

		function goToPage(n){
			loadData(n);
		}
		
		//载入 (默认加载全部) 默认第一次为currentPage为 1
		loadData(currentPage);  
		 
	    //init
	    function createPageInfo(currentPage,pageSize,pageCount,recordCount,callbackFunction){
	    	
	    	var totalPage = pageCount;
	    	var totalRecords = recordCount;
	    	var pageNo = currentPage;
		    	if(!pageNo){
	    		pageNo = 1;
	    	} 

	 	    $("#kkpager").html("");

		    	
	    	//生成分页
	    	//有些参数是可选的，比如lang，若不传有默认值
			kkpager.inited = false;
		    	kkpager.generPageHtml({
	    		pno : pageNo,
	    		//总页码
	    		total : totalPage,
	    		mode : 'click',
	    		//总数据条数
	    		totalRecords : totalRecords,
	    		click : function(n){
	    	        //这里可以做自已的处理
	    	        //处理完后可以手动条用selectPage进行页码选中切换
	    	       callbackFunction(n);
	    	       kkpager.selectPage(n)
	    	    }
	    	}); 
	    }
	    
	    //查询按钮的提交
		$("#search").bind("click",function(){
			loadData(currentPage);	
		});
</script>
</html>