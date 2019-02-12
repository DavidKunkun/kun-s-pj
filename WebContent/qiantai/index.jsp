<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>食品安全监督管理系统</title>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<link rel="stylesheet" href="css/main.css" />
<style>
        .img1
        {
            position: relative;
            width:100%;
            height:230px;
        }
        .img2
        { 
            position: relative;
            width:100%;
            height:114px;
        }
        .img3
        {
            width:100%;
            height:250px;
        }
a:link {text-decoration:none;}
a:visited {text-decoration:none;}
a:hover {text-decoration:underline;}
a:active {text-decoration:underline;} 
</style>
<script src="../js/jquery-1.11.1.min.js"></script>
<script src="../js/unslider.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
	
	//middleimages();
	
	var progress = $("#progress"),li_width = $("#b04 li").length;
    var unslider04 = $('#b04').unslider({
		dots: true,
		complete:function(index){//自己添加的，官方没有
			progress.animate({"width":(100/li_width)*(index+1)+"%"});
		}
	}),

	data04 = unslider04.data('unslider');
	$("#unslider-arrow04_1").click(function() {
        var fn = this.className.split(' ')[1];
        data04[fn]();
        //alert(1);
    });
	$("#unslider-arrow04_2").click(function() {
        var fn = this.className.split(' ')[1];
        data04[fn]();
    });
	
	//第二个轮播图
	var progress2 = $("#progress2"),li_width2 = $("#c04 li").length;
    var cunslider04 = $('#c04').unslider({
		dots: true,
		complete:function(index){//自己添加的，官方没有
			progress2.animate({"width":(100/li_width2)*(index+1)+"%"});
		}
	}),

	cdata04 = cunslider04.data('unslider');
	$('#c_unslider-arrow04_1').click(function() {
        var fn = this.className.split(' ')[1];
        cdata04[fn]();
    });
	$('#c_unslider-arrow04_2').click(function() {
        var fn = this.className.split(' ')[1];
        cdata04[fn]();
    });
	
});
</script>

</head>
<body>
<div>
   <!-- 顶部 -->
   <div style="width:100%;height: 25%; ">
     <div style="margin-left:30%;margin-top: 20px;">
        <img alt="" src="../houtai/images/logo.png">
     </div>
   </div>
   <!--  -->
   <div style="height: 60%;">
       <!--  -->
      <div style="float:left;width:25%;height:100%;margin-right: 50px;border-right: 1px solid black;" align="center">
         <!-- <form action="" method="post" enctype="application/x-www-form-urlencoded">
            <table style="border: solid thin black">
               <tr><td>请输入想要查询的食品许可证编号：</td></tr>
               <tr><td><input id="fShengChanPiCiId" name="fShengChanPiCiId" maxlength="20" title="长度不超过20"/>
               <input type="button" id="submit" name="submit" value="查询"/></td></tr>
            </table>
         </form> -->
         <ul>
            <li style="padding: 12px;"><a href="">商户信息查询</a>
            <li style="padding: 12px;"><a href="">食品信息查询</a>
            <li style="padding: 12px;"><a href="">生产公司信息查询</a>
         </ul>
      </div> 
      <!--  -->
      <div id="middlediv" style="float:left;width:50%;height:100%">
         <div id="div1">
	     <div class="banner" style="width:70%;float:left;height:230px;" id="b04">
	     	<!-- <img src="../images/m1.jpg" class="img1" alt="传阿里即将控股A站|早报"> -->
	          <ul id="ul">
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m1.jpg" class="img1" alt="传阿里即将控股A|早报"><span class="slider-title"><em></em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m2.jpg" class="img1" alt="如果你是创业者，你或许应该琢磨琢磨投资人是怎么想的"><span class="slider-title"><em></em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m3.jpg" class="img1" alt="傅盛：生物学思维给我的四个启示"><span class="slider-title"><em></em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m5.jpg" class="img1" alt="重仓何小鹏"><span class="slider-title"><em></em></span></a></li> 
	        </ul>
	        <div class="progress"></div>
	<a href="javascript:void(0);" id="unslider-arrow04_1" class="unslider-arrow04 prev"><img class="arrow" id="al" src="../houtai/images/z1.png" alt="prev" width="20" height="35"></a>
	<a href="javascript:void(0);" id="unslider-arrow04_2" class="unslider-arrow04 next"><img class="arrow" id="ar" src="../houtai/images/z2.png" alt="next" width="20" height="37"></a>
	     </div>
	     
       <div id="div1_2" style="float:left;width:29%;margin-left:5px;">
           <div id="div1_2_1">
              <a href=""><img class="img2" src="../houtai/images/m5.jpg" alt="logo处"/></a>
           </div>
           <div id="div1_2_2">
              <a href=""><img class="img2" src="../houtai/images/m2.jpg" alt="logo处"/></a>
           </div>
       </div>
  </div>
  <div id="div2">
     <div class="div2_1">
        <!-- <a href="#"><img src="../images/m9.jpg" class="img3" alt="广告2区"></a> -->
        <div class="banner" style="width:100%;height:250px;float:left" id="c04">
	          <ul id="ul2">
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m5.jpg" class="img3" alt="传阿里即将控股A站|早报"><span class="slider-title"><em></em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m3.jpg" class="img3" alt="如果你是创业者，你或许应该琢磨琢磨投资人是怎么想的"><span class="slider-title"><em></em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m2.jpg" class="img3" alt="傅盛：生物学思维给我的四个启示"><span class="slider-title"><em></em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m1.jpg" class="img3" alt="重仓何小鹏"><span class="slider-title"><em></em></span></a></li> 
	        </ul>
	        <div id="progress2" class="progress"></div>
	<a href="javascript:void(0);" id="c_unslider-arrow04_1" class="unslider-arrow04 prev"><img class="arrow" id="al" src="../houtai/images/z1.png" alt="prev" width="10" height="25"></a>
	<a href="javascript:void(0);" id="c_unslider-arrow04_2" class="unslider-arrow04 next"><img class="arrow" id="ar" src="../houtai/images/z2.png" alt="next" width="10" height="25"></a>
	     </div>
     </div>
  </div>
  
      
      </div>
      <!--  -->
      <div style="float:left;height:100%;border-left: 1px solid black">
          <ul>
            <li>监督管理部门联系方式：
            <li>邮箱：<a href=""></a>
            <li>电话：<a href=""></a>
         </ul>
      </div>
   </div>
   
   <!-- 底部div -->
   <div style="height: 15%;">
     <div style="width:50px;height:50px;margin-left: 500px;margin-top: 15px;float:left;">
      <img alt="" src="../houtai/images/bottom_logo.png">
     </div>
     <div style="float:left;margin-left: 100px;margin-top: 8px;">
       <div >
          <img alt="" src="../houtai/images/bottom_phone.png">
          &nbsp;&nbsp;
                         联系方式：18054168897
       </div>
       <div style="margin-top: 10px;">
          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;   
          <font size="2">
                       版权所有：续泽坤<br/>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
                      技术支持：火狐+IE+Google
          </font>
       </div>
    </div>
  </div>
</div>
</body>
</html>