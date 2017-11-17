<%! String[] select; %>
<%				
		select = request.getParameterValues("C2");
		
		
		try
		{
			
				if (select != null) 
				{
				for (int i = 0; i < select.length; i++) 
					{
						ps=con.prepareStatement("delete from messdetails where messid=?");
						ps.setInt(1,Integer.parseInt(select[i]));
						ps.executeUpdate();
					}
				}
				
				
				
%>				<jsp:forward page="inbox.jsp"/>
<%
				
			
			
		}
		catch(Exception e)
		{
%>
	 <%=e%><%
	 }
	 %>