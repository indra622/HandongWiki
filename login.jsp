 <%@ page contentType="text/html;charset=EUC_KR" pageEncoding="EUC-KR"%>
 <%@ page import="java.net.*"%>
  <%@ page import="user.*" %>
 <%@ page import="java.util.*" %>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel ="stylesheet" type="text/css" href="css/Wikicss.css">

<%String id = request.getParameter("input_id");%>
<%String pw = request.getParameter("input_pw");
	if(id.length() > 0)
%>
<% UserController userControl = new UserController();
    User user = userControl.login(id);
	if(user.getStuId() == null){
		response.sendRedirect("http://teamlion.cloudapp.net?error=1");
		return;
	}
	AES256CryptTool aes = new AES256CryptTool();
	String password = aes.Decryption(user.getPassword(),"67890123456789ab");
	
	
    if(id.equals(user.getStuId())){
		if(pw.equals(password)){
			Cookie hguwiki_login = new Cookie("hguwiki_login", id);
			hguwiki_login.setMaxAge(60*60/2);
			response.addCookie(hguwiki_login);
			response.sendRedirect("http://teamlion.cloudapp.net/");
		}
		else{
			response.sendRedirect("http://teamlion.cloudapp.net?error=2");
			return;
		}%>
			 <script type="text/javascript">
				alert("Wrong ID or password");
				sleep(3000);
				</script>
			<center>
			<br/><br/><br/><br/><br/><br/><br/>
			<input type = "button" onclick="location.href='http://teamlion.cloudapp.net'" value="to Login page"/>&nbsp&nbsp&nbsp&nbsp
			<input type = "button" onclick="location.href='http://teamlion.cloudapp.net/wikiRegister.jsp'" value="Register"/>
			</center>
		<%
		
	}else{
%>
			 <script type="text/javascript">
				alert("Unexpected Error");
				sleep(3000);
				</script>
			<center>
			<br/><br/><br/><br/><br/><br/><br/>
			<input type = "button" onclick="location.href='http://teamlion.cloudapp.net'" value="to Login page"/>&nbsp&nbsp&nbsp&nbsp
			<input type = "button" onclick="location.href='http://teamlion.cloudapp.net/wikiRegister.jsp'" value="Register"/>
			</center>
		<%

	}
		%>
