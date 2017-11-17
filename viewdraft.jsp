
<%				
		
		try
		{
			

				ps=con.prepareStatement("select * from draftdetails where from1=? order by date desc");
				ps.setString(1,email);
				rs=ps.executeQuery();
%>				
				<table width="834" cellspacing="0" bgcolor="#FF9966">
				<tr><th width="251" align="left" bgcolor="#C0C0C0">
					<font face="Segoe UI Semibold" color="#FFFFFF">To</font></th>
					<th align="left" bgcolor="#C0C0C0">
					<font face="Segoe UI Semibold" color="#FFFFFF">Subject</font></th>
					<th width="218" align="left" bgcolor="#C0C0C0">
					<font face="Segoe UI Semibold" color="#FFFFFF">Message</font></th>
					<th width="156" align="left" bgcolor="#C0C0C0">
					<font face="Segoe UI Semibold" color="#FFFFFF">Date</font></th></tr>
<%					
				while(rs.next())
				{
%>				
			<tr style="cursor:pointer" ><td width="251" onclick="location.href='draftmess1.jsp?messid=<%=rs.getInt("messid")%>'"><%=rs.getString("to1")%></td>
				<td onclick="location.href='draftmess1.jsp?messid=<%=rs.getInt("messid")%>'"><%=rs.getString("subject")%></td>
			    <td width="218" onclick="location.href='draftmess1.jsp?messid=<%=rs.getInt("messid")%>'"><%=rs.getString("message").substring(0,4)+"......"%></td>
				<td width="156" onclick="location.href='draftmess1.jsp?messid=<%=rs.getInt("messid")%>'"><%=rs.getString("date")%></td></tr>
				
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