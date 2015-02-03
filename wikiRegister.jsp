<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%request.setCharacterEncoding("utf-8");
	String duplicate = request.getParameter("duplicate");
%>
<html>
	<head>
		<title>Handong Wiki Registeration</title>
		<SCRIPT type ="text/javascript">

		</SCRIPT>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css"><link rel ="stylesheet" href="css/Wikicss.css">

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

			#id{
				width:79px;
				background-color:#FFFFFF;
				color:#000000;
				font-size: 14px;
				font-style:normal;
				font-weight:normal;
				text-decoration:none;
				text-align:left;
			}

			#name{
				width:79px;
				background-color:#FFFFFF;
				color:#000000;
				font-size: 14px;
				font-style:normal;
				font-weight:normal;
				text-decoration:none;
				text-align:left;
			}

			#pass{
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

			#Reg. {
				width:74px;
				height:27px;
				font-size: 14px;
				font-style:normal;
				font-weight:normal;
				text-decoration:none;
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
				width:26.4px;
				height:21px;
				font-size: 14px;
				font-style:normal;
				font-weight:normal;
				text-decoration:none;
				text-align:left;
				color:#000000;
			}

			#password{
				width:72.6px;
				height:21px;
				font-size: 14px;
				font-style:normal;
				font-weight:normal;
				text-decoration:none;
				text-align:left;
				color:#000000;
			}
			#Name{
				width:72.6px;
				height:21px;
				font-size: 14px;
				font-style:normal;
				font-weight:normal;
				text-decoration:none;
				text-align:left;
				color:#000000;
			}

		</style>
	</head>
	<body>
		<center>
		<br/><br/><br/><br/>
		<p>
		<img id="icon" src="images/icon.JPG" class="Component Image" /></p>

		<FORM name="register" method="post" action="register.jsp">
		<!--<p>
		<span id="Name" style ="color:white" class="Component Label ">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		Name : </span>
		<input name = "input_name" id="name" type="text" value="" class="Component Textinput" />
		</p>
		-->
		<p>
		<span id="ID" style ="color:white" class="Component Label ">ID(Student ID) : </span>
		<input name = "input_id" id="id" type="text" value="" class="Component Textinput" />  
		</p>

		<p>
		<span id="password" style ="color:white" class="Component Label ">
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		Password : </span>
		<input name = "input_pw" id="pass" type="password" value="" class="Component Textinput" />
		</p>


		<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<button id="Reg" type="submit" class="Component Button btn">Register</button>
		</p>

		</FORM>
		<font color="red">
		<%if(duplicate == null);
			else
				out.print("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp학번이 중복되었거나 형식이 잘못되었습니다.");
		%>
		</font>
		</center>
	</body>
</html>
