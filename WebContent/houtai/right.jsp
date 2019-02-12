<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员首页</title>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<link rel="stylesheet" href="css/main.css" />
<style>
        .img1
        {
            position: relative;
            width:100%;
            height:260px;
        }
        .img2
        { 
            position: relative;
            width:100%;
            height:130px;
        }
        .img3
        {
            width:100%;
            height:150px;
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
	
	
});
</script>

</head>
<body>
<div style="align-content:center;width:80%;height:100%">
  <div id="div1" style="margin-left: 19%">
	     <div class="banner" style="width:50%;float:left;height:260px;border: 1px solid black" id="b04">
	     	<!-- <img src="../images/m1.jpg" class="img1" alt="传阿里即将控股A站|早报"> -->
	          <ul id="ul">
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m1.jpg" class="img1" alt="巡检食品酿造厂|早报"><span class="slider-title"><em>巡检食品酿造厂|早报</em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m2.jpg" class="img1" alt="恭喜xx企业喜获良心食品厂|早报"><span class="slider-title"><em>恭喜xx企业喜获良心食品厂|早报</em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m3.jpg" class="img1" alt="上级领导视察食品生产商"><span class="slider-title"><em>上级领导视察食品生产商</em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m5.jpg" class="img1" alt="食品检测技术交流大会"><span class="slider-title"><em>食品检测技术交流大会</em></span></a></li> 
	        </ul>
	        <div class="progress"></div>
	<a href="javascript:void(0);" id="unslider-arrow04_1" class="unslider-arrow04 prev"><img class="arrow" id="al" src="../houtai/images/z1.png" alt="prev" width="20" height="35"></a>
	<a href="javascript:void(0);" id="unslider-arrow04_2" class="unslider-arrow04 next"><img class="arrow" id="ar" src="../houtai/images/z2.png" alt="next" width="20" height="37"></a>
	     </div>
	     
       <div id="div1_2" style="float:left;width:29%;margin-left:5px;border: 1px solid black;">
           <div id="div1_2_1">
              <a href=""><img class="img2" src="../houtai/images/m5.jpg" alt="logo处"/></a>
           </div>
           <div id="div1_2_2">
              <a href=""><img class="img2" src="../houtai/images/m2.jpg" alt="logo处"/></a>
           </div>
       </div>
       
       
       
  </div>
  <div id="div2" style="margin-top:10px;margin-left: 19%;height: 100px;">
  </div>
  <div id="div3" style="margin-top:16%;margin-left: 19%;border: 1px solid black;height: 100px;width: 70%">
     <div><font size="5">公告栏：</font></div>
     <ul>
        <li><a href="">xxxxxxx新闻</a>
        <li><a href="">xxxx公告</a>
        <li><a href="">xxxx商户被停业</a>
     </ul>
  </div>
      
</div>
</body>
</html>