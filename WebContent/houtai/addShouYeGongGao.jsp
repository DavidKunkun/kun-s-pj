<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加首页公告信息</title>

<script type="text/javascript">
function yuLan(file){
	var a = file.files[0];//得到上传的文件
	//alert(file.value);
	/*判断是否是图片  */
    if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file.value)) {
		alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
		file.value="";
		document.getElementById("img").src="";
		return false;
	} 
	
	if(a.size>1024*1024*2){
		alert("您上传的照片大小为"+a.size/(1024*1024)+"M！请选择上传大小小于2M的图片");
		
		return false;
	}else{
		var url = window.URL.createObjectURL(a);   
		//blob路径
		alert(url);
		//$("#img").show();
		//$("#img").src=url;
		document.getElementById("img").src=url;
		document.getElementById("img").style.display="block";
	}
}

</script>
</head>
<body>
<%if(session.getAttribute("loginor")==null){ %>
  <div>超过5分钟未操作，您的登陆已失效！<br>
       <a href="../houtai/login.jsp" target="_top">返回登陆页面</a>
  </div>
  <%}else{ %>
<div>
<form name="form2" id="form2" method="post" action="" enctype="multipart/form-data" onsubmit="return check(form2);">
               <table align="center">
                  <tr height="29">
                     <td><font size="4">添加公告信息</font></td>
                  </tr>
                 <tr>
                      <td>
                                                                  公告标题：<input type="text" name="biaoti" maxlength="10"/>
                      </td>
                      
                   </tr>
                  <tr>
                  </tr>
                  <tr>
                    <td>
                                                               新闻图片：
                   <div id="localImag">  
                     <img src="" id="img" width="100px" height="120px" style="display:none"><br/>
                   </div>  
                  <input id="file" size="30" type="file" name="file" onchange="yuLan(this)" />(只能输入照片格式的文件)
                    </td>
                  </tr>
                  <tr>
                    <td>
                                                                正文：<textarea name="zhengwen" cols="30" rows="3">(输入长度不能超过500)</textarea>
                    </td>
                  </tr>
                  <tr>
                    <td>
                 <input name="submit" type="submit" size="30" value="确认添加" />
                    </td>
                    <td>
                 <input name="reset" type="reset" size="30" value="重置" />
                    </td>
                  </tr>
               </table>
           </form>
</div>
<%} %>
</body>
</html>