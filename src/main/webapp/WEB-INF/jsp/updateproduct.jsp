<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/addBook.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/ajaxfileupload.js"></script>
</head>
<script type="text/javascript">
         function fileChange(){//注意：此处不能使用jQuery中的change事件，因此仅触发一次，因此使用标签的：onchange属性
            $.ajaxFileUpload({
                url: '${pageContext.request.contextPath}/produpload',//用于文件上传的服务器端请求地址
                secureuri: false,//一般设置为false
                fileElementId: 'upimage',//文件上传控件的id属性  <input type="file" id="upimage" name="upimage" />
                dataType: 'json',//返回值类型 一般设置为json
                success: function(obj,status){//服务器成功响应处理函数
                    $("#imgDiv").empty();  //清空原有数据
                    //创建img 标签对象
                    var imgObj = $("<img>");
                    //给img标签对象追加属性
                    //alert(obj.imgurl);
                    imgObj.attr("src",obj.imgurl);
                    imgObj.attr("width","100px");
                    imgObj.attr("height","100px");
                    //将图片img标签追加到imgDiv末尾
                    $("#imgDiv").append(imgObj);
                    //将图片的名称（从服务端返回的JSON中取得）赋值给文件本框
                    //alert(obj.imgName);
                    $("#pimage").val(obj.imgName);
                },
                error: function (obj,status,e)//服务器响应失败处理函数
                {
                    alert(e.message);
                }
            });
        }
        
    </script>
<body>
	<!--取出上一个页面上带来的page的值-->

	<div id="addAll">
		<div id="nav">
			<p>商品管理>修改商品</p>
		</div>

		<div id="table">
			<form action="${pageContext.request.contextPath}/updateproduct" method="post" id="myform">
				<!--修改商品信息，需要根据id进行修改，所以使用了隐藏域（实际存在，但是不显示在页面）传递参数  -->
				<input type="hidden" name="id" class="two" value="${product.id }">
				<table>
					<tr>
						<td class="one">商品名称</td>
						<td><input type="text" name="name" class="two"
							value="${product.name }"></td>
					</tr>
					<!--错误提示-->
					<tr class="three">
						<td class="four"></td>
						<td><span id="pnameerr"></span></td>
					</tr>
					<tr>
						<td class="one">商品介绍</td>
						<td><input type="text" name="content"
							value="${product.content }" class="two"></td>
					</tr>
					<!--错误提示-->
					<tr class="three">
						<td class="four"></td>
						<td><span id="pcontenterr"></span></td>
					</tr>
					<tr>
						<td class="one">定价</td>
						<td><input type="number" name="price"
							value="${product.price }" class="two"></td>
					</tr>
					<!--错误提示-->
					<tr class="three">
						<td class="four"></td>
						<td><span id="priceerr"></span></td>
					</tr>

					<tr>
						<td class="three">图片介绍</td>
						<td><br>
							<div id="imgDiv"
								style="display: block; width: 40px; height: 50px;">
								<img
									src="${pageContext.request.contextPath}/resources/image_big/${product.image}"
									width="100px" height="100px">
							</div> <br>
						<br>
						<br>
						<br> <input type="file" id="upimage" name="upimage" onchange="fileChange()"> 
							<input type="hidden" id="pimage" name="image"> <span id="imgName"> </span><br></td>
					</tr>
					<tr class="three">
						<td class="four"></td>
						<td><span></span></td>
					</tr>

					<tr>
						<td class="one">总数量</td>
						<td><input type="number" name="number"
							value="${product.number }" class="two"></td>
					</tr>
					<!--错误提示-->
					<tr class="three">
						<td class="four"></td>
						<td><span id="numerr"></span></td>
					</tr>


					<tr>
						<td class="one">类别</td>
						<td>
						<!-- 要显示当前商品的商品类型  ，还可以修改重新选择别的商品类型 -->
						<select name="typeid">
								<c:forEach items="${ptlist}" var="type">
									<option value="${type.id}"
										<c:if test="${type.id==product.typeid}">
													selected="selected"
												</c:if>>${type.name}</option>

								</c:forEach>
						</select>
						</td>
					</tr>
					<!--错误提示-->
					<tr class="three">
						<td class="four"></td>
						<td><span></span></td>
					</tr>

					<tr>
						<td colspan="2"><input type="submit" value="提交" class="btn btn-success">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>

</html>