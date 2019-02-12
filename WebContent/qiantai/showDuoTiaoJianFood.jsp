<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>前台查询页面</title>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* if($("#fShengChanPiCiId").val()=="0"){
		$("#fShengChanPiCiId").val("");
	} */
	$("#hideshow").hide();
	$("#chaxun").click(function(){
		if($("#fShengChanPiCiId").val()!="" && $("#fShengChanPiCiId").val()!="0"){
			//校验是否是数字
			regNonzeroInteger=/^\+?[1-9][0-9]*$/;
			if(!regNonzeroInteger.test($("#fShengChanPiCiId").val())){
				alert("生产许可证编号均为数字，请确认后再输入");
				$("#fShengChanPiCiId").val("");
			}
		}else{
			$("#fShengChanPiCiId").val("0");
		}
		
		if($("#fCompanyId").val()!=""){
			//校验是否是数字
			regNonzeroInteger=/^\+?[1-9][0-9]*$/;
			if(!regNonzeroInteger.test($("#fCompanyId").val())){
				alert("生产公司编号均为数字，请确认后再输入");
				$("#fCompanyId").val("");
			}
		}else{
			$("#fCompanyId").val("0");
		}
		
		$.post("selFoodDuoTiaoJian.do",{fShengChanPiCiId:$("#fShengChanPiCiId").val(),fName:$("#fName").val(),fZhunRu:"准入",fCompanyId:$("#fCompanyId").val()},function(foods){
			var food = eval("("+foods+")");//得到数组类型的值
			//alert(food.length);
			$("#tb").empty();
			if(food.length==0){//如果长度为0
				$("#hideshow").show();
				$("#tb").empty();
				$("#thd").hide();
			}else{
				$("#hideshow").hide();
				$("#thd").show();
				//alert("dddddd");
				for(var i = 0 ; i<food.length;i++){
					var f = [];
					
					 f[0] = food[i].fId;
					 f[1] = food[i].fName;
					 f[2] = food[i].fTypeId;
					 f[3] = food[i].fCompanyId;
					 f[4] = food[i].fZhuangTai;
					 f[5] = food[i].fShengChanPiCiId;
					 f[6] = food[i].fZhunRu;
					 f[7] = food[i].fBirthtime;
					 f[8] = food[i].fEndtime; 
				    //alert(food[i].fId);
					var newTr = document.createElement("tr");
					for(var j=0;j<9;j++){
						var newTd = document.createElement("td");
						newTd.innerHTML=f[j];
						newTr.appendChild(newTd);
					}
					
					$("#tb").append(newTr);
					//alert("jjj");
				}
			}
			
			
		});
		
		
	});
	
});
</script>
</head>
<body>
<div>
   
   <!--  -->
   <div style="height: 60%;">
      <div>
          <div >
          <form id="selNameAndXKZform" action="selFoodDuoTiaoJian.do" method="post" enctype="application/x-www-form-urlencoded">
            <table style="border: solid thin black;align-content: center;">
               <tr>
                 <td>请输入想要查询的食品名称：</td>
                 <td>或者输入想要查询的食品许可证编号：</td>
                 <td>或者输入食品生产公司编号：</td>
               </tr>
               <tr>
                 <td><input id="fName" name="fName" maxlength="20" title="长度不超过20"/>
                 </td>
                 <td><input id="fShengChanPiCiId" name="fShengChanPiCiId" maxlength="20" title="长度不超过20且只能是整数"/>
                 </td>
                 <td><input id="fCompanyId" name="fCompanyId" maxlength="20" title="长度不超过20且只能是整数"/>
                 </td>
                 <td>
                 <input type="hidden" id="fZhunRu" name="fZhunRu" value="准入"/>
                 <input type="button" id="chaxun" name="chaxun" value="查询"/></td>
               </tr>
               
            </table>
         </form> 
         </div>
         <div style="margin-top: 20px;height:300px;">
         <input id="hideshow" value="暂无信息记录！"/>
  <table border="1px" style="border-collapse: collapse;">
    <thead id="thd" style="display:none;">
     <tr height="30px">
        <th>食品编号 </th>
        <th>名称 </th>
        <th>类型 </th>
        <th>归属公司编号 </th>
        <th>食品状态 </th>
        <th>许可证编号</th>
        <th>是否准入</th>
        <th>生产日期 </th>
        <th>保质日期 </th>
      </tr>
    </thead>
    <tbody id="tb">
    
    </tbody>
     
  </table>
  </div>
      
      </div>
   </div>
   
</div>
</body>
</html>