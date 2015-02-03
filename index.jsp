<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
request.setCharacterEncoding("utf-8");
String error = request.getParameter("error");
%>

<html>
  <head>
    <title>Handong Wiki</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
<link rel ="stylesheet" type="text/css" href="css/Wikicss.css">	<link rel="stylesheet" href="css/style.css">



	
<style type="text/css">
	
#Canvas {
		position:absolute;
		left:0px;
		top:0px;
	}
	.Component {
		white-space: nowrap;
	}
	.RelativeComponent {
		white-space: nowrap;
	}

	


#input_id{
	width:79px;
	background-color:#FFFFFF;
	color:#000000;
	font-size: 14px;
	font-style:normal;
	font-weight:normal;
	text-decoration:none;
	text-align:left;
}

#input_pass{
	width:79px;
	background-color:#FFFFFF;
	color:#000000;
	font-size: 14px;
	font-style:normal;
	font-weight:normal;
	text-decoration:none;
	text-align:left;
}

#icon{
	width:201px;
	height:53px;
	border:0px solid;
}

#iconlabel{
	font-size: 14px;
	font-style:normal;
	font-weight:normal;
	text-decoration:none;
	text-align:left;
}

#Reg{
}

#Reg. {
	width:74px;
	height:27px;
	font-size: 14px;
	font-style:normal;
	font-weight:normal;
	text-decoration:none;
}


#Login{
}

#Login. {
	width:61px;
	height:27px;
	font-size: 14px;
	font-style:normal;
	font-weight:normal;
	text-decoration:none;
}


#ID{
	width:26.400000000000002px;
	height:21px;
	font-size: 14px;
	font-style:normal;
	font-weight:normal;
	text-decoration:none;
	text-align:left;
	color:#000000;
}

#password{
	width:72.60000000000001px;
	height:21px;
	font-size: 14px;
	font-style:normal;
	font-weight:normal;
	text-decoration:none;
	text-align:left;
	color:#000000;
}

	</style>

	<%

 request.setCharacterEncoding("EUC-KR");

 Cookie[] cookies = request.getCookies();

 if(cookies!=null){

  for(int i=0;i<cookies.length;i++){

   if(cookies[i].getName().equals("hguwiki_login"))
	if(cookies[i].getValue().length() != 0)//("true"))
		response.sendRedirect("http://teamlion.cloudapp.net/mainpage.jsp");
	}}
   

    %>
	

  </head>
  
<body bgcolor="#000000">



<center>
</br></br></br></br>
<p><img id="icon" src="images/icon.JPG" class="Component Image" /></p>

<FORM name="register" method="post" action="login.jsp">
<p>
<span id="ID" style ="color:white" class="Component Label ">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspStuID : </span>
<input name = "input_id" id="input_id" type="text" value="" class="Component Textinput" />
</p>

<p><span id="password" style ="color:white" class="Component Label ">Password : </span>
<input name = "input_pw" id="input_pass" type="password" value="" class="Component Textinput" /></p>



<p><button id="Reg" type="button" class="Component Button btn" onclick = "location.href='wikiRegister.jsp'";>Register</button>&nbsp&nbsp

<button id="Login" type="submit" class="Component Button btn">Log-in</button></p>
</FORM>
<font color="red">
<%
if(error == null);
else if(error.equals("1"))
	out.print("잘못된 정보를 입력하셨습니다.");
else if(error.equals("2"))
	out.print("비밀번호를 잘못 입력하셨습니다.");

%>
</font>
</center>
</body>
</html>
