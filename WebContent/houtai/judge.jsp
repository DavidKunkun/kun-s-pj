<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript">
function judge(){
	var regBox = {  
			//邮箱  
            regEmail : /^([a-z0 -9_\. -]+)@([\da -z\. -]+)\.([a -z\.]{2,6})$/, 
            
            //用户名  
            regName : /^[a -z0 -9_ -]{3,16}$/, 
            
            //手机  手机号请输入第一位为1,第二位数字是3、4、5、8的十一位手机号
            regMobile : /^0?1[3|4|5|8][0 -9]\d{8}$/, 
            		
            //座机带区号  区号+电话号码 如0901-1234567,0901-12345678,010-1234567,010-12345678;		
            regTel1 : /^0[\d]{2,3} -[\d]{7,8}$/ , 
            
            //座机不带区号  如1234567,12345678
            regTel2 : /^[0 -9]{7,8}$/ , 
            
            //以下这个包括 手机 座机号 座机号带区号  
            regAll:  /(^[0-9]{3,4}\ -[0 -9]{3,8}$)|(^[0 -9]{3,8}$)|(^[0−9]3,4[0 -9]{3,8}$)|(^0{0,1}13[0 -9]{9}$)/  
          
            //非零正整数
            regNonzeroInteger=/^\+?[1-9][0-9]*$/,
            		
            /*日期 格式 yyyy-mm-dd  */
        	regDate_ymd = /^\d{4}\-\d{2}\-\d{2}$/, /*  /^(19|20)\d{2}((0\d{1})|10|11|12)$/ */
	
        	//日期格式yyyy 
        	regDate_y= /^(\d{4})$/, 

        	//日期格式yyyy-mm 
        	regDate_ym= /^(\d{4})-(0\d{1}|1[0-2])$/,

        	//时间格式hh 
        	regTime_h=/^(0\d{1}|1\d{1}|2[0-3])$/, 

        	//时间格式hh:mm 
        	regTime_hm=/^(0\d{1}|1\d{1}|2[0-3]):([0-5]\d{1})$/,

        	//时间格式hh:mm:ss 
        	regTime_hms=/^(0\d{1}|1\d{1}|2[0-3]):[0-5]\d{1}:([0-5]\d{1})$/,
	
	
	};
	 var mflag = regBox.regMobile.test(obj.value);  
	 var tflag1 = regBox.regTel1.test(obj.value); 
}
</script>
</head>
<body>

</body>
</html>