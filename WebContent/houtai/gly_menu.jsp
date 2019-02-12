<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员菜单</title>
<script src="../js/prototype.lite.js" type="text/javascript"></script>
<script src="../js/moo.fx.js" type="text/javascript"></script>
<script src="../js/moo.fx.pack.js" type="text/javascript"></script>
<script type="text/javascript">
document.onclick = function(){
	if(<%=session.getAttribute("loginor") %>==null){ 
	       alert("您的登陆已失效，请重新登陆");
	       top.location="login.jsp";
	}
};
</script>
<style>
body {
	font: 12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin: 0px;
}

#container {
	width: 182px;
}

H1 {
	font-size: 12px;
	margin: 0px;
	width: 182px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;
}

H1 a {
	display: block;
	width: 182px;
	color: #000;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	/* background-image: url(images/menu_bgs.gif); */
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;
}

.content {
	width: 182px;
	height: 26px;
}

.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}

.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
    display: block; /* display: none; */
	text-decoration: none;
	height: 26px;
	width: 182px;
	padding-left: 0px;
}

.MM {
	width: 182px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px, 0px, 0px, 0px);
}

.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}

.MM a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}

.MM a:active {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}

.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	font-weight: bold;
	color: #006600;
	background-image: url(images/menu_bg2.gif);
	background-repeat: no-repeat;
	text-align: center;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
</style>
</head>

<body>
	<table width="100%" height="100%" border="0" cellpadding="0"
		cellspacing="0" bgcolor="#EEF2FB">
		<tr>
		    <td width="182" align="center" ><font size="4" style="font-weight: bold;">管理主菜单栏</font></td>
		</tr>
		<tr>
			<td width="182" valign="top"><div id="container">
			<h1 class="type"><a href="javascript:void(0)">食品经营主体信息管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="right.jsp" target="rightFrame">回到首页</a></li>
          <li><a href="addCompany.jsp" target="rightFrame">添加公司信息</a></li>
          <li><a href="addstore.jsp" target="rightFrame">添加商户信息</a></li>
          <li><a href="selCompanyByPage.do" target="rightFrame">食品公司基本信息</a></li>
          <li><a href="selStoreByPage.do" target="rightFrame">商户基本信息</a></li>
        </ul>
      </div>
           <h1 class="type"><a href="javascript:void(0)">食品基本信息管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="right.jsp" target="rightFrame">回到首页</a></li>
          <li><a href="addFood.jsp" target="rightFrame">添加食品信息</a></li>
          <li><a href="selFoodByPage.do" target="rightFrame">食品基本信息</a></li>
        </ul>
      </div>
			 <h1 class="type"><a href="javascript:void(0)">食品质量信息管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="right.jsp" target="rightFrame">回到首页</a></li>
          <li><a href="selCompanyFoodByPage.do" target="rightFrame">质量准入查看</a></li>
          <li><a href="addZhiJian.jsp" target="rightFrame">提交质量检测报告</a></li>
        </ul>
      </div>
		 <h1 class="type"><a href="javascript:void(0)">市场管理</a></h1>
      <div class="content">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
            </tr>
          </table>
        <ul class="MM">
          <li><a href="right.jsp" target="rightFrame">回到首页</a></li>
          <li><a href="selXunJianByPage.do" target="rightFrame">巡检查处记录</a></li>
          <li><a href="addXunJian.jsp" target="rightFrame">添加案件查处信息</a></li>
          <li><a href="selZhaoHuiByPage.do" target="rightFrame">召回食品信息</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">系统管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="right.jsp" target="rightFrame">回到首页</a></li>
          <li><a href="addShouYeGongGao.jsp" target="rightFrame">添加首页公告信息</a></li>
          <li><a href="addOperator.jsp" target="rightFrame">新添操作人</a></li>
          <li><a href="selOperatorByPage.do" target="rightFrame">操作人信息设置</a></li>
        </ul>
      </div>
				</div> <script type="text/javascript">
					var contents = document.getElementsByClassName('content');
					var toggles = document.getElementsByClassName('type');

					var myAccordion = new fx.Accordion(toggles, contents, {
						opacity : true,
						duration : 400
					});
					myAccordion.showThisHideOpen(contents[0]);
				</script></td>
		</tr>
	</table>
</body>
</html>
