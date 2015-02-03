<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="wiki.*" %>

<%
request.setCharacterEncoding("utf-8");
String title = request.getParameter("title");
WikiController wiki = new WikiController();
//String content = wiki.getWikiForsearch(title).get(0).getContent();

%>
<html>
<head>
<script type="text/javascript" src="/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
var oEditors = [];
$(function(){
                    nhn.husky.EZCreator.createInIFrame({
                        oAppRef: oEditors,
                        elPlaceHolder: "ir1",
                        //SmartEditor2Skin.html ??? ???? ??
                        sSkinURI: "/SE2/SmartEditor2Skin.html",  
                        htParams : {
                            // ?? ?? ?? (true:??/ false:???? ??)
                            bUseToolbar : true,             
                            // ??? ?? ??? ?? ?? (true:??/ false:???? ??)
                            bUseVerticalResizer : true,     
                            // ?? ?(Editor | HTML | TEXT) ?? ?? (true:??/ false:???? ??)
                            bUseModeChanger : true,         
                            fOnBeforeUnload : function(){
                                 
                            }
                        }, 
                        fOnAppLoad : function(){
                            //?? ??? ??? text ??? ????? ????? ?? ??
                            oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
                        },
                        fCreator: "createSEditor2"
                    });
});
</script>

</head>
<body>
<form id = "frm" action="/insertedit.jsp" method = "post" >
<table width = "100%">
	<tr>
		<td>keyword</td>
		<td><input type="text" name="keyword" readonly value="<%out.print(title);%>"/></td>
	</tr>
	<tr>
		<td>contents</td>
		<td>
			<textarea rows="10" cols="30" id="ir1" name="content" style="width:766px; height:412px; ">
			<%
			try{
			out.print(wiki.getWikiForsearch(title).get(0).getContent());
			}catch(Exception e){
			out.print("invalid access");
			}
			%>
			</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" id="save" value="Submit"/>
			<input type="button" value="cancel" onclick ="window.close();"/>
		</td>
	</tr>
</table>
</form>
</body>
<script>
$("#save").click(function(){
    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
    $("#frm").submit();
})
</script>
</html>