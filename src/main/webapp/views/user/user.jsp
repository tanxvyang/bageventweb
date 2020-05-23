<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>用户管理</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
	<script src="<%=basePath%>js/jquery.js"></script>
	<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>


	<script type="text/javascript">
		var currentPage;
		var oldName = "";
		var oldIphone = "";
  		function search(pageNo){
  			var username = $("#username").val();
  			var iphone = $("#iphone").val();
  			if(oldName != username){
  				pageNo = 1;
  			}
  			if(oldIphone != iphone){
  				pageNo = 1;
  			}
  			oldName = username;
  			oldIphone = iphone;
  			$.ajax({
  				type:"POST",
  				url:"<%=basePath%>user/getUserByPage.do",
  				data:{"pageNo":pageNo,
  					  "username": username,
  					 "iphone":iphone	  
  				},
  				success:function(msg){
  				    document.getElementById("all").checked = false;
  					var pager = $.parseJSON(msg);
  					currentPage = pager;
  					var datas = pager.list;
  					var resultTable = $("#searchTable");
  					resultTable.html($("table tr")[0]);
  					for(var i = 0; i < datas.length;i++){
  						var tr = $("<tr></tr>");
  						var userId = $("<td>"+datas[i].userId+"</td>") ;
  						var name = $("<td>"+datas[i].userName+"</td>") ;
  						var iphone = $("<td>"+datas[i].userPhone+"</td>") ;
  						var status ;
  						if(datas[i].userStatus == 1){
  							status = $("<td>"+"正常"+"</td>") ;
  						}else{
  							status = $("<td>"+"封禁"+"</td>");
  						}
  						var location = $("<td>"+datas[i].userCity+"</td>");
  						var time = $("<td>"+datas[i].userCreateTime+"</td>") ;
  						var opt = $("<td><input id='opt' type='checkbox' name='opt' value='"+datas[i].userId+"'  onclick='checkSelectAll()'/></td>") ;
  						tr.append(opt).append(userId).append(name).append(iphone).append(status).append(location).append(time);
  						resultTable.append(tr);
  					}
  					for(;i<4;i++){
  						var tr = $("<tr><td>&nbsp;</td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
  						resultTable.append(tr);
  					}
  					var startPage = $("#startPage");
  					var lastPage = $("#lastPage");
  					lastPage.attr("onclick","search("+(pager.pageNo - 1)+")");
  					var nextPage = $("#nextPage");
  					nextPage.attr("onclick","search("+(pager.pageNo + 1)+")");
  					var endPage = $("#endPage");
  					endPage.attr("onclick","search("+pager.totalPage+")");
					var state = false;  					
  					if(pager.pageNo == 1){
  						state = true;
  					}
  					startPage.prop("disabled",state);
  					lastPage.prop("disabled",state);
  					state = false;
  					if(pager.pageNo == pager.totalPage){
  						state = true;
  					}
  					nextPage.prop("disabled",state);
  					endPage.prop("disabled",state);
  				}
  			});
  		}
	
	function modifySatus(id){
	//批量操作方法一,页面获取一个数组,传到后台通过循环遍历依次修改
			var Status = id;
  			var arr =new Array();
  			$("input[name =opt]:checked").each(function(){  //遍历选中的复选框
  				var res = $(this).val();  //获取值
  				arr.push(res);  //放入数组
  			});
  				var arrString = arr.join(","); //字符串拼成
			if(arrString.length==0){
  				alert("未选中目标");
  				return false;
  				}
  				
  			$.ajax({
  				type:"POST",
  				url:"<%=basePath%>user/modifyUserStatus.do",
  				//dataType: "json",//表示的数据格式，这里是json格式
  				data:{
  				     "userIdArray":arrString,
  					  "Status": Status
  				},
  				success:function(msg){  
  				if(msg == "true"){
				alert("修改成功!");
  				document.getElementById("all").checked=false;
  				document.getElementsByName("opt").checked=false;
				search(1);
				}
  				}
  			});
  		
  		}

	
	function selectAll(){
			var clickAll = document.getElementById("all").checked;
			var list = document.getElementsByName("opt");
			if(clickAll){
				for(i = 0 ;i < list.length; i++){
						list[i].checked = true;
				}		
			}else{
				for(i = 0 ;i < list.length; i++){
						list[i].checked = false;
				}	
			}
				
		}
		function checkSelectAll(){
			var list = document.getElementsByName("opt");
			
			var count = 0;
			for(i = 0 ;i < list.length; i++){
				if(list[i].checked){
					count++;
				}
			}
			if(count!=4){
				document.getElementById("all").checked =false;
			}else{
				document.getElementById("all").checked =true;
				
			}
			
		}
		
		$(document).ready(function(){
  			search(1);
  			
  		});
	
	</script>

</head>
<body>
	<div id="container"  >
		<div class="page-header">
			<h2>用户列表</h2>
		</div>
		<form action="" >
			<div class="row">
				<div class="col-xs-6 col-sm-3">
					<div class="row">
						<div class="col-xs-8 col-sm-3">
							<span class="btn btn-default">用户名</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<input id="username" name="username"   type="text" class="form-control" />
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-sm-2">
					<div class="row">
						<div class="col-xs-8 col-sm-4">
							<span class="btn btn-default">手机号码</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<input id="iphone" name="iphone" type="text" class="form-control" />
						</div>
					</div>

				</div>
				<div class="col-xs-6 col-sm-4">
					<input type="button" class="btn btn-primary"  value="查询" onclick="search(1)" />
				</div>
			</div>
		</form>
		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4">
				<a id="1" class="btn btn-success" onclick="modifySatus(id)"> 
				<span class="glyphicon glyphicon-ok-sign"></span>恢复使用</a>
				<a id="2" class="btn btn-danger" onclick="modifySatus(id)" >
				 <span class="glyphicon glyphicon-trash"></span> 禁止使用</a>
			</div>
		</div>

		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-xs-6 col-sm-11">
				<div class="table-responsive"
					style="vertical-align: middle;text-align: center;">
					<table id="searchTable"
						class="table table-bordered table-hover table-condensed  ">
						<tr>
							<td><input type="checkbox" id="all" value="全选" onclick="return selectAll()"
								/> 全选</td>
							<td>ID</td>
							<td>用户名</td>
							<td>手机账号</td>
							<td>状态</td>
							<td>城市</td>
							<td>创建时间</td>
						</tr>
							<tr>
								<td><input type='checkbox' name="opt"/>
								</td>
								<td>1</td>
								<td>lufei</td>
								<td>17725935869</td>
								<td>禁用</td>
								<td>2017-05-01 12:06:09
								</td>
							</tr>
					</table>
				<div>
			  		<input id="startPage" type="button" value="首页" onclick="search(1)">
			  		<input id="lastPage" type="button" value="上一页">
			  		<input id="nextPage" type="button" value="下一页">
			  		<input id="endPage" type="button" value="末页">
		  		</div>
				</div>
			</div>
		</div>
	</div>
</body>
<style>
td {
	vertical-align: middle !important;
}
</style>
</html>
