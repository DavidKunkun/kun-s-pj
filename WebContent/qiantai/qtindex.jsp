<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>前台页面</title>
</head>
<frameset rows="20%,*,15%" border="0px" style="padding: 2px;">
  <frame name="topFrame" src="top.jsp">
  <frameset cols="25%,*,15%">
		<frame name="leftFrame" src="left.jsp"/>
		<frame name="middleFrame" src="middle.jsp"/>
		<frame name="rightFrame" src="right.jsp"/>
  </frameset>
  <frame name="buttomFrame" src="bottom.jsp">
</frameset>
</html>