<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Compose</title>
</head>

<body>
<%@page import="java.sql.*" %>
<%!
Connection con ;
PreparedStatement ps ;
ResultSet rs ;%>
<%				
		String status="false";
		int count=0;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///jmail1","root","root123");
			

				ps=con.prepareStatement("select * from messdetails where status=? and to1=?");
				ps.setString(1,status);
				ps.setString(2,email);
				
				rs=ps.executeQuery();
					
				while(rs.next())
				{
					count++;
				}
%>				
<table border="0" width="111" height="442">
	<tr>
		<td height="23" width="101" align="left">&nbsp;</td>
	</tr>
	<tr>
		<td height="19" width="101">&nbsp;</td>
	</tr>
	<tr>
		<td height="23" width="101" align="left">&nbsp;</td>
	</tr>
	<tr>
		<td height="23" width="101" align="left">&nbsp;</td>
	</tr>
	<tr>
		<td height="27" width="101" align="left">&nbsp;</td>
	</tr>
	<tr>
		<td height="20" width="101"><a href="compose.jsp">Compose</a></td>
	</tr>
	<tr>
		<td height="21" width="101"><a href="inbox.jsp">Inbox(<%=count%>)</a></td>
	</tr>
	<tr>
		<td height="22" width="101"><a href="sentmain.jsp">Sent</a></td>
	</tr>
	<tr>
		<td height="19" width="101"><a href="draftmain.jsp">Draft</a></td>
	</tr>
	<tr>
		<td height="18" width="101"></td>
	</tr>
	<tr>
		<td height="20" width="101">&nbsp;</td>
	</tr>
	<tr>
		<td height="168" width="101">&nbsp;</td>
	</tr>

			
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

</html>