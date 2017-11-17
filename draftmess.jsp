<html>

<head>

<title>From</title>
<script>
function asdf()
{
document.f1.action="send.jsp";
}

function asdf2()
{
document.f1.to.value="";
document.f1.subject.value="";
document.f1.message.value="";
}
</script>

</head>
<form method="GET" name="f1">
<body>
<body>

<%				boolean valid=false;
		int messid=Integer.parseInt(request.getParameter("messid"));
		
		
		try
		{

				ps=con.prepareStatement("select * from draftdetails where messid=?");
				ps.setInt(1,messid);
				rs=ps.executeQuery();
					
				while(rs.next())
				{
%>				
		<table border="0" width="591" height="395" bgcolor="#CCCCFF" cellspacing="0">
	<tr>
		<td height="36" width="591" bgcolor="#808080">
		<font size="4" color="#FFFFFF" face="Segoe UI Semibold"><span style="background-color: #808080">
		Draft</span></font></td>
	</tr>
	<tr>
		<td height="21" width="591"><b><font face="Segoe UI Semibold">To</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		
						<input type="text" name="to" size="60" value="<%=rs.getString("to1")%>"></td>
	</tr>
	<tr>
		<td height="21" width="591"><b><font face="Segoe UI Semibold">Subject</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		
						<input type="text" name="subject" size="60"value="Re : <%=rs.getString("subject")%>"></td>
	</tr>
	<tr>
		<td height="274" width="591" style="font-family: Segoe UI Semibold">
		<textarea rows="17" name="message" cols="71"></textarea></td>
	</tr>
	<tr>
		<td height="29" width="591">
		
		<input type="submit" value="Send" name="B1" style="font-family: Segoe UI Semibold; font-weight: bold" onclick="asdf()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<input type="button" value="Discard" name="B3" style="font-family: Segoe UI Semibold" onclick="asdf2()"></td>
	</tr>
</table>
				
<%				
			
				}
%>				
				</table>
<%				
		}
		catch(Exception e)
		{
%>
	 <%=e%><%
	 }
	 %>

</body>
</form>
</html>