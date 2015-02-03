<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.*"%>
<%@ page import="wiki.*" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0, width=device-width, height=device-height">
	<title> Handong Wiki </title>
   <%
	request.setCharacterEncoding("utf-8");
	WikiController wikiController = new WikiController();
	Vector<String> rank = new Vector<String>();
	rank = wikiController.getRank();
	Cookie[] cookies = request.getCookies();
	if(cookies.length == 1)
		response.sendRedirect("http://teamlion.cloudapp.net/");
    %>
	
    <link rel = "stylesheet" type = "text/css" href = "styles.css" />
	<% 
		Vector<Wiki> wikiVector = new Vector<Wiki>();
		String search = request.getParameter("search");
		if(search == null){
			search = "FrontPage";
		}
		else if(search ==""){
			response.sendRedirect(request.getHeader("referer"));
		}


	%>
	<script type="text/javascript">
		function popupOpenEdit(){
			var popUrl = "edit.jsp"+"?title="+"<%=search%>";   
			var popOption = "width=1000, height=540, resizable=no, scrollbars=no, status=no;";
			window.open(popUrl,"",popOption);
		}
		
		function popupOpenWrite(){
			var popUrl = "write.jsp"+"?title="+"<%=search%>";   
			var popOption = "width=1000, height=540, resizable=no, scrollbars=no, status=no;";
			window.open(popUrl,"",popOption);
		}
    </script>
</head>

<body bgcolor="#505050">	
	<div class="root root-article">
		<header>
			<nav>
				<div align="right">
				<%for(int i=0;i<cookies.length;i++){
					if(cookies[i].getName().equals("hguwiki_login"))
						out.print("["+cookies[i].getValue() + "]님, 환영합니다!" + "&nbsp"); 
				}%>
				<input type="button" value="Logout" onclick="location.href='http://teamlion.cloudapp.net/delCookie.jsp'" />
				</div>
				<a href="http://teamlion.cloudapp.net"><img src = "images/icon.JPG" height = "60"></a><br/>
				<form name="search" action="mainpage.jsp" method="get">
					<input type="text" name="search">
					<input type ="submit" value="Search">
				</form> 
				<div align="right">
				<h3>
				실시간 검색어 TOP 5: &nbsp&nbsp
				<%for(int i = 0 ; i< 5 ; i++){
					out.print("<a href=\"http://teamlion.cloudapp.net/mainpage.jsp?search=" + rank.get(i) + "\" >" +(i+1)+"." + rank.get(i) + "</a>");
					out.print("&nbsp&nbsp");
				}
				%>
				
				</h3>
				
				
				
				</div>
			</nav>
			
	
		</header>
	
		<div id="_core">
			<h1 class="wikiTitle">
				<% out.println(search); %>
			</h1>
			<% if(!search.equals("FrontPage")){%>
			<a align="right" type = "submit" href = "javascript:popupOpenEdit();"><input type="button" value="edit"></a>
			<% } %>
		</div>

		<div id="_core">
			<div class="body">
				<article>
					<div class="section">
						<h2 id="line-2">
							
						</h2>
						<div id="align-4">
							<%
							try{
								wikiVector = wikiController.getWikiForsearch(search);
								wikiController.incrementHit(search);
								out.print(wikiVector.get(0).getContent());
							}catch(Exception e){
								out.print("자료가 없습니다. 아래 버튼을 클릭하여 새로 작성해주세요." + "<br><br>");
								%><a class="wiki" href="javascript:popupOpenWrite();"><input type="button" value="write"> </a>
							<%}%> 
							<br><br>
						</div>
					</div>	
				</article>
				<div class="seperator">
					<hr></hr>
					이 항목의 내용은  한동 위키의 공식적인 입장과는 무관하며 수많은 개인 사용자들이 작성한 것으로, 각 항목의 내용은 운영진이 통제하고 있지 않고 자유롭게 작성되고 있습니다. 오해하지 말아 주십시요.
각 항목에 인용 및 사용된 스크린샷과 캡쳐 이미지 및 동영상의 원저작권은 제작사 및 퍼블리싱사에 있으며, 확인되지 않은 사실의 추가 첨삭 혹은 저작물의 인용등으로 일어나는 지적재산권의 침해등으로 발생하는 민형사상의 책임은 전적으로 해당 내용을 추가한 작성자가 부담하여야 합니다.<br><br>
					all right reserved 
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
