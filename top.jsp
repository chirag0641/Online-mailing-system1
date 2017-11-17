<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Weclome</title>

</head>
	
<body>
	
<table border="0" width="1366" height="60">
	<tr>
		<td height="60" width="482">
		<a href="opening.jsp"><img border="0" src="webmakers.jpg" width="265" height="62"></a></td>
		<%
String email=(String)session.getAttribute("obj");
if(session.isNew() || session == null)
		{
			response.sendRedirect("index.htm");
		}
		%>
		<td height="60" width="622" style="color: #800080; font-family:Segoe UI Semibold; font-weight:bold">Weclome <%=email%></td>
		<td height="60" width="115" style="color: #3366CC; font-family:Segoe UI Semibold; font-weight:bold" align="center">
		<a href="settings.jsp">Settings</a></td>
		<td height="60" width="96" style="font-family: Segoe UI Semibold; font-weight: bold; color: #3366CC" align="center">
		<p align="center"><a href="signout.jsp">Signout</a></td>
	</tr>
</table>

</body>

</html>