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
	<meta name="description" content="登录界面" />
	<title>登录界面</title>
	<link rel="stylesheet" href="/css/jq22.css">
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/bootstrap.css">
	<style type="text/css">
	#msg2{
		color:red;
	}
</style>
  </head>
<script language="javascript"> 
   if(top.location!==self.location){ 
    top.location.href=self.location.href; 
} 
</script> 
  <body>
  <%
	String usernameInput ="" ;// 防空处理
	String passwordInput ="";
	if( request.getAttribute( "username" ) != null ){
		usernameInput = ( String ) request.getAttribute( "username" );
	}
	%>
    <div id="login">
    <div class="wrapper">
        <div class="login">
            <form action="<%=basePath %>user/login.do" method="post" class="container offset1 loginform">
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
                            <h4>管理员登录</h4>
                        </div>
                    </div>
                    <div class="control-group">
                        &nbsp;
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="name" id="nameMsg" class="glyphicon glyphicon-user"></label>
                            <input id="name" type="text" name="username" placeholder="用户名"  required="text"  tabindex="1" autofocus="autofocus" class="form-control input-medium"  value="<%=usernameInput%>">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="userPwd" id="userPwdMsg" class="glyphicon glyphicon-th"></label>
                            <input id="userPwd" type="password" name="password" required="text" placeholder="密码" tabindex="2" class="form-control input-medium">
                        </div>
                    </div>
		   
                </div>
                <div class="form-actions"><a href="user/register.jsp" tabindex="4" class="btn btn-link text-muted"  style="color:red">新用户注册</a>
                    <input type="submit" tabindex="3"  class="btn btn-primary" value="登录">
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>/js/canvas-particle.js"></script>
	<script src="<%=basePath%>/js/jquery.min.js"></script>
    
    <script type="text/javascript">
		window.onload = function(){
			var config = {
				vx: 4,
				vy:  4,
				height: 2,
				width: 2,
				count: 300,
				color: "121, 162, 185",
				stroke: "100,200,180",
				dist: 6000,
				e_dist: 20000,
				max_conn: 10
			};
			CanvasParticle(config);
		};
		
		 
		
		
	</script>
    <script>
    $(function() {

        $('#login #userPwd').focus(function() {
            $('#owl-login').addClass('password');
        }).blur(function() {
            $('#owl-login').removeClass('password');
        });
    });
    </script>
    
    <c:if test='${isError}'>
			<script type="text/javascript">
				alert("${errorMessage}");
			</script>  
		</c:if>
  </body>
  
</html>
