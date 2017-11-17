	<%@page import="java.sql.*,java.util.Date" %>
<%			Date d=new Date();
		String dd=d.getDate()+"/"+(d.getMonth()+1)+"/"+(d.getYear()+1900);
		
		try
		{
			
				ps=con.prepareStatement("select * from messdetails where to1=? order by date desc ");
				ps.setString(1,email);
				rs=ps.executeQuery();
%>				<html>
				<head>
				<script>
				function asdf(a)
				{
				var checkboxes = document.getElementsByName('C2');
				for(var i=0;i<checkboxes.length;i++)
				{
				if (checkboxes[i] != a)
                checkboxes[i].checked = a.checked;
				}			
				}
				</script>
				</head>
				<body>
				<form method="get" action="delete1.jsp">
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>
					<input type="submit" value="Delete" name="B1" style="font-family: Segoe UI Semibold; font-weight: bold; padding-left: 2px; padding-right: 2px; padding-top: 1px; padding-bottom: 1px"></p>
					<p><input type="checkbox" name="C1" value="ON" onclick="asdf(this)">&nbsp;&nbsp;<b><font face="Segoe UI Semibold" color="#008080" size="2">Select 
					All</font></b></p>

				<table width="756" cellspacing="0" bgcolor="#99CCFF">
				<tr><th width="76" align="left" bgcolor="#C0C0C0">
					&nbsp;</th>
					<th width="197" align="left" bgcolor="#C0C0C0">
					<font face="Segoe UI Semibold" color="#FFFFFF">From</font></th>
					<th align="left" bgcolor="#C0C0C0" width="180">
					<font face="Segoe UI Semibold" color="#FFFFFF">Subject</font></th>
					<th width="156" align="left" bgcolor="#C0C0C0">
					<font face="Segoe UI Semibold" color="#FFFFFF">Message</font></th>
					<th width="137" align="left" bgcolor="#C0C0C0">
					<font face="Segoe UI Semibold" color="#FFFFFF">Date/Time</font></th></tr>
<%
				while(rs.next())
				{

					if(rs.getString("status").equals("true"))
					
%>
						<tr bgcolor="orange" style="cursor:pointer" >
<%						
					
					if(rs.getString("status").equals("false"))
					
%>						<tr bgcolor="yellow" style="cursor:pointer" >
						
					
					<td width="76"><input type="checkbox" name="C2" value="<%= rs.getInt("messid") %>"></td>
				<td width="197" onclick="location.href='readmess1.jsp?messid=<%=rs.getInt("messid")%>'"><%=rs.getString("from1")%></td>
						
					
					
				
				<td width="180" onclick="location.href='readmess1.jsp?messid=<%=rs.getInt("messid")%>'"><%=rs.getString("subject")%></td>
			    <td width="156" onclick="location.href='readmess1.jsp?messid=<%=rs.getInt("messid")%>'"><%=rs.getString("message").substring(0,4)+"......"%></td>

				<%
					if(rs.getString("date").substring(0,dd.length()).equals(dd)==true){
				%>
					<td width="145" onclick="location.href='readmess1.jsp?messid=<%=rs.getInt("messid")%>'"><% out.print(rs.getString("date").substring(dd.length()+1));%></td>
					<%}else{%>
				<td width="8" onclick="location.href='readmess1.jsp?messid=<%=rs.getInt("messid")%>'" ><%out.print(rs.getString("date"));%></td>
					<%}%>			



<%
}
%>				
				</table>
				</form>
				</body>
				</html>
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