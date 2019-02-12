<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<link href="css/login.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript">
var pw="";
var right=0;

function judgeId(){//输入用户失去光标时判断输入的工号是否存在得到密码和权限
	//ajax，输入工号，传到Operatorcon，判断该工号是否存在和得到该工号对应的权限和密码
	$.post("login_JudgeId.do",{oId:$("#oId").val()},function(info){
		if( "0"==info ){
			alert("该工号不存在请确认后重新输入");
			$("#oId").val("");
			$("#oId").focus();
			return false;
		}else{
			var infos = eval("("+info+")");//得到数组类型的值
			for(var i = 0 ; i<infos.length;i++){
				pw = infos[i].oPassword;
				right = infos[i].oRight;
				alert(pw+"***"+right);
			}
		}
		
	});
}

$(document).ready(function(){
	
	$(".ibtnentercssclass").click(function(){
		
		if(""==$("#oId").val()){
			alert("用户名不能为空！");
			$("#oId").focus();
			return false;
		}
	    if(""==$("#oPassword").val()){
			alert("密码不能为空！");
			$("#oPassword").focus();
			return false;
		}
	    
	    if(pw!=$("#oPassword").val()){
			alert("密码错误！");
			$("#oPassword").focus();
			return false;
		}else{//往登陆表里加信息,到分别对应的后台页面，operator对象带过去，
			window.location.href="addLoginor.do?oId="+$("#oId").val()+"&oRight="+right;
		}
	});
	
});
</script>
</head>
<body id="userlogin_body">

<div id="user_login">
	<dl>
		<dd id="user_top">
			<ul>
				<li class="user_top_l"></li>
				<li class="user_top_c"></li>
				<li class="user_top_r"></li>
			</ul>
		</dd>
		<dd id="user_main">
			<ul>
				<li class="user_main_l"></li>
				<li class="user_main_c">
					<div class="user_main_box">
						<ul>
							<li class="user_main_text">用户工号： </li>
							<li class="user_main_input"><input name="TxtUserName" maxlength="20" id="oId" onblur="judgeId()"> </li><!-- class="txtusernamecssclass" -->
						</ul>
						<ul>
							<li class="user_main_text">密 码： </li>
							<li class="user_main_input"><input type="password" name="TxtPassword" id="oPassword" > </li><!-- class="txtpasswordcssclass" -->
						</ul>
						<ul>
							<li class="user_main_text">Cookie： </li>
							<li class="user_main_input"><select name="DropExpiration" id="DropExpiration"> 
							<option selected="selected" value="None">不保存</option>
							<option value="Day">保存一天</option> 
							<option value="Month">保存一月</option> 
							<option value="Year">保存一年</option></select> </li>
						</ul>
					</div>
				</li>
				<li class="user_main_r"><input type="image" name="IbtnEnter" src="images/user_botton.gif" class="ibtnentercssclass"></li>
			</ul>
		</dd>
		<dd id="user_bottom">
			<ul>
				<li class="user_bottom_l"></li>
				<li class="user_bottom_c"></li>
				<li class="user_bottom_r"></li>
			</ul>
		</dd>
	</dl>
</div>


</body>
</html>