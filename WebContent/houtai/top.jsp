<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="com.kun.foodsafety.model.Loginor" %> 
<%Loginor loginor = (Loginor)session.getAttribute("loginor"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>食品安全监督管理系统顶部</title>
<script language=JavaScript>
function logout(){
	if (confirm("您确定要退出控制面板吗？"))
	top.location = "login.jsp";
	return false;
}
function shixiao(){
	
}
</script>
</head>
<body bgcolor="#4876FF">
<div>
  <div style="margin-left:30px;margin-top: 20px;float:left;">
    <img alt="" src="../houtai/images/logo.png">
  </div>
  <%if(session.getAttribute("loginor")==null){ %>
  <div style="margin-left:250px;margin-top: 55px;float:left;background-color: yellow;width: 150px;height: 30px;">
                       超过5分钟未操作，您的登陆已失效！<br>
        <a href="../houtai/login.jsp" target="_top">返回登陆页面</a>             
  </div>
  <%}else{ %>
  <div style="margin-left:550px;margin-top: 55px;float:left;">
             您好，欢迎:<%=loginor.getuEmployeeId() %> 管理员 登陆系统<br/>
             您上一次登陆系统的时间为:<%=loginor.getuOuttime() %><br/>  
      <div style="margin-left:200px;">
       <a href="#" target="_self" onClick="logout();">
        <img src="images/out.gif" alt="安全退出" width="50px" height="20px" border="0">
       </a>
     
      </div>
 
  </div>
  <%} %>
  
</div>
</body>
</html>