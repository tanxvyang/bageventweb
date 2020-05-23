<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta name="description" content="注册界面" />
	<title>注册界面</title>
	<link rel="stylesheet" href="<%=basePath%>/css/jq22.css">
	<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.css">
	<script type="text/javascript" src="<%=basePath%>js/laydate/laydate.js"></script>
	<script src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
	<style type="text/css">
	.red{
		color:red;
	}
	.green{
		color:green;
	}
	</style>
	<script type="text/javascript">
	$(function(){
			$.ajax({
				type:"POST",
				url:"<%=basePath%>province/getAllProvince.do",
				success:function(msg){
					var provinces = $.parseJSON(msg);
					var province = $("#location");
					for(var i=0;i<provinces.length;i++){
						var option=$("<option value='"+provinces[i].pro+"'>"+provinces[i].pro+"</option>");
						province.append(option);
					}
				}
				
			});
			
		});
	
		function addUser(){
		var userName = $("#username").val();
		var userPwd = $("#pwd").val();
		var userPwd2 = $("#userPwd2").val();
		var iphone = $("#iphone").val();
		var location = $("#location").val();
			if(userName.length < 2 ){
				alert("用户姓名格式错误：用户名需要由两个以上字符组成1");
				return false;
			}
			//if(/^\w{1,4}$/.test(userName)){
			//	alert("用户姓名格式错误：中文");
			//	return false;
			//}
			if(!/^\w{6,16}$/.test(userPwd)){
				alert("用户密码格式错误：6-16位数字、字母、下划线");
				return false;
			}
			if(userPwd != userPwd2){
				alert("两次密码不一致");
				return false;
			}
			if(iphone.length != 11 ){
				alert("手机号格式填写错误");
				return false;
			}
			if( location == "" ){
				alert("所在地不能为空");
				return false;
			}
			return true;
		}
		
		
		
	</script>
  </head>
  
  <body>
  
    <div id="login">
    <div class="wrapper">
        <div class="login">
            <form action="<%=basePath %>user/regist.do" method="post" class="container offset1 loginform" onsubmit="return addUser()" >
                <div id="owl-login">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad">
                    <div class="control-group">
                        <div class="controls text-center">
                            <h4>用户注册</h4>
                        </div>
                    </div>
                    <div class="control-group">
                        &nbsp;
                    </div>
                    
                    <div class="control-group">
                        <div class="controls">
                            <label for="userName" id="userNameMsg" class="glyphicon glyphicon-user"></label>
                            <input id="username" type="text" name="username"  placeholder="用户名" 
                            autofocus="autofocus" required="required" tabindex="1"  
                            class="form-control input-medium" >
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="password"  id="userPwdMsg" class="glyphicon glyphicon-th"></label>
                            <input id="pwd" type="password" name="pwd" placeholder="密码(6-16个字符)" required="required" tabindex="2" class="form-control input-medium">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="password" id="userPwdMsg2"  class="glyphicon glyphicon-th"></label>
                            <input id="userPwd2" type="password"  placeholder="确认密码" required="required" tabindex="3" class="form-control input-medium">
                        </div>
                    </div>
                     
                    <div class="control-group">
                        <div class="controls">
                            <label for="Number"  class="glyphicon glyphicon-user"></label>
                            <input id="iphone" name="iphone"  type="text"  placeholder="手机号码 " required="required"  tabindex="4"  class="form-control input-medium">
                        </div>
                    </div>
		    <div class="control-group">
                        <div class="controls">
                            <input id="sex" type="radio" name="sex" value="1"  tabindex="5" checked="checked"/>男    
                            <input id="sex" type="radio" name="sex" value="0"  tabindex="6"/>女 </div>
                    </div>
		    <div class="control-group">
                        <div class="controls">
                            <label for="birthday" id="birthdayMsg" class="glyphicon glyphicon-user"></label>
                            <input id="birthday" name="birthday" type="text"  placeholder="生日 " required="required"  tabindex="7"  class="form-control input-medium" onclick="laydate()">
                        </div>
                    </div>
		    <div class="control-group">
                        <div>
                            <label for="loc" id="locMsg" class="glyphicon glyphicon-user"></label>
                            <!-- 
                            <input id="location" name="location" type="text"  placeholder="所在地 " required="required"  tabindex="7"  class="form-control input-medium">
                             -->
                        	<select id="location" name="location"  >
                        		<option value ="">请选择地区</option>
                        	</select>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <a href="user/login.jsp" tabindex="9" class="btn btn-link text-muted " style="color:red">返回登录</a>
                    <button type="submit" tabindex="8" class="btn btn-primary">点击注册</button>
                </div>
            </form>
        </div>
    </div>
    </div>
    
	<script type="text/javascript" src="<%=basePath%>/js/canvas-particle.js"></script>
	<script src="<%=basePath%>/js/jquery.min.js"></script>
    <script type="text/javascript" >
    $(function() {

        $('#login #pwd,#login #userPwd2').focus(function() {
            $('#owl-login').addClass('password');
        }).blur(function() {
            $('#owl-login').removeClass('password');
        });
        var config = {
				vx: 4,
				vy:  4,
				height: 2,
				width: 2,
				count: 300,
				color: "121, 162, 185",
				stroke: "100,200,180",
				dist: 8000,
				e_dist: 60000,
				max_conn: 10
			};
			CanvasParticle(config);
         
    });
    </script>
     <c:if test='${isError}'>
			<script type="text/javascript">
				alert("${errorMessage}");
			</script>  
		</c:if>
  </body>
</html>
