<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
            height:130px;
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
<div id="middlediv" style="float:left;width:85%;height:90%;margin-top: 20px;">
         <div id="div1">
	     <div class="banner" style="width:65%;float:left;height:260px;border: 1px solid black" id="b04">
	     	<!-- <img src="../images/m1.jpg" class="img1" alt="传阿里即将控股A站|早报"> -->
	          <ul id="ul">
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m1.jpg" class="img1" alt="巡检食品酿造厂|早报"><span class="slider-title"><em>巡检食品酿造厂|早报</em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m2.jpg" class="img1" alt="恭喜xx企业喜获良心食品厂|早报"><span class="slider-title"><em>恭喜xx企业喜获良心食品厂|早报</em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m3.jpg" class="img1" alt="上级领导视察食品生产商"><span class="slider-title"><em>上级领导视察食品生产商</em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m9.jpg" class="img1" alt="蒙牛达能2016世界肠道健康日主题峰会现场"><span class="slider-title"><em>蒙牛达能2016世界肠道健康日主题峰会现场</em></span></a></li> 
	        </ul>
	        <div class="progress"></div>
	<a href="javascript:void(0);" id="unslider-arrow04_1" class="unslider-arrow04 prev"><img class="arrow" id="al" src="../houtai/images/z1.png" alt="prev" width="20" height="35"></a>
	<a href="javascript:void(0);" id="unslider-arrow04_2" class="unslider-arrow04 next"><img class="arrow" id="ar" src="../houtai/images/z2.png" alt="next" width="20" height="37"></a>
	     </div>
	     
       <div id="div1_2" style="float:left;width:29%;margin-left:5px;border: 1px solid black">
           <div id="div1_2_1">
              <a href=""><img class="img2" src="../houtai/images/m6.jpg" alt="logo处"/></a>
           </div>
           <div id="div1_2_2">
              <a href=""><img class="img2" src="../houtai/images/m5.jpg" alt="logo处"/></a>
           </div>
       </div>
  </div>
  <div id="div2">
     <div class="div2_1">
        <!-- <a href="#"><img src="../images/m9.jpg" class="img3" alt="广告2区"></a> -->
        <div class="banner" style="width:100%;height:130px;float:left;border: 1px solid black" id="c04">
	          <ul id="ul2">
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m4.jpg" class="img3" alt="习主席指示|早报"><span class="slider-title"><em></em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m8.jpg" class="img3" alt="恭喜xxxxx"><span class="slider-title"><em></em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m10.png" class="img3" alt="恭喜xxxxx"><span class="slider-title"><em></em></span></a></li>
		         <li class="slider-item"><a href="#"><img src="../houtai/images/m11.jpg" class="img3" alt="恭喜xxxxx"><span class="slider-title"><em></em></span></a></li> 
	        </ul>
	        <div id="progress2" class="progress"></div>
	<a href="javascript:void(0);" id="c_unslider-arrow04_1" class="unslider-arrow04 prev"><img class="arrow" id="al" src="../houtai/images/z1.png" alt="prev" width="10" height="25"></a>
	<a href="javascript:void(0);" id="c_unslider-arrow04_2" class="unslider-arrow04 next"><img class="arrow" id="ar" src="../houtai/images/z2.png" alt="next" width="10" height="25"></a>
	     </div>
     </div>
  </div>
  
      
      </div>
</body>
</html>