<html>

<head>

<title>From</title>
<script>
function del()
{
document.f1.action="deleteinside.jsp";

}
function reply()
{
{
document.f1.action="draft.jsp";

}

</script>	
</head>

<body>
<form name="f1" method="GET">
	
	<input type="hidden" name="messidhid" value="<%=request.getParameter("messid")%>"> 
	<input type="submit" value="Delete" name="delete" onclick="del()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="Reply" name="reply" onclick="reply()">
	
<%@page import="java.sql.*" %>
	
<%				String status1="true";

		int messid=Integer.parseInt(request.getParameter("messid"));
		
		 
	
		try
		{
			

				ps=con.prepareStatement("select * from messdetails where messid=?");
				ps.setInt(1,messid);
				rs=ps.executeQuery();
					
				while(rs.next())
				{
%>				
				
			
				<table border="0" width="500" height="330" cellspacing="0" cellpadding="0" bgcolor="#CCFFFF">
	<tr>
		<td height="27" width="278"><font face="Segoe UI Semibold"><b>From : <%=rs.getString("from1")%></b>
		</font></td>
		<td height="27" width="206"><font face="Segoe UI Semibold"><b>Date : <%=rs.getString("date")%></b>
		</font></td>
	</tr>
	<tr>
		<td height="26" width="500" colspan="2"><font face="Segoe UI Semibold">
		<b>Subject : <%=rs.getString("subject")%></b></font></td>
	</tr>
	<tr>
		<td height="25" width="500" colspan="2"><font face="Segoe UI Semibold">
		<b>Message</b></font></td>
	</tr>
	<tr>
		<td height="240" width="500" colspan="2" bgcolor="#FFFFCC"><pre><%=rs.getString("message")%><pre></td>
	</tr>
</table>
 
</form>
				
<%				
			}
			ps=con.prepareStatement("update messdetails set status=? where messid=?");
				ps.setString(1,status1);
				ps.setInt(2,messid);
				ps.executeUpdate();
				
%>				
				</table>
<%				
		}
		catch(Exception e)
		{
%>
	 <%=e%><%
	 }
	  finally
	{
		con.close();
		
		rs.close();
	}
	 %>

 
	 
</body>

</html>