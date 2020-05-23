<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0"> 
	<title>登录界面</title>
    <link href="css/default.css" rel="stylesheet" type="text/css" />
	<!--必要样式-->
    <link href="css/styles.css" rel="stylesheet" type="text/css" />
    <link href="css/demo.css" rel="stylesheet" type="text/css" />
    <link href="css/loaders.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
	String usernameInput ="" ;// 防空处理
	String passwordInput ="";
	if( request.getAttribute( "username" ) != null ){
		usernameInput = ( String ) request.getAttribute( "username" );
	}
	%>
	<div class='login'>
	  <div class='login_title'style="margin-left: 50px">
	    <span>管理员登录</span>
	  </div>
	    <form action="<%=basePath %>user/login.do" method="post" class="container offset1 loginform"">
	  <div class='login_fields' style="margin-left: 50px">
	    <div class='login_fields__user'style="margin: auto auto">
	      <div class='icon'>
	        <img alt="" src='img/user_icon_copy.png'>
	      </div>
	      <input required="required" class="form-control" style="margin: auto auto" name="username" placeholder='用户名' maxlength="16" type='text' autocomplete="off" value="<%=usernameInput%>"/>
	        <div class='validation'>
	          <img alt="" src='img/tick.png'>
	        </div>
	    </div>
	    <div class='login_fields__password'style="margin: auto auto">
	      <div class='icon'>
	        <img alt="" src='img/lock_icon_copy.png'>
	      </div>
	      <input required="required" class="form-control"  style="margin: auto auto" name="password" placeholder='密码' maxlength="16" type='text' autocomplete="off">
	      <div class='validation'>
	        <img alt="" src='img/tick.png'>
	      </div>
	    </div>
	  <!-- 
	   -->
	     <div class='login_fields__submit'>
	      <input type="submit" tabindex="3"  class="btn btn-primary" value="登录">
	    <br><br>
	     <a href="register.jsp" tabindex="4" class="btn btn-link text-muted"  >
	      <input type="button" tabindex="3"  class="btn btn-primary" value="注册">
	    </a>
	    </div>
	    <br><br>
	    <a href="../login.jsp" tabindex="4" class="btn btn-link text-muted"  style="color:red;margin-bottom:10px;float:right;">超级管理员登录</a>
	    </div>
	  </form>
	  
	</div>
    <link href="layui/css/layui.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src='js/stopExecutionOnTimeout.js?t=1'></script>
    <script type="text/javascript" src="layui/layui.js"></script>
    <script type="text/javascript" src="js/Particleground.js"></script>
    <script type="text/javascript" src="Js/Treatment.js"></script>
    <script type="text/javascript" src="js/jquery.mockjax.js"></script>
	<script type="text/javascript">
	    $(document).keypress(function (e) {
	        // 回车键事件  
	        if (e.which == 13) {
	            $('input[type="button"]').click();
	        }
	    });
	    //粒子背景特效
	    $('body').particleground({
	        dotColor: '#E8DFE8',
	        lineColor: '#133b88'
	    });
	    $('input[name="password"]').focus(function () {
	        $(this).attr('type', 'password');
	    });
	    $('input[type="text"]').focus(function () {
	        $(this).prev().animate({ 'opacity': '1' }, 200);
	    });
	    $('input[type="text"],input[type="password"]').blur(function () {
	        $(this).prev().animate({ 'opacity': '.5' }, 200);
	    });
	    $('input[name="username"],input[name="password"]').keyup(function () {
	        var Len = $(this).val().length;
	        if (!$(this).val() == '' && Len >= 5) {
	            $(this).next().animate({
	                'opacity': '1',
	                'right': '30'
	            }, 200);
	        } else {
	            $(this).next().animate({
	                'opacity': '0',
	                'right': '20'
	            }, 200);
	        }
	    });
	function BeforeSubmit(){
	        //非空验证
	            var login = $('input[name="username"]').val();
	            var pwd = $('input[name="password"]').val();
	            if (login == ''||login == '用户名') {
	                alert('请输入您的账号');
	                return false;
	            } else if (pwd == ''||pwd == '密码') {
	                alert('请输入密码');
	                return false;
	            }
	            return true;
	    }
	 
	
    </script>
    <script language="javascript"> 
   if(top.location!==self.location){ 
    top.location.href=self.location.href; 
} 
</script> 
      <c:if test='${isError}'>
			<script type="text/javascript">
				alert("${errorMessage}");
			</script>  
		</c:if>
</body>
</html>